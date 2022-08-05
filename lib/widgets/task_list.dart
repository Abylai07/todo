import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/widgets/task_tile.dart';
import 'package:todo/models/task_data.dart';


class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(itemBuilder: (context, index){
          final task = taskData.tasks[index];
          return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              toggleCheckbox:  (newValue) {
                taskData.updateTask(task);
              },
              longPressCallback: (){
                taskData.removeTask(task);
          },
          );
        },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}