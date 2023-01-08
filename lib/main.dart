import 'package:flutter/material.dart';
import './screens/task_screen.dart';
import 'package:provider/provider.dart';
import './models/task.dart';
import 'dart:collection';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Tasks(),
        ),
      ],
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}

class Tasks extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(taskTitle: 'Buy some bread'),
    Task(taskTitle: 'Buy some milk'),
    Task(taskTitle: 'Buy a Book'),
  ];

  List<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskLength {
    return _tasks.length;
  }

  void addTask(String taskTitle) {
    _tasks.add(
      Task(taskTitle: taskTitle),
    );
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleTaskState();
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
