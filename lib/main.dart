import 'package:dstp_todo_app/view/login_afternoon_class.dart';
import 'package:dstp_todo_app/view/login_screen.dart';
import 'package:dstp_todo_app/view/splash_screen.dart';
import 'package:flutter/material.dart';

import 'model/todo_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
      home: SplashScreen(),
    );
  }
}
