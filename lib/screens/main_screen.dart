import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/task_data.dart';
import '../widgets/colors.dart';
import 'add_task_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static DateTime date = DateTime.now();
  static String dateFormat = DateFormat('MMMM').format(date);
  String today_date =
      dateFormat + ' ' + date.day.toString() + ', ' + date.year.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_color,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Todoey',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 50),
                  ),
                  Text(
                    today_date,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).taskCount} Tasks',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    Provider.of<TaskData>(context).taskCount > 0
                        ? 'Boo!! I have to work :('
                        : 'Yay ! No work to do',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),

                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: TasksScreen(),
          )),
        ],
      ),
      floatingActionButton: AddTaskScreen(),
    );
  }
}
