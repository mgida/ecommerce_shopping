import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/components/build_cart_items.dart';
import 'package:shopping_app/view_model/cart_view_model.dart';

class BuildCartListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.find<CartViewModel>(),
      builder: (controller) => ListView.separated(
        itemCount: controller.cartProducts.length,
        itemBuilder: (context, index) {
          final productModel = controller.cartProducts[index];
          return BuildCartItems(productModel: productModel, index: index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}
