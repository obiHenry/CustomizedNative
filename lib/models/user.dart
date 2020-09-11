import 'package:flutter/widgets.dart';

class CurrentUser {
  final String uid;
  CurrentUser({@required this.uid});
}

class UserData {
  final int id;
  final String uid;
  final String image, title, description;
  final int price, size;

  UserData({
    this.id,
    this.uid,
    this.image,
    this.title,
    this.description,
    this.price,
    this.size,
  });
}
