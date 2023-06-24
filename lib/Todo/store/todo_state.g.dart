// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoState on _TodoState, Store {
  late final _$todosAtom = Atom(name: '_TodoState.todos', context: context);

  @override
  ObservableList<TodoModel> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<TodoModel> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$doneTodosAtom =
      Atom(name: '_TodoState.doneTodos', context: context);

  @override
  ObservableList<TodoModel> get doneTodos {
    _$doneTodosAtom.reportRead();
    return super.doneTodos;
  }

  @override
  set doneTodos(ObservableList<TodoModel> value) {
    _$doneTodosAtom.reportWrite(value, super.doneTodos, () {
      super.doneTodos = value;
    });
  }

  late final _$notDoneTodosAtom =
      Atom(name: '_TodoState.notDoneTodos', context: context);

  @override
  ObservableList<TodoModel> get notDoneTodos {
    _$notDoneTodosAtom.reportRead();
    return super.notDoneTodos;
  }

  @override
  set notDoneTodos(ObservableList<TodoModel> value) {
    _$notDoneTodosAtom.reportWrite(value, super.notDoneTodos, () {
      super.notDoneTodos = value;
    });
  }

  late final _$searchAtom = Atom(name: '_TodoState.search', context: context);

  @override
  ObservableList<TodoModel> get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(ObservableList<TodoModel> value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$_currentIndexAtom =
      Atom(name: '_TodoState._currentIndex', context: context);

  @override
  int get _currentIndex {
    _$_currentIndexAtom.reportRead();
    return super._currentIndex;
  }

  @override
  set _currentIndex(int value) {
    _$_currentIndexAtom.reportWrite(value, super._currentIndex, () {
      super._currentIndex = value;
    });
  }

  late final _$_TodoStateActionController =
      ActionController(name: '_TodoState', context: context);

  @override
  void checkScreen(int index) {
    final _$actionInfo = _$_TodoStateActionController.startAction(
        name: '_TodoState.checkScreen');
    try {
      return super.checkScreen(index);
    } finally {
      _$_TodoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isChekedTodo(int index, bool newValue) {
    final _$actionInfo = _$_TodoStateActionController.startAction(
        name: '_TodoState.isChekedTodo');
    try {
      return super.isChekedTodo(index, newValue);
    } finally {
      _$_TodoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodo(TodoModel todo) {
    final _$actionInfo =
        _$_TodoStateActionController.startAction(name: '_TodoState.addTodo');
    try {
      return super.addTodo(todo);
    } finally {
      _$_TodoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(TodoModel todo, int index) {
    final _$actionInfo =
        _$_TodoStateActionController.startAction(name: '_TodoState.removeTodo');
    try {
      return super.removeTodo(todo, index);
    } finally {
      _$_TodoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAll(int index) {
    final _$actionInfo =
        _$_TodoStateActionController.startAction(name: '_TodoState.removeAll');
    try {
      return super.removeAll(index);
    } finally {
      _$_TodoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void todoUpdate(TodoModel todo) {
    final _$actionInfo =
        _$_TodoStateActionController.startAction(name: '_TodoState.todoUpdate');
    try {
      return super.todoUpdate(todo);
    } finally {
      _$_TodoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchTodo(String title, int index) {
    final _$actionInfo =
        _$_TodoStateActionController.startAction(name: '_TodoState.searchTodo');
    try {
      return super.searchTodo(title, index);
    } finally {
      _$_TodoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
doneTodos: ${doneTodos},
notDoneTodos: ${notDoneTodos},
search: ${search}
    ''';
  }
}
