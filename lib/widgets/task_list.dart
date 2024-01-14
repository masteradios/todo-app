import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todo_app/widgets/colors.dart';
import 'package:todo_app/widgets/task_data.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TaskList extends StatelessWidget {

  Alert deleteTask(BuildContext context, taskData, task) {
    return Alert(
      context: context,
      style: AlertStyle(titleStyle: TextStyle(fontSize: 15)),
      desc: "Are you sure you want to delete this task?",
      buttons: [
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            taskData.deletetask(task);
            Navigator.pop(context);
          },
          color: bg_color,
        ),
        DialogButton(
          color: bg_color,
          child: Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return taskData.taskCount>0?ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              task_title: task.task_title,
              isDone: task.isDone,
              checkBoxCallback: (newValue) {
                taskData.updateTask(taskData.tasks[index]);
              },
              longPressCallback: () {
                deleteTask(context, taskData, task).show();
              },
            );
          },
          itemCount: taskData.tasks.length,
        ):Center(child: Text('Add Tasks',style: TextStyle(fontSize: 25,color: bg_color,fontWeight: FontWeight.bold),));
      },
    );
  }
}
