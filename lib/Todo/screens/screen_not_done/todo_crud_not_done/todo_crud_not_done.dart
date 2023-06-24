import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../store/todo_state.dart';
import '../../screen_all/widgets/get_color.dart';
import '../todo_view_not_done.dart';

class TodoCardNotDone extends StatefulWidget {
  const TodoCardNotDone({
    Key? key,
    required this.todoState,
    required this.index,
    this.notDone2 = 2,
  }) : super(key: key);

  final TodoState todoState;
  final int index;
  final int notDone2;

  @override
  State<TodoCardNotDone> createState() => _TodoCardNotDoneState();
}

class _TodoCardNotDoneState extends State<TodoCardNotDone> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TodoViewNotDone(
              todo: widget.todoState.notDoneTodos[widget.index],
              todoState: widget.todoState,
              index: widget.index,
            ),
          ),
        );
      },
      child: Dismissible(
        key: ValueKey(
          widget.todoState.notDoneTodos[widget.index].id,
        ),
        background: Container(
          color: Colors.red,
          child: const Icon(
            Icons.delete,
          ),
        ),
        onDismissed: (_) {
          widget.todoState.removeTodo(
            widget.todoState.notDoneTodos[widget.index],
            widget.notDone2,
          );
        },
        child: Card(
          color: GetColor.getColor(widget.index),
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
                            widget.todoState.notDoneTodos[widget.index].title,
                            style: const TextStyle(
                              fontSize: 28,
                            ),
                          ),
                          Transform.scale(
                            scale: 1.2,
                            child: Observer(
                              builder: (context) {
                                final todo =
                                    widget.todoState.notDoneTodos[widget.index];
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
                        widget.todoState.notDoneTodos[widget.index].description,
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
