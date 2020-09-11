import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/user.dart';
import 'package:flutter_auth/services/database.dart';
import 'package:flutter_auth/services/loading_page.dart';
import 'package:provider/provider.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> images = ['emeka', 'emma', 'sam', 'mac'];

  //form values
  String _currentImages;
  String _currentDscription;
  String _currentTitle;
  int _currentPrice;
  int _currentSize;

  Widget formTextField(BuildContext context, Widget child) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: kPrimaryColor,
            width: 2,
          ),
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUser>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseServices(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'update your product list.',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    formTextField(
                      context,
                      TextFormField(
                        initialValue: userData.description,
                        decoration: InputDecoration(labelText: 'description'),
                        validator: (val) =>
                            val.isEmpty ? 'please enter description' : null,
                        onChanged: (val) =>
                            setState(() => _currentDscription = val),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    formTextField(
                      context,
                      TextFormField(
                        initialValue: userData.title,
                        decoration: InputDecoration(labelText: 'title'),
                        validator: (val) =>
                            val.isEmpty ? 'please enter title' : null,
                        onChanged: (val) => setState(() => _currentTitle = val),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    formTextField(
                      context,
                      TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'size'),
                          validator: (val) =>
                              val.isEmpty ? 'please enter size' : null,
                          onChanged: (val) =>
                              setState(() => _currentSize = int.parse(val))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor, width: 2),
                      ),
                      child: DropdownButtonFormField(
                        value: _currentImages ?? 'emma',
                        items: images.map((image) {
                          return DropdownMenuItem(
                            value: image,
                            child: Text('$image images'),
                          );
                        }).toList(),
                        onChanged: (String value) {
                          setState(() {
                            _currentImages = value;
                          });
                        },
                      ),
                    ),
                    Slider(
                        min: 100,
                        max: 900,
                        divisions: 8,
                        activeColor: Colors.purple[_currentPrice ?? 100],
                        inactiveColor: Colors.purple[_currentPrice ?? 100],
                        value: (_currentPrice ?? 100).toDouble(),
                        onChanged: (val) {
                          setState(() {
                            _currentPrice = val.round();
                          });
                        }),
                    RaisedButton(
                        color: Colors.pink[400],
                        child: Text(
                          'Update',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseServices(uid: user.uid)
                                .updateUserData(
                                    _currentImages ?? userData.image,
                                    _currentTitle ?? userData.title,
                                    _currentDscription ?? userData.description,
                                    _currentPrice ?? userData.price,
                                    _currentSize ?? userData.size);

                            Navigator.pop(context);
                          }
                        })
                  ],
                ),
              ),
            );
          } else {
            return LoadingPage();
          }
        });
  }
}
