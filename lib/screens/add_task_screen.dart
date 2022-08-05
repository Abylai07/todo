import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';
import 'package:todo/models/task_data.dart';


class AddTaskScreen extends StatelessWidget {
  String newTaskTitle = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 30
            ),),
             TextField(
              textAlign: TextAlign.center,
              cursorColor: Colors.lightBlueAccent,
              autofocus: true,
              onChanged: (newText){
                newTaskTitle = newText;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FlatButton(onPressed: (){
              Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
              Navigator.pop(context);
            },
              color: Colors.lightBlueAccent,
              child: const Text('ADD', style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
