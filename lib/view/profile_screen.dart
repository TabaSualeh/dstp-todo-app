import 'package:dstp_todo_app/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../model/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.user});

  final User user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late List<String> userName = widget.user.name.trim().split(RegExp(r'\s+'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.acme(fontSize: 26, color: AppColors.primaryText),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Content
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.fabColor,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    userName.length > 1 ? userName[0][0] + userName[1][0] : userName[0][0],
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                    ),
                  ),
                ),

                SizedBox(height: 12),

                Text(
                  widget.user.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 6),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Grade 8",
                      style: TextStyle(color: AppColors.secondaryText),
                    ),
                    Text(
                      "  •  ",
                      style: TextStyle(color: AppColors.secondaryText),
                    ),
                    Text(
                      "Section B",
                      style: TextStyle(color: AppColors.secondaryText),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                // Statistics Cards
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 85,
                        decoration: BoxDecoration(
                          color: AppColors.taskCardBgColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            width: 1.5,
                            color: AppColors.fabColor.withValues(alpha: 0.5),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "12",
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Quizzes",
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      child: Container(
                        height: 85,
                        decoration: BoxDecoration(
                          color: AppColors.taskCardBgColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            width: 1.5,
                            color: AppColors.fabColor.withValues(alpha: 0.5),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "82%",
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Avg Score",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      child: Container(
                        height: 85,
                        decoration: BoxDecoration(
                          color: AppColors.taskCardBgColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            width: 1.5,
                            color: AppColors.fabColor.withValues(alpha: 0.5),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "#5",
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Class Rank",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                // User Details
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.taskCardBgColor,
                    border: Border.all(
                      width: 1.5,
                      color: AppColors.fabColor.withValues(alpha: 0.5),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: AppColors.completedText,
                          ),
                          SizedBox(width: 12),
                          SizedBox(
                            width: 65,
                            child: Text(
                              "Email",
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              widget.user.email,
                              textAlign: TextAlign.end,
                              softWrap: true,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Divider(
                        color: AppColors.completedText.withValues(alpha: 0.3),
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.school_outlined,
                            color: AppColors.completedText,
                          ),
                          SizedBox(width: 12),
                          SizedBox(
                            width: 65,
                            child: Text(
                              "School",
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Azeemi Public School",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Divider(
                        color: AppColors.completedText.withValues(alpha: 0.3),
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: AppColors.completedText,
                          ),
                          SizedBox(width: 12),
                          SizedBox(
                            width: 65,
                            child: Text(
                              "Joined",
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "October 2026",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Actions
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.taskCardBgColor,
                    border: Border.all(
                      width: 1.5,
                      color: AppColors.fabColor.withValues(alpha: 0.5),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Actions",
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 14),

                      Row(
                        children: [
                          Icon(
                            Icons.notifications_outlined,
                            color: AppColors.completedText,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "Notifications",
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: AppColors.secondaryText,
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      Row(
                        children: [
                          const Icon(Icons.logout, color: Colors.redAccent),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                // final route = MaterialPageRoute(
                                //   builder: (context) {
                                //     return LoginScreen();
                                //   },
                                // );
                                final route = MaterialPageRoute(builder: (context) => const LoginScreen());
                                Navigator.pushReplacement(context, route);
                              },
                              child: const Text(
                                "Logout",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
