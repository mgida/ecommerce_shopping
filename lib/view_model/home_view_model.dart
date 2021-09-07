import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/service/firebase/home_service.dart';

class HomeViewModel extends GetxController {
  List<ProductModel> _recommendations = [];
  List<ProductModel> get recommendations => _recommendations;

  List<ProductModel> _trending = [];
  List<ProductModel> get trending => _trending;

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  @override
  void onInit() {
    super.onInit();
    getAllRecommendations();
    getAllTrending();
  }

  changeIndex(int selectedIndex) {
    _currentIndex = selectedIndex;
    update();
  }

  getAllRecommendations() async {
    _loading.value = true;
    await HomeService()
        .getAllRecommendationsProducts()
        .then((queryDocumentSnapshots) {
      queryDocumentSnapshots?.forEach((element) {
        _recommendations.add(ProductModel.fromJson(element.data()));
      });
      _loading.value = false;
      update();
    });
  }

  void getAllTrending() async {
    _loading.value = true;
    await HomeService().getAllTrendingProducts().then((queryDocumentSnapshots) {
      queryDocumentSnapshots?.forEach((element) {
        _trending.add(ProductModel.fromJson(element.data()));
      });
      _loading.value = false;
      update();
    });
  }
}
