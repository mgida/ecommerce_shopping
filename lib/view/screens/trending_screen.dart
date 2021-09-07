import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/components/build_grid_view_widget.dart';
import 'package:shopping_app/view/components/custom_app_bar_with_action_widget.dart';
import 'package:shopping_app/view/components/custom_filter_row_widget.dart';
import 'package:shopping_app/view/components/custom_items_length_row_widget.dart';
import 'package:shopping_app/view/components/custom_product_model_row_widget.dart';
import 'package:shopping_app/view_model/home_view_model.dart';

class TrendingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomAppBarWithActionWidget(
            title: 'Trending',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomFilterRowWidget(
                        title: 'CATEGORIES',
                        icons: Icons.arrow_drop_down,
                        onTap: () {},
                      ),
                      CustomFilterRowWidget(
                        title: 'FILTER & SORT',
                        icons: Icons.filter_list,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomProductModelRowWidget(),
                      GetBuilder<HomeViewModel>(
                        init: Get.find<HomeViewModel>(),
                        builder: (controller) => CustomItemsLengthRowWidget(
                            count: controller.trending.length),
                      ),
                    ],
                  ),
                  GetBuilder<HomeViewModel>(
                    init: Get.find<HomeViewModel>(),
                    builder: (controller) => Expanded(
                      child: BuildGridViewWidget(
                        itemCount: controller.trending.length,
                        controller: controller,
                        productModels: controller.trending,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
