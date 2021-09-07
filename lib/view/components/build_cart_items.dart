import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/view/screens/detail_screen.dart';
import 'package:shopping_app/view_model/cart_view_model.dart';
import 'custom_quantity_button.dart';
import 'custom_swipe_container.dart';
import 'custom_text_widget.dart';

class BuildCartItems extends StatelessWidget {
  final ProductModel productModel;
  final int index;

  BuildCartItems({required this.productModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) => Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: GestureDetector(
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  child: CachedNetworkImage(
                    height: 140.0,
                    width: 120.0,
                    imageUrl: productModel.image!,
                    fit: BoxFit.fill,
                    memCacheWidth: (Get.width * 0.6).toInt(),
                    memCacheHeight: (Get.height * 0.6).toInt(),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                const SizedBox(
                  width: 18.0,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          title: productModel.name!,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomTextWidget(
                          title: productModel.size!,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                              title: '\$${productModel.price!}',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            Row(
                              children: [
                                CustomQuantityButton(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    controller.decreaseQuantity(index);
                                  },
                                ),
                                Container(
                                  color: Colors.grey.shade200,
                                  width: 25,
                                  child: Center(
                                    child: CustomTextWidget(
                                      title: '${productModel.quantity}',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                CustomQuantityButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    controller.increaseQuantity(index);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            Get.to(
              () => DetailScreen(productModel: productModel),
            );
          },
        ),
        actions: [
          CustomSwipeContainer(
            title: 'Remove',
            icon: Icons.delete,
            color: Colors.red.shade50,
            onTap: () {
              controller.removeProductFromCart(productModel, context);
            },
          ),
        ],
      ),
    );
  }
}
