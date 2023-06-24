import 'package:mobx/mobx.dart';
import 'package:todo/models/todo_model.dart';

part 'todo_state.g.dart';

class TodoState = _TodoState with _$TodoState;

abstract class _TodoState with Store {
  @observable
  ObservableList<TodoModel> todos = ObservableList<TodoModel>.of([]);
  @observable
  ObservableList<TodoModel> doneTodos = ObservableList<TodoModel>.of([]);
  @observable
  ObservableList<TodoModel> notDoneTodos = ObservableList<TodoModel>.of([]);
  @observable
  ObservableList<TodoModel> search = ObservableList<TodoModel>.of([]);

  @observable
  var _currentIndex = 0;

  int get currentIndex => _currentIndex;

  @action
  void checkScreen(int index) {
    _currentIndex = index;
  }

  @action
  void isChekedTodo(int index, bool newValue) {
    todos[index].isCheck = newValue;
    if (!newValue) {
      int done_index = doneTodos.indexWhere(
        (element) => element.id == todos[index].id,
      );
      if (done_index > -1 && doneTodos.isNotEmpty) {
        doneTodos.removeAt(done_index);
      }
      int notDone_index = notDoneTodos.indexWhere(
        (element) => element.id == todos[index].id,
      );
      if (notDone_index == -1) {
        notDoneTodos.add(
          todos[index],
        );
      }
    } else {
      doneTodos.add(
        todos[index],
      );
    }

    if (newValue) {
      int notDone_index = notDoneTodos.indexWhere(
        (element) => element.id == todos[index].id,
      );
      if (notDone_index > -1 && notDoneTodos.isNotEmpty) {
        notDoneTodos.removeAt(
          notDone_index,
        );
      }
    }
  }

  @action
  void addTodo(TodoModel todo) {
    todos.add(
      todo,
    );
    notDoneTodos.add(
      todo,
    );
  }

  @action
  void removeTodo(TodoModel todo, int index) {
    if (index == 0) {
      doneTodos.removeWhere(
        (element) => element.id == todo.id,
      );
      notDoneTodos.removeWhere(
        (element) => element.id == todo.id,
      );
      todos.removeWhere(
        (element) => element.id == todo.id,
      );
    } else if (index == 1) {
      doneTodos.removeWhere(
        (element) => element.id == todo.id,
      );
    } else {
      notDoneTodos.removeWhere(
        (element) => element.id == todo.id,
      );
    }
  }

  @action
  void removeAll(int index) {
    if (index == 0) {
      todos = ObservableList<TodoModel>.of([]);
      doneTodos = ObservableList<TodoModel>.of([]);
      notDoneTodos = ObservableList<TodoModel>.of([]);
    } else if (index == 1) {
      doneTodos = ObservableList<TodoModel>.of([]);
      todos.removeWhere(
        (todo) => todo.isCheck == true,
      );
    } else {
      notDoneTodos = ObservableList<TodoModel>.of([]);
      todos.removeWhere(
        (todo) => todo.isCheck == false,
      );
    }
  }

  @action
  void todoUpdate(TodoModel todo) {
    int index = todos.indexWhere(
      (element) => element.id == todo.id,
    );
    if (index > -1) {
      todos[index] = todo;
    }
  }

  @action
  void searchTodo(String title, int index) {
    if (index == 0) {
      final index_todo = todos.indexWhere(
        (element) => element.title.contains(
          title,
        ),
      );
      if (index_todo != -1) {
        search = ObservableList<TodoModel>.of([]);
        search.add(
          todos[index_todo],
        );
      }
    } else if (index == 1) {
      search = ObservableList<TodoModel>.of([]);
      final index_todo = doneTodos.indexWhere(
        (element) => element.title.contains(
          title,
        ),
      );
      if (index_todo != -1) {
        search = ObservableList<TodoModel>.of([]);
        search.add(
          doneTodos[index_todo],
        );
      }
    } else if (index == 2) {
      search = ObservableList<TodoModel>.of([]);
      final index_todo = notDoneTodos.indexWhere(
        (element) => element.title.contains(
          title,
        ),
      );
      if (index_todo != -1) {
        search = ObservableList<TodoModel>.of([]);
        search.add(
          notDoneTodos[index_todo],
        );
      }
    } else {
      search == ObservableList<TodoModel>.of([]);
    }
  }
}
