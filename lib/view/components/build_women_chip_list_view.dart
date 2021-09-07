import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view_model/women_view_model.dart';
import 'build_chip_widget.dart';

class BuildWomenChipListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WomenViewModel>(
      init: Get.find<WomenViewModel>(),
      builder: (controller) => ListView.builder(
        shrinkWrap: true,
        itemCount: controller.selectedCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              children: [
                Visibility(
                    child: BuildChipWidget(
                      title: controller.selectedCategories[index].name,
                      onDeleted: () {
                        String productType =
                            controller.selectedCategories[index].name;
                        controller.removeSelectedCategory(index, productType);
                      },
                    ),
                    visible:
                        controller.selectedCategories[index].isSelected == false
                            ? false
                            : true)
              ],
            ),
          );
        },
      ),
    );
  }
}
