import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/home/components/body.dart';
import 'package:flutter_auth/Screens/home/dresses_screen.dart';
import 'package:flutter_auth/Screens/home/foot_wears_screen.dart';
import 'package:flutter_auth/Screens/home/home_screen.dart';
import 'package:flutter_auth/Screens/home/jewellery_screen.dart';
import 'package:flutter_auth/services/auth.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: buildAppBar(),
        body: TabBarView(
          children: [
            Body(),
            JewelleryScreen(),
            FootWearsScreen(),
            DressesScreen(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text('WOMEN'),
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
          icon: Icon(
            Icons.person,
          ),
          label: Text('Logout'),
        ),
        SizedBox(width: kDefaultPaddin / 2),
      ],
      bottom: TabBar(
        tabs: [
          Tab(
            // icon: Icon(Icons.drag_handle),
            child: Text(
              'Hand bag',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Tab(
            child: Text(
              'Jewellery',
              style: TextStyle(color: Colors.black),
            ),
            // icon: Icon(Icons.shop),
          ),
          Tab(
            // icon: Icon(Icons.folder_open),
           child: Text(
              'Foot wear',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Tab(
           child: Text(
              'Dresses',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
