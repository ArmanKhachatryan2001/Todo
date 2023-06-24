import 'package:flutter/material.dart';
import 'package:todo/Todo/screens/screen_all/all_todos.dart';
import 'package:todo/Todo/store/todo_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TodoState _todoState = TodoState();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: AllTodos(todoState: _todoState,),
    );
  }
}
