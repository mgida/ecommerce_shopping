import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/build_progress_indicator.dart';
import 'package:shopping_app/view/components/build_cancel_and_apply_button.dart';
import 'package:shopping_app/view/components/build_women_categories_list_view.dart';
import 'package:shopping_app/view/components/custom_app_bar_categories_widget.dart';
import 'package:shopping_app/view/components/custom_view_all_text_widget.dart';
import 'package:shopping_app/view_model/women_view_model.dart';

class CategoriesWomenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Padding(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: GetBuilder<WomenViewModel>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBarCategoriesWidget(
                  title: 'Categories',
                  onTap: () async {
                    await onApply(controller, context);
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomViewAllTextWidget(
                  itemsCount: controller.womenOnCategorySelected.length == 0
                      ? controller.women.length
                      : controller.womenOnCategorySelected.length),
              Expanded(
                child: BuildWomenCategoriesListView(),
              ),
              BuildCancelAndApplyButton(
                onPressedCancel: () async {
                  if (controller.selectedCategories.length == 0) {
                    Navigator.pop(context);
                  } else {
                    controller.resetSelectedCategories();
                    await Future.delayed(Duration(milliseconds: 300));
                    buildProgressIndicator(context);
                    controller.getWomenProducts();
                    Navigator.pop(context);
                  }
                },
                onPressedApply: () async {
                  await onApply(controller, context);
                },
              ),
            ],
          );
        }),
      ),
    );
  }

  Future<void> onApply(WomenViewModel controller, BuildContext context) async {
    if (controller.womenOnCategorySelected.length == 0 &&
        controller.women.length == 0) {
      controller.getWomenProducts();
      await Future.delayed(Duration(milliseconds: 300));
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
    }
  }
}
