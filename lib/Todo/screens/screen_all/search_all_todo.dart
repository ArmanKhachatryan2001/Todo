import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:todo/Todo/screen_photo/photo.dart';
import 'package:todo/Todo/screens/screen_all/todo_view.dart';
import 'package:todo/Todo/screens/screen_all/widgets/get_color.dart';
import '../../../models/todo_model.dart';
import '../../store/todo_state.dart';

class SearchAllTodo extends StatefulWidget {
  const SearchAllTodo({
    Key? key,
    required this.todoState,
    required this.all_index,
  }) : super(key: key);

  final TodoState todoState;
  final int all_index;

  @override
  State<SearchAllTodo> createState() => _SearchAllTodoState();
}

class _SearchAllTodoState extends State<SearchAllTodo> {
  final searchFind = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white12,
            border: Border.all(
              color: Colors.white10,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Observer(
                          builder: (context) {
                            return TextField(
                              controller: searchFind,
                              textDirection: TextDirection.ltr,
                              autofocus: true,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              onChanged: (value) {
                                widget.todoState.searchTodo(
                                  value,
                                  widget.all_index,
                                );
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  left: 35,
                                ),
                                hintText: 'Search by the title...',
                              ),
                            );
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          searchFind.clear();
                          widget.todoState.search =
                              <TodoModel>[].asObservable();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 10,
          right: 10,
        ),
        child: Observer(
          builder: (context) {
            if (widget.todoState.search.isEmpty) {
              return const PhotoSearch();
            }
            return ListView.builder(
              itemCount: widget.todoState.search.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TodoView(
                          todo: widget.todoState.search[index],
                          todoState: widget.todoState,
                          index: index,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: GetColor.getColor(index),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Observer(
                        builder: (context) {
                          return SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.todoState.search[index].title,
                                  style: const TextStyle(
                                    fontSize: 28,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.todoState.search[index].description,
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
                );
              },
            );
          },
        ),
      ),
    );
  }
}
