import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_auth/services/auth.dart';
import 'package:flutter_auth/services/validator.dart';

import '../../../constants.dart';
import '../../../services/validator.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();

  getSnackBar(String value, MaterialColor color) {
    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: color,
      duration: Duration(seconds: 3),
    ));
  }

  bool enableButton = false;

  void enableSubmitButton() {
    String pwd = Validators.password(password);
    String em = Validators.email(email);
    print('this is the Password $password' + 'this is the Email $email');
    print('i ran to enable button');

    if ((pwd == 'input okay') && (em == 'input okay')) {
      setState(() {
        enableButton = true;
      });
    } else {
      setState(() {
        enableButton = false;
      });
    }
  }

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          key: _formKey,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                setState(() {
                  email = value;
                  String validity = Validators.email(value);
                  enableButton = false;

                  if (validity == 'input okay') {
                    enableSubmitButton();
                    getSnackBar(' valid ', Colors.lightGreen);
                  } else {
                    getSnackBar(validity, Colors.red);
                  }
                });
              },
            ),
            RoundedPasswordField(
              validator: (value) =>
                  value.length < 6 ? 'Enter a Password 6+ chars long' : null,
              onChanged: (value) {
                setState(() {
                  password = value;
                  String validity = Validators.password(value);
                  enableButton = false;

                  if (validity == 'input okay') {
                    enableSubmitButton();
                    getSnackBar(' valid ', Colors.lightGreen);
                  } else {
                    getSnackBar(validity, Colors.red);
                  }
                });
              },
            ),
            RoundedButton(
              color: kPrimaryColor,
              text: "SIGNUP",
              press: !enableButton ? null
              : () async {
                 getSnackBar('please wait while we authenticate your details', Colors.lightGreen);
                   print('$email + $password');
                      dynamic result =
                          await _auth.registerWithEmailAndPassword(email, password);

                      if (result != null) {
                        Navigator.of(context).pushNamed('/userDetails');
                      }

                      print(result.toString());
                    },
                 // if (_formKey.currentState.validate()) {
                //   dynamic result =
                //       await _auth.registerWithEmailAndPassword(email, password);
                //   if (result == null) {
                //     setState(
                //       () {
                //         error = 'please supply a  valid email';
                //       },
                //     );
                //   }
                // }
              
            ),
            SizedBox(
              height: 0.03,
            ),
            Text(
              error,
              style: TextStyle(
                color: Colors.red,
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
