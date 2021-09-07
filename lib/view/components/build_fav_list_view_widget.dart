import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/components/build_fav_items.dart';
import 'package:shopping_app/view_model/favourite_view_model.dart';

class BuildFavListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteViewModel>(
      init: Get.find<FavouriteViewModel>(),
      builder: (controller) => ListView.separated(
        itemCount: controller.favourites.length,
        itemBuilder: (context, index) {
          final productModel = controller.favourites[index];
          return BuildFavItems(productModel: productModel, index: index);
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
