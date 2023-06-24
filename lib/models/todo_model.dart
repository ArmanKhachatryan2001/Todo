class TodoModel {
  final String title;
  final String description;
  final String id;
  bool isCheck;

  TodoModel({
    required this.title,
    required this.description,
    required this.id,
    required this.isCheck,
  });

  TodoModel copy({
    String? title,
    String? description,
    String? id,
    bool? isCheck,
  }) {
    return TodoModel(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      isCheck: isCheck ?? this.isCheck,
    );
  }
}
