import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/view/components/custom_price_row_widget.dart';
import 'package:shopping_app/view/components/custom_shimmer_widget.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';
import 'package:shopping_app/view_model/favourite_view_model.dart';

class BuildListItems extends StatelessWidget {
  final int index;
  final controller;
  final ProductModel productModel;
  final VoidCallback onTap;

  BuildListItems(
      {required this.index,
      required this.controller,
      required this.productModel,
      required this.onTap});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              child: controller.loading.value == true
                  ? CustomShimmerWidget(height: 300)
                  : CachedNetworkImage(
                      imageUrl: productModel.image!,
                      fit: BoxFit.fitHeight,
                      height: 300,
                      width: double.infinity,
                      //memCacheWidth: (Get.width*0.8).toInt(),
                      memCacheHeight: (Get.height * 0.6).toInt(),
                      errorWidget: (context, x, y) =>
                          CustomShimmerWidget(height: 300),
                      placeholder: (context, url) =>
                          CustomShimmerWidget(height: 300),
                    ),
            ),
          ),
          // height: 300,
          Positioned(
            child: GetBuilder<FavouriteViewModel>(
              init: FavouriteViewModel(),
              builder: (controller) => GestureDetector(
                child: Icon(
                  Icons.favorite,
                  size: 30,
                  color: controller.favIds.contains(productModel.id)
                      ? Colors.red
                      : Colors.white,
                ),
                onTap: () {
                  controller.toggleFav(productModel, context);
                },
              ),
            ),
            right: 8,
            bottom: 16,
          ),
        ]),
        const SizedBox(
          height: 10,
        ),
        Flexible(
          child: CustomTextWidget(
            title: productModel.name!,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Flexible(
          child: CustomPriceRowWidget(
              price: productModel.price!, discount: productModel.discount!),
        ),
      ],
    );
  }
}
