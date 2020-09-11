import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/Product.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final products = Provider.of<List<Product>>(context);
    // products.forEach((product) {
    //   print(product.image);
    //   print(product.title);
    //   print(product.size);
    //   print(product.price);
    //   print(product.description);
    //   print(product.image);
    // });

    // print(products);
    // for (var doc in products.docs) {
    //   print(doc.data());
    // }

    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: Color(0xFF3D82AE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.uid}",
                child:  Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                  ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product.title,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
