import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/services/loading_page.dart';
import 'package:flutter_auth/services/validator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_auth/services/auth.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

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
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? LoadingPage()
        : Background(
            child: SingleChildScrollView(
              child: Column(
                key: _formKey,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/login.svg",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: size.height * 0.03),
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
                    validator: (value) => value.length < 6
                        ? 'Enter a Password 6+ chars long'
                        : null,
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
                  // sign in with email and password
                  RoundedButton(
                    text: "LOGIN",
                    press: !enableButton
                        ? null
                        : () async {
                            setState(() {
                              loading = true;
                            });
                            print('$email + $password');
                            dynamic result =
                                await _auth.signInWithEmailAndPassword(email, password);

                            if (result['status']) {
                              setState(() {
                                loading = false;
                              });
                              
                              Navigator.of(context)
                                  .pushReplacementNamed('/');
                            } else {
                              errorMessage = result['message'].toString();
                              setState(
                                () {
                                  loading = false;
                                  getSnackBar(errorMessage, Colors.red);
                                },
                              );
                            }

                            print(result.toString());
                          },
                  ),
                 
                  //this where u can sign in anonimously
                  // RoundedButton(
                  //   text: "SIGNINANON",
                  //   press: () async {
                  //     dynamic result = await _auth.signInAnon();
                  //     if (result == null) {
                  //       print('error signing in');
                  //     } else {
                  //       print('signed in');
                  //       print(result.uid);
                  //     }
                  //   },
                  // ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
  }
}
