import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/home_page-screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either home or authenticate widget
    return HomePageScreen();
  }
}
