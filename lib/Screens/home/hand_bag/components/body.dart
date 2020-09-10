import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/product_details/details_screen.dart';
import 'package:flutter_auth/models/Product.dart';
import 'package:flutter_auth/services/database.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';

import 'item_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context);
    //  products.forEach((product) {
    //   print(product.image);
    //   print(product.title);
    //   print(product.size);
    //   print(product.price);
    //   print(product.description);
    //   print(product.image);
    // });
    return FutureBuilder(
        // only add initialData: []
        initialData: [], // this is vital to get rid of null length error
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Loading..."));

          } else {
            return Container(
              margin: EdgeInsets.only(top: 20),
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: products == null ? 0 : products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return ItemCard(
                    product: products[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: products[index],
                          ),
                        )),
                  );
                },
              ),
            );
          }
        });
  }
}
