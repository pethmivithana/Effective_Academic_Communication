import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'homescreen.dart';
import 'login.dart';
import 'onboarding_screen.dart';
import 'second_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize GetStorage
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/second_splash', // Always start with second splash
      routes: {
        '/second_splash': (context) => SecondSplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) {
          final box = GetStorage();
          String? username = box.read('username');
          return HomeScreen(username: username ?? '');
        },
      },
    );
  }
}
