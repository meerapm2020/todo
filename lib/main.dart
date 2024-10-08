import 'package:flutter/material.dart';
import 'package:todo/new.dart';
import 'package:todo/todoscreen.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      home: TodoApp(),
    );
  }
}
