import 'package:get/get.dart';
import 'package:shopping_app/view_model/cart_view_model.dart';
import 'package:shopping_app/view_model/favourite_view_model.dart';
import 'package:shopping_app/view_model/home_view_model.dart';
import 'package:shopping_app/view_model/men_view_model.dart';
import 'package:shopping_app/view_model/search_view_model.dart';
import 'package:shopping_app/view_model/women_view_model.dart';
import '../view_model/auth_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => MenViewModel());
    Get.lazyPut(() => WomenViewModel());
    Get.lazyPut(() => SearchViewModel());
    Get.lazyPut(() => FavouriteViewModel());
    Get.lazyPut(() => CartViewModel());
  }
}
