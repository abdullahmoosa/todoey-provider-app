import 'package:flutter/cupertino.dart';

class Task {
  String taskTitle;
  bool? isTaskDone;

  Task({required this.taskTitle, this.isTaskDone = false});

  void toggleTaskState() {
    isTaskDone = !isTaskDone!;
  }
}
