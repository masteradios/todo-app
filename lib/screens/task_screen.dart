import "package:flutter/material.dart";

import "../widgets/task.dart";
import "../widgets/task_list.dart";



class TasksScreen extends StatefulWidget {


  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return TaskList();
  }
}




