import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../data/user_data.dart';
import '../model/user_model.dart';
import 'home_page_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(text: "tabasualeh@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "TS@12345");
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  bool isProtected = true;
  User? loggedInUser;
  bool isLoading = false;

  @override
  void initState() {
    print("ON INIT CALLED=====>");
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    print("ON Dispose CALLED=====>");
    emailController.dispose();
    emailFocus.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  // drive my car

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    bool isKeyboard = keyboardHeight > 0;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      resizeToAvoidBottomInset: false,

      body: Container(
        padding: EdgeInsets.only(top: 0.20 * sh, bottom: 0.097 * sh),
        decoration: BoxDecoration(
          gradient: RadialGradient(center: Alignment.topRight, colors: [AppColors.appbarColor.withValues(alpha: 0.87), AppColors.bgColor]),
        ),
        child: SingleChildScrollView(
          physics: isKeyboard ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.task_alt_rounded, color: AppColors.appbarColor, size: 0.13 * sw),
                  SizedBox(width: 0.02 * sw),
                  Text(
                    "DSTP-Todo",
                    style: GoogleFonts.abhayaLibre(fontSize: 46, color: AppColors.primaryText, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              SizedBox(height: 0.05 * sh),
              Text(
                "Welcome Back",
                style: GoogleFonts.abhayaLibre(fontSize: 42, color: AppColors.primaryText, fontWeight: FontWeight.w900),
              ),
              Text("Sign in to continue your journey", style: GoogleFonts.roboto(fontSize: 20, color: AppColors.primaryText.withValues(alpha: 0.4))),

              // Email Address
              Container(
                margin: EdgeInsets.only(left: 0.06 * sw, right: 0.06 * sw, top: 0.07 * sh, bottom: 0.02 * sh),
                decoration: BoxDecoration(
                  boxShadow: emailFocus.hasFocus ? [const BoxShadow(color: AppColors.appbarColor, blurRadius: 6, spreadRadius: 0.4)] : [],
                  // : const [],
                ),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  focusNode: emailFocus,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  controller: emailController,
                  style: const TextStyle(color: AppColors.primaryText),
                  onTap: () {
                    setState(() {});
                  },
                  onTapOutside: (event) {
                    emailFocus.unfocus();
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    fillColor: AppColors.inputFieldBgColor,
                    filled: true,
                    prefixIcon: const Icon(Icons.email_outlined),
                    prefixIconColor: AppColors.inputHintTextColor,
                    hint: Text("Email Address", style: GoogleFonts.roboto(color: AppColors.inputHintTextColor)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.taskCardBorderColor.withValues(alpha: 0.7), width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.taskCardBorderColor, width: 2.0),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              // Password
              Container(
                margin: EdgeInsets.only(left: 0.06 * sw, right: 0.06 * sw, bottom: 0.02 * sh),
                decoration: BoxDecoration(boxShadow: passFocus.hasFocus ? const [BoxShadow(color: AppColors.appbarColor, blurRadius: 6, spreadRadius: 0.4)] : const []),
                child: TextField(
                  focusNode: passFocus,
                  obscureText: isProtected,
                  autofillHints: const [AutofillHints.password],
                  controller: passwordController,
                  style: const TextStyle(color: AppColors.primaryText),
                  onTap: () {
                    setState(() {});
                  },
                  onTapOutside: (event) {
                    passFocus.unfocus();
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    fillColor: AppColors.inputFieldBgColor,
                    filled: true,
                    prefixIcon: const Icon(Icons.lock_outline),
                    prefixIconColor: AppColors.inputHintTextColor,
                    suffixIcon: IconButton(
                      onPressed: () {
                        isProtected = !isProtected;
                        setState(() {});
                      },
                      icon: isProtected ? Icon(Icons.visibility_off_outlined) : Icon(Icons.visibility_outlined),
                    ),
                    hint: Text("Password", style: GoogleFonts.roboto(color: AppColors.inputHintTextColor)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.taskCardBorderColor.withValues(alpha: 0.7), width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.taskCardBorderColor, width: 2.0),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 0.02 * sw),
              Padding(
                padding: EdgeInsets.only(right: 0.03 * sw),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Forgot Password?", style: GoogleFonts.acme(color: AppColors.appbarColor, fontSize: 20)),
                  ),
                ),
              ),
              SizedBox(height: 0.09 * sh),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0.06 * sw),
                width: double.infinity,
                height: 0.06 * sh,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.appbarColor.withValues(alpha: 0.7)),
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });

                    // await Future.delayed(const Duration(seconds: 5));

                    for (var myUserData in users) {
                      if (myUserData.email == emailController.text && myUserData.password == passwordController.text) {
                        loggedInUser = myUserData;
                        break;
                      }
                    }

                    if (loggedInUser != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Welcome, ${loggedInUser!.name}",
                            style: GoogleFonts.acme(fontSize: 17),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePageScreen(
                            user: loggedInUser!,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Invalid email or password",
                            style: GoogleFonts.acme(fontSize: 17),
                          ),
                          backgroundColor: AppColors.cancelIconColor,
                        ),
                      );
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: AppColors.primaryText,
                        )
                      : Text("Login", style: GoogleFonts.acme(color: AppColors.primaryText, fontSize: 20)),
                ),
              ),
              SizedBox(height: 0.009 * sh),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: GoogleFonts.roboto(color: AppColors.primaryText, fontSize: 15)),
                  TextButton(
                    onPressed: () {},
                    child: Text("Sign Up", style: GoogleFonts.roboto(color: AppColors.fabColor, fontSize: 19)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
