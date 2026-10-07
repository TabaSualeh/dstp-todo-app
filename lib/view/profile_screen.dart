import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../model/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({required this.user, super.key});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        title: Text(
          "Profile",
          style: GoogleFonts.acme(
            fontSize: 26,
            color: AppColors.primaryText,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Profile Screen",
          style: TextStyle(color: Colors.teal, fontSize: 38),
        ),
      ),
    );
  }
}
