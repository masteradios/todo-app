import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/screens/main_screen.dart';
import 'package:todo_app/screens/task_screen.dart';
import 'package:todo_app/widgets/colors.dart';
import 'package:todo_app/widgets/task.dart';
import 'package:todo_app/widgets/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context)=>TaskData(),
      builder: (context,child)
      {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        );
      }
    );
  }
}


