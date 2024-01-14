import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/task.dart';
import 'package:todo_app/widgets/task_data.dart';
import 'package:todo_app/widgets/task_list.dart';
import 'colors.dart';
class AddNewTask extends StatelessWidget {

TextEditingController _controller=TextEditingController();

String newtask='';

  void popKeyboard(context)
  {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.75,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Add Task',
              style: TextStyle(color: bg_color, fontSize: 30),
            ),
          ),
          TextField(
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.text,
            autofocus: true,
            onChanged: (newValue)
            {
              newtask=newValue;
            },
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                labelStyle: TextStyle(color: bg_color),
                focusColor: Colors.black),
            style: TextStyle(),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: bg_color),
            child: TextButton(
              onPressed: ()
              {
                Provider.of<TaskData>(context,listen: false).addtask(newtask);
                popKeyboard(context);
                Navigator.of(context).pop();
              },
              child: Text(
                'Add',
                style: TextStyle(fontSize: 20,color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
