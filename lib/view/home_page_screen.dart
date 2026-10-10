import 'package:dstp_todo_app/data/user_data.dart';
import 'package:dstp_todo_app/view/profile_screen.dart';
import 'package:dstp_todo_app/view/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../model/todo_model.dart';
import '../model/user_model.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _currentIndex = 0;
  List<Widget>? _screens;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _screens = [
      TodoScreen(
        // loggedInUser: widget.user,
        userTodo: widget.user.userTodo,
        addTodo: addTodo,
      ),
      ProfileScreen(user: widget.user),
    ];
  }

  void addTodo(Todo newTask) {
    widget.user.userTodo.add(newTask);
    print("Add new Todo=====> $newTask");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: _screens?[_currentIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: AppColors.appbarColor.withValues(alpha: 1), blurRadius: 50, spreadRadius: 0.2)],
          border: const Border(top: BorderSide(color: AppColors.completedText)),
        ),
        child: BottomNavigationBar(
          selectedFontSize: 17,
          unselectedFontSize: 14,
          iconSize: 28,
          currentIndex: _currentIndex,
          onTap: (value) {
            _currentIndex = value;
            setState(() {});
          },
          selectedItemColor: AppColors.fabColor,
          unselectedItemColor: AppColors.inputHintTextColor,
          backgroundColor: AppColors.bottomSheetBgColor,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "HOME",
            ),
            const BottomNavigationBarItem(icon: Icon(Icons.person), label: "PROFILE"),
          ],
        ),
      ),
    );
  }
}
