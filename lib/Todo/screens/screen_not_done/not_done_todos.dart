import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo/Todo/screens/screen_all/all_todos.dart';
import 'package:todo/Todo/screens/screen_not_done/todo_crud_not_done/todo_crud_not_done.dart';
import '../../screen_photo/photo.dart';
import '../../store/todo_state.dart';
import '../screen_done/done_todos.dart';
import '../screen_all/search_all_todo.dart';

class NotDoneTodos extends StatefulWidget {
  const NotDoneTodos({
    Key? key,
    required this.todoState,
    this.all0 = 0,
    this.done1 = 1,
    this.notDone2 = 2,
  }) : super(key: key);

  final TodoState todoState;
  final int all0;
  final int done1;
  final int notDone2;

  @override
  State<NotDoneTodos> createState() => _NotDoneTodosState();
}

class _NotDoneTodosState extends State<NotDoneTodos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Not done todos',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 20,
                  ),
                  content: const SizedBox(
                    child: Text(
                      'Are you sure you want to delete all todos ?',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 8.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: TextButton(
                              onPressed: () {
                                widget.todoState.removeAll(
                                  widget.notDone2,
                                );
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Delete',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
                Icons.delete,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchAllTodo(
                    todoState: widget.todoState,
                    all_index: widget.notDone2,
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
                Icons.search,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          return Visibility(
            visible: widget.todoState.notDoneTodos.isEmpty,
            replacement: ListView.builder(
              itemCount: widget.todoState.notDoneTodos.length,
              itemBuilder: (context, index) {
                return TodoCardNotDone(
                  todoState: widget.todoState,
                  index: index,
                );
              },
            ),
            child: const Photo(),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        currentIndex: widget.todoState.currentIndex,
        selectedItemColor: Colors.white10,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.all_inclusive,
            ),
            label: 'All',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_box_outlined,
            ),
            label: 'Done',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.square_outlined,
            ),
            label: 'Not Done',
            backgroundColor: Colors.white,
          ),
        ],
        onTap: (index) {
          widget.todoState.checkScreen(index);
          if (index != widget.notDone2) {
            setState(
              () {
                if (index == widget.all0) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => AllTodos(
                        todoState: widget.todoState,
                      ),
                    ),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => DoneTodos(
                        todoState: widget.todoState,
                      ),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
