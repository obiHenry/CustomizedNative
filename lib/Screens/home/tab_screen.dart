import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_auth/Screens/home/hand_bag/hand_bag_screen.dart';
import 'package:flutter_auth/models/user.dart';

import 'package:flutter_auth/services/auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'dresses/dresses_screen.dart';
import 'foot_wear/foot_wear_screen.dart';
import 'jewelleries/jewellery_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<CurrentUser>.value(
      value: AuthServices().user,
      child: DefaultTabController(
        initialIndex: 0,
        length: 4,
        child: Scaffold(
          appBar: buildAppBar(),
          body: TabBarView(
            children: [
              HandBagScreen(),
              JewelleryScreen(),
              FootWearsScreen(),
              DressesScreen(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Women',
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(fontWeight: FontWeight.bold),
      ),
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
            // icon: Icon(
            //   Icons.swap_horizontal_circle,
            //   color: Colors.amber,
            // ),
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
            // icon: Icon(
            //   Icons.shop,
            //   color: Colors.amber,
            // ),
          ),
          Tab(
            // icon: Icon(
            //   Icons.folder_open,
            //   color: Colors.amber,
            // ),
            child: Text(
              'Foot wear',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Tab(
            // icon: Icon(
            //   Icons.folder_open,
            //   color: Colors.amber,
            // ),
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
