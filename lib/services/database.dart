import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth/Screens/product_details/components/description.dart';
import 'package:flutter_auth/models/Product.dart';
import 'package:flutter_auth/models/user.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices({this.uid});
  //colllection reference

  final CollectionReference ankaraCollection =
      FirebaseFirestore.instance.collection('ankara');

  Future updateUserData(String image, String title, String description,
      int price, int size) async {
    return await ankaraCollection.doc(uid).set(
      {
        'image': image,
        'title': title,
        'description': description,
        'size': size,
        'price': price,
      },
    );
  }

  // product list from snapshot from database
  List<Product> _productListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((products) {
      return Product(
        image: products.data()['imagePath'] ?? '',
        title: products.data()['title'] ?? '',
        description: products.data()['description'] ?? '',
        size: products.data()['size'] ?? '0',
        price: products.data()['price'] ?? '0',
      );
    }).toList();
  }

  // userdata from snapshot to input the datas
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      image: snapshot.data()['image'],
      title: snapshot.data()['title'],
      description: snapshot.data()['description'],
      price: snapshot.data()['size'],
      size: snapshot.data()['size'],
    );
  }

//get product stream from the firebase database
  Stream<List<Product>> get ankara {
    return ankaraCollection.snapshots().map(_productListFromSnapshot);
  }

  // get user document stream to be able to send it to the firebase from user input

  Stream<UserData> get userData {
    return ankaraCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
