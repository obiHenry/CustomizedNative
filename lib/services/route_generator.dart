import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/UserDatails/userDetails_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Screens/home/home_screen.dart';
import 'package:flutter_auth/Screens/home/tab_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => TabScreen());
      case '/signUp':
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case '/userDetails':
        return MaterialPageRoute(
          builder: (_) => UserDetails(),
        );

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  //    Navigator.of(context).push(PageRouteBuilder(
//        opaque: false,
//        pageBuilder: (BuildContext context, _, __) =>
//            DetailPage(fragrance: frag)));

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
