import 'package:flutter/material.dart';
import '../widgets/add_new_task.dart';

class AddTaskScreen extends StatelessWidget {
  final Color bg_color = Color.fromARGB(255, 98, 197, 244);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: ()
      {
        showModalBottomSheet(context: context, builder:(context)=>AddNewTask());
      },
      backgroundColor: bg_color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
    );
  }
}


