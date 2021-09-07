import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/custom_icons_icons.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/view/components/build_circle_product_color.dart';
import 'package:shopping_app/view/components/build_size_container.dart';
import 'package:shopping_app/view/components/custom_button_widget.dart';
import 'package:shopping_app/view/components/custom_shimmer_widget.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';
import 'package:shopping_app/view_model/cart_view_model.dart';

class DetailScreen extends StatelessWidget {
  final ProductModel productModel;

  DetailScreen({required this.productModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                    child: CachedNetworkImage(
                      imageUrl: productModel.image!,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      //  height: 500.0,
                      memCacheHeight: (Get.height * 0.6).toInt(),
                      placeholder: (_, placeHolder) =>
                          CustomShimmerWidget(height: 420),
                      errorWidget: (context, x, y) =>
                          CustomShimmerWidget(height: 420),
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                ),
                Positioned(
                  top: 16.0,
                  left: 8.0,
                  right: 8.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            CustomIcons.arrow_left,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.black.withOpacity(0.7),
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        title: '${productModel.name}',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                      Row(
                        children: [
                          CustomTextWidget(
                            title: '\$${productModel.price}',
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Visibility(
                            child: CustomTextWidget(
                              title: '\$${productModel.discount}',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            visible: productModel.discount == null ||
                                    productModel.discount!.isEmpty
                                ? false
                                : true,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextWidget(
                        title: 'Colour',
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      BuildCircleProductColor(productModel: productModel),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextWidget(
                        title: 'Size',
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      BuildSizeContainer(productModel: productModel),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<CartViewModel>(
                        init: CartViewModel(),
                        builder: (controller) => ClipRRect(
                          child: CustomButtonWidget(
                              buttonTitle: 'Add To Cart',
                              onPressed: () {
                                controller.addProductToCart(
                                    productModel, context);
                              },
                              elevation: 16.0,
                              buttonColor: Colors.blue.shade600,
                              textColor: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
