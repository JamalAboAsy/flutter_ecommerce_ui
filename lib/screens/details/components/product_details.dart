import 'package:flutter/material.dart';
import 'package:flutter_app/models/Product.dart';

import '../../../constants.dart';


class ProductImage extends StatelessWidget {
  const ProductImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 120,
      top: 50,
      child: Container(
        height: 200,width: 200,
        child: Hero(
          tag: "${product.id}",
          child: Image.asset(
            product.image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class ProductTitleWithPrice extends StatelessWidget {
  const ProductTitleWithPrice({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context).textTheme.headline4.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "السعر\n",style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                  text: "\$${product.price}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          //   SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
