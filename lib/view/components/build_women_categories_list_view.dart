import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/build_progress_indicator.dart';
import 'package:shopping_app/view_model/women_view_model.dart';
import 'build_categories_list_view_items.dart';

class BuildWomenCategoriesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WomenViewModel>(
      builder: (controller) => ListView.separated(
        shrinkWrap: true,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return BuildCategoriesListViewItems(
              onTapListTileItem: () async {
                await buildProgressIndicator(context);
                controller.toggleSelectedCategory(index);
              },
              containerColor: controller.categories[index].isSelected == true
                  ? Colors.grey.shade200
                  : Colors.grey.shade50,
              leadingIcon: controller.categories[index].isSelected == true
                  ? Icon(Icons.check_box)
                  : Icon(Icons.check_box_outline_blank),
              title: controller.categories[index].name);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 15,
          );
        },
      ),
    );
  }
}
