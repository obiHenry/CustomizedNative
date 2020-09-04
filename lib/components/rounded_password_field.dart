import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: showPassword,
        validator: widget.validator,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: showPassword ?  IconButton(
           icon: Icon(Icons.visibility_off),
            color: kPrimaryColor,
            onPressed: () {
              setState(() {
                showPassword =  false;
              });
            },
          ): IconButton(
           icon: Icon(Icons.visibility),
            color: kPrimaryColor,
            onPressed: () {
              setState(() {
                showPassword =  true ;
              });
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
