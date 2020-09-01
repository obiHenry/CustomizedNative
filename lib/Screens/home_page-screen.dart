import 'package:flutter/material.dart';
import 'package:flutter_auth/services/auth.dart';

class HomePageScreen extends StatelessWidget {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available cloths'),
        actions: [
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.person),
            label: Text('Logout'),
          )
        ],
      ),
      body: Text('anything'),
    );
  }
}
