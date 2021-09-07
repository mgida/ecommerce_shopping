import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/components/build_cart_list_view_widget.dart';
import 'package:shopping_app/view/components/build_empty_message.dart';
import 'package:shopping_app/view/components/build_total_price_container.dart';
import 'package:shopping_app/view/components/custom_app_bar_widget.dart';
import 'package:shopping_app/view_model/cart_view_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: GetBuilder<CartViewModel>(
        init:Get.find<CartViewModel>(),
        builder: (controller) => Column(
          children: [
            CustomAppBarWidget(title: 'My Cart'),
            controller.loading.value == true
                ? Expanded(
                    child: Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                : controller.cartProducts.length == 0
                    ? BuildEmptyMessage(
                        message: 'Your Cart is Empty !',
                      )
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 8.0, top: 16.0),
                          child: BuildCartListViewWidget(),
                        ),
                      ),
            GetBuilder<CartViewModel>(
              init: Get.find<CartViewModel>(),
              builder: (controller) => controller.cartProducts.length == 0
                  ? Container()
                  : BuildTotalPriceContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
