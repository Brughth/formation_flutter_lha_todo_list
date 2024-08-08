class TodoModel {
  final String title;
  final String description;
  final bool isCompleted;

  TodoModel({
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}
