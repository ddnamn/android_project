import 'package:flutter/material.dart';
import 'package:project/Screens/login.dart';
import 'package:project/Screens/register.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // secaara default ke LogIn Page
  bool showLoginPage = true;

  // fungsi callback
  void toggleScreens() {
    //dinamis terhadap perubahan di login & register page
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login(showRegisterPage: toggleScreens); // passing voidcallback
    } else {
      return Register(showLoginPage: toggleScreens);
    }
  }
}
