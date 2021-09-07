import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/components/build_grid_view_widget.dart';
import 'package:shopping_app/view/components/custom_app_bar_widget.dart';
import 'package:shopping_app/view/components/custom_items_length_row_widget.dart';
import 'package:shopping_app/view/components/custom_product_model_row_widget.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';
import 'package:shopping_app/view_model/search_view_model.dart';

class SearchScreen extends StatelessWidget {
  final int? length;

  SearchScreen({this.length});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: GetBuilder<SearchViewModel>(
          init: SearchViewModel(),
          builder: (controller) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CustomAppBarWidget(title: 'Search Results'),
                    ),
                    visible: length != null ? false : true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Visibility(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomProductModelRowWidget(),
                          CustomItemsLengthRowWidget(
                              count: controller.searchBy.length),
                        ],
                      ),
                    ),
                    visible: length != null ? false : true,
                  ),
                  Visibility(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: CustomTextWidget(
                        title: 'Top Suggestions',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    visible: length != null ? true : false,
                  ),
                  controller.loading.value == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: BuildGridViewWidget(
                              itemCount: length == null
                                  ? controller.searchBy.length
                                  : 3,
                              controller: controller,
                              productModels: controller.searchBy,
                            ),
                          ),
                        ),
                ]);
          }),
    );
  }
}

class Item {
  final String title;

  Item({required this.title});
}
