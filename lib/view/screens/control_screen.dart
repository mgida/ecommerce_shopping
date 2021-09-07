import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/screens/home_screen.dart';
import 'package:shopping_app/view/screens/sign_in_screen.dart';
import 'package:shopping_app/view_model/auth_view_model.dart';
import 'package:shopping_app/view_model/home_view_model.dart';

class ControlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Get.find<AuthViewModel>().currentUser == null
            ? SignInScreen()
            : GetBuilder<HomeViewModel>(
                init: HomeViewModel(),
                builder: (controller) => HomeScreen(),
              );
      },
    );
  }
}
