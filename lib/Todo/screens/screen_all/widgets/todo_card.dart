import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo/Todo/screens/screen_all/todo_view.dart';
import 'package:todo/Todo/store/todo_state.dart';
import 'get_color.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({
    Key? key,
    required this.todoState,
    required this.index,
    this.all0 = 0,
  }) : super(key: key);

  final TodoState todoState;
  final int index;
  final int all0;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TodoView(
              todo: widget.todoState.todos[widget.index],
              todoState: widget.todoState,
              index: widget.index,
            ),
          ),
        );
      },
      child: Dismissible(
        key: ValueKey(
          widget.todoState.todos[widget.index].id,
        ),
        background: Container(
          color: Colors.red,
          child: const Icon(
            Icons.delete,
          ),
        ),
        onDismissed: (_) {
          widget.todoState.removeTodo(
            widget.todoState.todos[widget.index],
            widget.all0,
          );
        },
        child: Card(
          color: GetColor.getColor(
            widget.index,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Observer(
              builder: (context) {
                return SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.todoState.todos[widget.index].title,
                            style: const TextStyle(
                              fontSize: 28,
                            ),
                          ),
                          Transform.scale(
                            scale: 1.2,
                            child: Observer(
                              builder: (context) {
                                final todo =
                                    widget.todoState.todos[widget.index];
                                return Checkbox(
                                  value: todo.isCheck,
                                  activeColor: Colors.green,
                                  onChanged: (newBool) {
                                    setState(
                                      () {
                                        widget.todoState.isChekedTodo(
                                          widget.index,
                                          newBool!,
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.todoState.todos[widget.index].description,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
