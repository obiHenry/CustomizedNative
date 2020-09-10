import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/home/hand_bag/components/body.dart';
import 'package:flutter_auth/models/Product.dart';
import 'package:flutter_auth/services/database.dart';
import 'package:provider/provider.dart';

class HandBagScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StreamProvider<List<Product>>.value(
        catchError: (e, n) {
          print(e);
          print(n);
          return null;
        },
        value: DatabaseServices().ankara,
        child: Body());
  }
}
