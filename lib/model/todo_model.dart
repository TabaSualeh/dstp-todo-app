class Todo {
  String title = '';
  String? description;
  DateTime? dateTime;
  bool? isCompleted;

  Todo({
    required this.title,
    this.description,
    this.isCompleted = false,
    DateTime? dateTime,
  }) : dateTime = dateTime ?? DateTime.now();

  Todo.fromMap(Map<String, dynamic> todoMap) {
    this.title = todoMap['title'];
    this.description = todoMap['description'];
    this.dateTime = DateTime.parse(todoMap['dateTime']);
    this.isCompleted = todoMap['isCompleted'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['title'] = this.title;
    data['description'] = this.description;
    data['dateTime'] = this.dateTime.toString();
    data['isCompleted'] = this.isCompleted;
    return data;
  }
}
