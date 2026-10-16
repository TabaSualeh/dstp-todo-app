import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/todo_model.dart';

class TodoController {
  List<Todo> taskList = [];
  List<Todo> searchList = [];

  /// LIST TODO STORE IN SHARED PREFERENCE
  /// Todo List -> Map List -> String List
  List<String> convertTodoListIntoStringList() {
    List<Map<String, dynamic>> todoMapList = taskList.map((item) => item.toMap()).toList();
    List<String> jsonTodoList = todoMapList.map((mapItem) => jsonEncode(mapItem)).toList();
    return jsonTodoList;
  }

  void saveTodoListInPref({required String userEmailKey}) async {
    List<String> jsonTodoList = convertTodoListIntoStringList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(userEmailKey, jsonTodoList);
  }

  /// GET LIST OF SAVED TODO FROM SHARED PREFERENCE
  /// String List -> Map List -> Todo List
  Future<void> convertStringListIntoTodoList({required String userEmailKey}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonTodo = prefs.getStringList(userEmailKey) ?? [];
    List<dynamic> mapTodo = jsonTodo.map((mapItem) => jsonDecode(mapItem)).toList();
    List<Todo> todoList = mapTodo.map((item) => Todo.fromMap(item)).toList();
    taskList = todoList;
  }
}

/// SINGLE TODO STORE IN SHARED PREFERENCE
// String convertTodoIntoString() {
//   Todo todo = Todo(title: 'Flutter work'); //Create new Todo
//
//   Map<String, dynamic> newMapTodo = todo.toMap(); //Convert new todo into Map
//
//   String jsonTodo = jsonEncode(newMapTodo); // Convert that Map into Json (String)
//   return jsonTodo;
// }

// void saveTodoInPref(BuildContext context) async {
//   String todoString = convertTodoIntoString();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   print("TODO IN STRING $todoString");
//   prefs.setString("SingleTodo", todoString); //Store in Shared Preference
//
//   ScaffoldMessenger.of(context).showSnackBar(
//     const SnackBar(
//       backgroundColor: Colors.green,
//       content: Text("Todo added succesfully"),
//     ),
//   );
// }

/// GET SINGLE SAVED TODO FROM SHARED PREFERENCE
// void convertStringIntoTodo() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String jsonTodo = prefs.getString("SingleTodo") ?? "";
//   dynamic todoMap = jsonDecode(jsonTodo);
//   Todo newTodo = Todo.fromMap(todoMap);
// }
