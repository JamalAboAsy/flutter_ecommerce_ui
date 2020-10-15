import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/Product.dart';
import 'package:flutter_app/screens/details/components/color_and_size.dart';
import 'package:flutter_app/screens/details/components/counter_with_favicon.dart';
import 'package:flutter_app/screens/details/components/product_details.dart';
import '../../../constants.dart';
import 'add_to_cart.dart';
import 'description.dart';


class Body extends StatelessWidget {
  final Product product;
  Body({this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                padding: EdgeInsets.all(kDefaultPadding),
                //  height: size.height / 2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60,),
                          child: ColorAndSize(product: product),
                        ),
                        Description(product: product),
                        CounterWithFavBtn(),
                       SizedBox(height: 20,),
                       AddToCart(product: product),
                      ],
                    ),
                  ),
                ),
                ProductTitleWithPrice(product: product),
                ProductImage(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    Key key,
    this.color,
    // by default isSelected is false
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPadding / 4,
        right: kDefaultPadding / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

