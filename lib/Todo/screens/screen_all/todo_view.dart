import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo/Todo/screens/screen_all/update_todo.dart';
import 'package:todo/Todo/store/todo_state.dart';
import '../../../models/todo_model.dart';

class TodoView extends StatefulWidget {
  const TodoView({
    Key? key,
    required this.todo,
    required this.todoState,
    required this.index,
  });

  final TodoModel todo;
  final TodoState todoState;
  final int index;

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: const Align(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UpdateTodo(
                    todo: widget.todo,
                    todoState: widget.todoState,
                  ),
                ),
              );
            },
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Observer(
          builder: (context) {
            return Column(
              children: [
                Text(
                  widget.todoState.todos[widget.index].title,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.todoState.todos[widget.index].description,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
