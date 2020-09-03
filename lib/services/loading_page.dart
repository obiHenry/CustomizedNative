import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryLightColor,
      child: Center(
        child: SpinKitCircle(
          color: kPrimaryColor,
          size: 50.0,
        ),
      ),
    );
  }
}