import 'dart:async';
import 'package:dstp_todo_app/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_colors.dart';
import '../data/user_data.dart';
import '../model/user_model.dart';
import 'home_page_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUser();
    // TODO: implement initState
    super.initState();
  }

  Future<void> checkUser() async {
    await Future.delayed(const Duration(seconds: 2));

    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool rememberMe = prefs.getBool(AppConstants.rememberMeFlag) ?? false;

    User? savedUser;

    if (rememberMe) {
      String? savedEmail = prefs.getString(AppConstants.rememberMeEmail) ?? "";

      for (var user in users) {
        if (user.email == savedEmail) {
          savedUser = user;
          break;
        }
      }
    }

    if (savedUser != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomePageScreen(user: savedUser!),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.task_alt,
                    color: AppColors.fabColor,
                    size: 50,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'DSTP-Todo',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            CircularProgressIndicator(
              color: AppColors.fabColor,
            ),
          ],
        ),
      ),
    );
  }
}
