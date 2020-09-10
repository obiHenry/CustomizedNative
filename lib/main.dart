import 'package:flutter/material.dart';
import 'package:flutter_auth/services/wrapper.dart';
import 'package:flutter_auth/constants.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth/services/auth.dart';
import 'package:flutter_auth/services/route_generator.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CurrentUser>.value(
      value: AuthServices().user,
     

      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        title: 'CUSTOMIED.COM',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: Wrapper(),
      ),
    );
  }
}
