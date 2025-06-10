import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:async';

class SecondSplashScreen extends StatefulWidget {
  @override
  _SecondSplashScreenState createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate after 2 seconds based on user state
    Timer(Duration(seconds: 2), () {
      _navigateToNextScreen();
    });
  }

  void _navigateToNextScreen() {
    final box = GetStorage();
    bool isFirstTime = box.read('first_time') ?? true;
    String? username = box.read('username');

    if (isFirstTime) {
      // First time user - show onboarding
      Navigator.pushReplacementNamed(context, '/onboarding');
    } else {
      // Returning user - go directly to home (skip login)
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Match your splash color
      body: Center(
        child: Image.asset('assets/Logo03.png', width: 300), // Your logo
      ),
    );
  }
}
