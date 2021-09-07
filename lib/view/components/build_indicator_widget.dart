import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view_model/home_view_model.dart';

class BuildIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: controller.recommendations.map((urlOfItem) {
          int index = controller.recommendations.indexOf(urlOfItem);
          return Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.only(top: 10.0, right: 2.0, left: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: controller.currentIndex == index
                  ? Colors.blue
                  : Colors.blue.shade100,
            ),
          );
        }).toList(),
      ),
    );
  }
}
