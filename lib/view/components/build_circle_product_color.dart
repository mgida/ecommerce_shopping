import 'package:flutter/material.dart';
import 'package:shopping_app/model/product_model.dart';

class BuildCircleProductColor extends StatelessWidget {
  final ProductModel productModel;

  BuildCircleProductColor({required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: CircleAvatar(
        maxRadius: 12,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: productModel.color,
          ),
        ),
      ),
    );
  }
}
