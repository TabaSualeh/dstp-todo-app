import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2));
    rememberMe();
    //
    // Timer(Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => ()));
    // });
    super.initState();
  }

  void rememberMe() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Text("TODO"), CircularProgressIndicator()],
        ),
      ),
    );
  }
}
