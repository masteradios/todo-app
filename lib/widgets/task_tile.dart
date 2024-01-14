import 'package:flutter/material.dart';
import 'package:todo_app/widgets/colors.dart';
class TaskTile extends StatelessWidget {
  final task_title;
  final isDone;
  final checkBoxCallback;
  final longPressCallback;
  TaskTile({this.task_title,this.isDone,this.checkBoxCallback,this.longPressCallback});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        task_title,
        style: TextStyle
          (
            decoration: isDone?TextDecoration.lineThrough:null
        ),
      ),
      trailing: Checkbox(
        activeColor: bg_color,
        value: isDone,
        onChanged: checkBoxCallback,
      ),
    );
  }
}
