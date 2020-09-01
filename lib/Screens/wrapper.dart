import 'package:flutter/material.dart';

import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Screens/home_page-screen.dart';
import 'package:flutter_auth/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUser>(context);
    print(user);

    // return either home or authenticate widget
    if (user == null) {
      return WelcomeScreen();
    } else {
      return HomePageScreen();
    }
  }
}
