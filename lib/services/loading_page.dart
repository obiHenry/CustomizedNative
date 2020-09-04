import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        color: kPrimaryLightColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitRing(
                color: kPrimaryColor,
                size: 50.0,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'please wait while we authenticate your details',
                style: TextStyle(color: kPrimaryColor, fontSize: 15,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
