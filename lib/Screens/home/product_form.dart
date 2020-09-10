import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

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
          border: Border.all(color: kPrimaryColor, width: 2, ),
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'update your brew settings.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            formTextField(
              context,
              TextFormField(
                decoration: InputDecoration(labelText: 'description'),
                validator: (val) =>
                    val.isEmpty ? 'please enter description' : null,
                onChanged: (val) => setState(() => _currentDscription = val),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            formTextField(
              context,
              TextFormField(
                decoration: InputDecoration(labelText: 'title'),
                validator: (val) => val.isEmpty ? 'please enter title' : null,
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
                decoration: InputDecoration(labelText: 'size' ),
                validator: (val) => val.isEmpty ? 'please enter size' : null,
                onChanged: ( val) => setState(() => _currentSize = int.parse(val))
              ),
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
                  print(_currentDscription);
                  print(_currentImages);
                  print(_currentPrice);
                  print(_currentSize);
                  print(_currentTitle);
                })
          ],
        ),
      ),
    );
  }
}
