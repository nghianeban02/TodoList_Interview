import 'package:flutter/material.dart';
import 'package:todolist_interview/screen/todoscreen.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "To do List",
      theme:  ThemeData(
        primarySwatch: Colors.blue
      ),
      home:  TodoScreen(),
    );
  }
}