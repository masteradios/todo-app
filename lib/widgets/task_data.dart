import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:todo_app/widgets/task.dart';
class TaskData extends ChangeNotifier
{
  List<Task> _tasks=[

  ];

  UnmodifiableListView<Task> get tasks
  {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount
  {
    return _tasks.length;
  }
  void addtask(String newTaskTitle)
  {
    final task=Task(task_title: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task)
  {
    task.toggleCheckBox();
    notifyListeners();
  }

  void deletetask(Task task)
  {
    _tasks.remove(task);
    notifyListeners();
  }
}