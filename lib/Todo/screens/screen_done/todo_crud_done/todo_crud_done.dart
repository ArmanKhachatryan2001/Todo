import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../store/todo_state.dart';
import '../../screen_all/widgets/get_color.dart';
import '../todo_view_done.dart';

class TodoCardDone extends StatefulWidget {
  const TodoCardDone({
    Key? key,
    required this.todoState,
    required this.index,
    this.done1 = 1,
  }) : super(key: key);

  final TodoState todoState;
  final int index;
  final int done1;

  @override
  State<TodoCardDone> createState() => _TodoCardDoneState();
}

class _TodoCardDoneState extends State<TodoCardDone> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TodoViewDone(
              todo: widget.todoState.doneTodos[widget.index],
              todoState: widget.todoState,
              index: widget.index,
            ),
          ),
        );
      },
      child: Dismissible(
        key: ValueKey(
          widget.todoState.doneTodos[widget.index].id,
        ),
        background: Container(
          color: Colors.red,
          child: const Icon(
            Icons.delete,
          ),
        ),
        onDismissed: (_) {
          widget.todoState.removeTodo(
            widget.todoState.doneTodos[widget.index],
            widget.done1,
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
                            widget.todoState.doneTodos[widget.index].title,
                            style: const TextStyle(
                              fontSize: 28,
                            ),
                          ),
                          Transform.scale(
                            scale: 1.2,
                            child: Observer(
                              builder: (context) {
                                final todo =
                                    widget.todoState.doneTodos[widget.index];
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
                        widget.todoState.doneTodos[widget.index].description,
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
