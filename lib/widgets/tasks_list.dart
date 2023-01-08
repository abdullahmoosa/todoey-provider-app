import 'package:flutter/material.dart';
import './task_tile.dart';
import '../models/task.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final List<Task> tasks = Provider.of<Tasks>(context).tasks;
    return Consumer<Tasks>(
      builder: (context, taskValue, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskValue.tasks[index];
            return GestureDetector(
              onLongPress: () {
                taskValue.removeTask(index);
              },
              child: TaskTile(
                isChecked: task.isTaskDone,
                title: task.taskTitle,
                toggleCheckboxState: (checkboxState) {
                  taskValue.updateTask(task);
                },
              ),
            );
          },
          itemCount: taskValue.tasks.length,
        );
      },
    );
  }
}


// toggleCheckboxState: (bool? checkboxState) {
//           // setState(() {
//           //   isChecked = checkboxState;
//           // });
//         },