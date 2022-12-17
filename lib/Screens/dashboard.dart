import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart'; // PENTING

import 'package:project/Constants/constants.dart';
import 'package:project/Constants/app_constants.dart';
import 'package:project/Screens/home.dart';
import 'package:project/Screens/calculator.dart';
import 'package:project/Screens/profile.dart';

class Dashboard extends StatefulWidget {
  final String currentUserId;

  const Dashboard({Key? key, required this.currentUserId}) : super(key: key);

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  int currentindex = 1;

  @override
  Widget build(BuildContext context) {
    // List Navigasi
    List<Widget> widgets = [
      //CalculatorPage(),
      Calculator(),
      //Dashboard(),
      Home(
        currentUserID: widget.currentUserId,
        visitedUserID: widget.currentUserId,
      ),
      //ProfilePage()
      Profile(
        currentUserID: widget.currentUserId,
        visitedUserID: widget.currentUserId,
      ),
    ];

    return Scaffold(
      body: widgets[currentindex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: accentHexColor, //accentHexColor
        items: [
          TabItem(icon: Icons.calculate, title: 'CALCU'),
          TabItem(icon: Icons.home, title: 'HOME'),
          TabItem(icon: Icons.person, title: 'PROFILE'),
        ],
        initialActiveIndex: 1,
        onTap: (int i) {
          setState(() {
            currentindex = i;
          });
        },
      ),
    );
  }
}
