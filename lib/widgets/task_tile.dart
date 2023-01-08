import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  bool? isChecked;
  final String title;
  final Function(bool?) toggleCheckboxState;
  TaskTile(
      {required this.title, this.isChecked, required this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          decoration: isChecked! ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: toggleCheckboxState,
      ),
    );
  }
}
