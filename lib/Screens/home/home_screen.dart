import 'package:flutter/material.dart';
import 'package:flutter_auth/services/auth.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import './components/body.dart';

class HomeScreen extends StatelessWidget {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        FlatButton.icon(
          
          onPressed: () async {
            await _auth.signOut();
          },
          icon: Icon(Icons.person, ),
          label: Text('Logout'),
          
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
