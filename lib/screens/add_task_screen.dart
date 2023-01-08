// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import '../main.dart';

String textFieldText = '';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xff757575),
      decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      )),
      child: Padding(
        padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                focusColor: Colors.blue,
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                  width: 20.0,
                  color: Colors.blue,
                )),
              ),
              onChanged: (value) {
                textFieldText = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                // addTaskCallback(textFieldText);
                Provider.of<Tasks>(context, listen: false)
                    .addTask(textFieldText);
                Navigator.pop(context);
              },
              child: Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
