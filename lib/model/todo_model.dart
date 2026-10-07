class Todo {
  String title;
  String? description;
  DateTime? dateTime;
  bool? isCompleted;

  Todo({
    required this.title,
    this.description,
    this.isCompleted = false,
    DateTime? dateTime,
  }) {
    this.dateTime = dateTime ?? DateTime.now();
  }
}
