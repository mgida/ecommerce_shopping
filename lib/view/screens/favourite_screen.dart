import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/components/build_empty_message.dart';
import 'package:shopping_app/view/components/build_fav_list_view_widget.dart';
import 'package:shopping_app/view/components/custom_app_bar_widget.dart';
import 'package:shopping_app/view_model/favourite_view_model.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: GetBuilder<FavouriteViewModel>(
        init: Get.find<FavouriteViewModel>(),
        builder: (controller) => Column(
          children: [
            CustomAppBarWidget(title: 'My Favourites'),
            Expanded(
              child: controller.loading.value == true
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : controller.favourites.length == 0
                      ? BuildEmptyMessage(
                          message: 'You haven\'t saved anything yet',
                        )
                      : Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: BuildFavListViewWidget(),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
