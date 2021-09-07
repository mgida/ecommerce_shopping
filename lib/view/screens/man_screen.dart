import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/animate_page.dart';
import 'package:shopping_app/view/components/build_grid_view_widget.dart';
import 'package:shopping_app/view/components/build_men_chip_list_view.dart';
import 'package:shopping_app/view/components/custom_app_bar_with_action_widget.dart';
import 'package:shopping_app/view/components/custom_categories_and_filter_widget.dart';
import 'package:shopping_app/view/components/custom_items_length_row_widget.dart';
import 'package:shopping_app/view/components/custom_product_model_row_widget.dart';
import 'package:shopping_app/view/screens/categories_men_screen.dart';
import 'package:shopping_app/view_model/men_view_model.dart';

class ManScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: GetBuilder<MenViewModel>(
          init: Get.find<MenViewModel>(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomAppBarWithActionWidget(
                  title: 'Men',
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
                          CustomCategoriesAndFilterWidget(
                            onTapCategories: () {
                              Navigator.of(context).push(
                                AnimatePage.createRoute(
                                  CategoriesMenScreen(),
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
                                      child: BuildMenChipListView(),
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
                                  count: controller
                                              .menOnCategorySelected.length >=
                                          1
                                      ? controller.menOnCategorySelected.length
                                      : controller.men.length),
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
                                                .menOnCategorySelected.length >=
                                            1
                                        ? controller
                                            .menOnCategorySelected.length
                                        : controller.men.length,
                                    controller: controller,
                                    productModels: controller
                                                .menOnCategorySelected.length >=
                                            1
                                        ? controller.menOnCategorySelected
                                        : controller.men,
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
