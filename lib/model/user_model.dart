import 'package:dstp_todo_app/model/todo_model.dart';

class User {
  String name;
  String email;
  String password;
  List<Todo>? userTodo = [];

  User({
    required this.name,
    required this.email,
    required this.password,
    this.userTodo,
  });
}
