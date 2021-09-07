import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/animate_page.dart';
import 'package:shopping_app/view/components/build_grid_view_widget.dart';
import 'package:shopping_app/view/components/build_women_chip_list_view.dart';
import 'package:shopping_app/view/components/custom_app_bar_with_action_widget.dart';
import 'package:shopping_app/view/components/custom_categories_and_filter_widget.dart';
import 'package:shopping_app/view/components/custom_items_length_row_widget.dart';
import 'package:shopping_app/view/components/custom_product_model_row_widget.dart';
import 'package:shopping_app/view/screens/categories_women_screen.dart';
import 'package:shopping_app/view_model/women_view_model.dart';

class WomanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: GetBuilder<WomenViewModel>(
          init: Get.find<WomenViewModel>(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomAppBarWithActionWidget(
                  title: 'Women',
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CustomCategoriesAndFilterWidget(
                            onTapCategories: () {
                              Navigator.of(context).push(
                                AnimatePage.createRoute(
                                  CategoriesWomenScreen(),
                                ),
                              );
                            },
                            onTapFilterAndSort: () {},
                          ),
                          const SizedBox(height: 5.0),
                          Center(
                            child: controller.selectedCategories.length == 0
                                ? Container()
                                : Container(
                                    height: 50,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: BuildWomenChipListView(),
                                    ),
                                  ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomProductModelRowWidget(),
                              CustomItemsLengthRowWidget(
                                  count: controller.women.length),
                            ],
                          ),
                          controller.loading.value == true
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                )
                              : Expanded(
                                  child: BuildGridViewWidget(
                                    itemCount: controller
                                                .womenOnCategorySelected
                                                .length >=
                                            1
                                        ? controller
                                            .womenOnCategorySelected.length
                                        : controller.women.length,
                                    controller: controller,
                                    productModels: controller
                                                .womenOnCategorySelected
                                                .length >=
                                            1
                                        ? controller.womenOnCategorySelected
                                        : controller.women,
                                  ),
                                ),
                        ]),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
