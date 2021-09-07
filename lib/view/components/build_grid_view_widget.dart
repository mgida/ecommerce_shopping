import 'package:flutter/material.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/utils/animate_page.dart';
import 'package:shopping_app/view/components/build_list_items.dart';
import 'package:shopping_app/view/screens/detail_screen.dart';

class BuildGridViewWidget extends StatelessWidget {
  final int itemCount;
  final controller;
  final List<ProductModel> productModels;

  BuildGridViewWidget(
      {required this.itemCount,
      required this.controller,
      required this.productModels});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (1 / 2),
          crossAxisCount: 2,
          mainAxisSpacing: 35,
          crossAxisSpacing: 8),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return BuildListItems(
            index: index,
            controller: controller,
            productModel: productModels[index],
            onTap: () {
              Navigator.of(context).push(
                AnimatePage.createRoute(
                  DetailScreen(
                    productModel: productModels[index],
                  ),
                ),
              );
            },
        );
      },
    );
  }
}
