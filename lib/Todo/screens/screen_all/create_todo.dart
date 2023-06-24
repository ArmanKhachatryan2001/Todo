import 'package:flutter/material.dart';
import 'package:todo/Todo/store/todo_state.dart';
import 'package:todo/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({
    Key? key,
    required this.todoState,
  }) : super(key: key);

  final TodoState todoState;

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  bool get todoCreated =>
      titleController.text.isNotEmpty && descriptionController.text.isNotEmpty;

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
              left: 8,
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
            onPressed: () async {
              final todo = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Icon(
                    Icons.info,
                    color: Colors.white,
                    size: 20,
                  ),
                  content: const SizedBox(
                    child: Text(
                      'Save changes ?',
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
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: TextButton(
                              onPressed: () {
                                if (todoCreated) {
                                  Navigator.pop(
                                    context,
                                    TodoModel(
                                      title: titleController.text,
                                      description: descriptionController.text,
                                      id: const Uuid().v4(),
                                      isCheck: false,
                                    ),
                                  );
                                }
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
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Discard',
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
              if (todo is TodoModel) {
                widget.todoState.addTodo(todo);
                Navigator.pop(context);
              }
            },
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(
                Icons.save,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(
                fontSize: 28,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
              ),
            ),
            TextFormField(
              controller: descriptionController,
              style: const TextStyle(
                fontSize: 18,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Description...',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
