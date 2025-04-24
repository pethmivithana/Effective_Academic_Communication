import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'homescreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  final box = GetStorage();
  bool _isLoading = false;

  void _saveUsername() async {
    String username = _nameController.text.trim();
    if (username.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 1)); // simulate a delay
      box.write('username', username);
      box.write('first_time', false);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(username: username),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Oops! Please enter your name."),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/login_image.png',
                  width: 220,
                  height: 220,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Hey there! 👋",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "We’re excited to have you here.\nWhat should we call you?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: "Enter your name",
                    labelStyle: const TextStyle(color: Color(0xFF010066)),
                    hintText: "Your name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF010066), width: 2),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    prefixIcon: const Icon(Icons.person, color: Color(0xFF010066)),
                  ),
                ),
                const SizedBox(height: 30),
                _isLoading
                    ? const CircularProgressIndicator(color: Color(0xFFFF6100))
                    : ElevatedButton.icon(
                  onPressed: _saveUsername,
                  icon: const Icon(Icons.rocket_launch),
                  label: const Text(
                    "Let's Go 🚀",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF6100),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 5,
                    shadowColor: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}