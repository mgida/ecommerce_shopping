import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/utils/animate_page.dart';
import 'package:shopping_app/view/screens/detail_screen.dart';
import 'package:shopping_app/view_model/cart_view_model.dart';
import 'package:shopping_app/view_model/favourite_view_model.dart';
import 'custom_swipe_container.dart';
import 'custom_text_widget.dart';

class BuildFavItems extends StatelessWidget {
  final ProductModel productModel;
  final int index;

  BuildFavItems({required this.productModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteViewModel>(
      init: Get.find<FavouriteViewModel>(),
      builder: (controller) => Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: Column(
          children: [
            GestureDetector(
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
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                            CustomTextWidget(
                              title: '\$${productModel.price!}',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      // color: Colors.blue,
                      width: double.infinity,
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  AnimatePage.createRoute(
                    DetailScreen(productModel: productModel),
                  ),
                );
              },
            ),
          ],
        ),
        actions: [
          GetBuilder<CartViewModel>(
            init: Get.find<CartViewModel>(),
            builder: (controller) => CustomSwipeContainer(
              title: 'Add to Cart',
              icon: Icons.add_shopping_cart,
              color: Colors.blue.shade300,
              onTap: () {
                print(controller.cartProducts.length);

                controller.addProductToCart(productModel, context);
              },
            ),
          ),
        ],
        secondaryActions: [
          GetBuilder<FavouriteViewModel>(
            init: Get.find<FavouriteViewModel>(),
            builder: (controller) => CustomSwipeContainer(
              title: 'Remove',
              icon: Icons.delete,
              color: Colors.red.shade50,
              onTap: () {
                controller.removeProductFromFav(productModel, context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
