import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view_model/cart_view_model.dart';
import 'custom_button_widget.dart';
import 'custom_text_widget.dart';

class BuildTotalPriceContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  title: 'Total',
                  color: Colors.black87,
                  fontSize: 20,
                ),
                GetBuilder<CartViewModel>(
                  builder: (controller) => CustomTextWidget(
                    color: Colors.black,
                    title: '\$${controller.totalPrice}',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ClipRRect(
            child: CustomButtonWidget(
                buttonTitle: 'Check out',
                onPressed: () {},
                buttonColor: Colors.blue,
                textColor: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ],
      ),
    );
  }
}
