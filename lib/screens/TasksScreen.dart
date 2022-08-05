import 'package:flutter/material.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';
import 'package:todo/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(),
              )));
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                    backgroundColor: Colors.white,
                  radius: 30.0,
                    child: Icon(Icons.list, size: 30.0, color: Colors.lightBlueAccent,
                    ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('Todoey',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                ),),
                Text('${Provider.of<TaskData>(context).taskCount} Tasks',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                  ),
              ],
            ),
          ),
          Expanded(child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: TaskList(),
          ))
        ],
      ),
    );
  }
}

