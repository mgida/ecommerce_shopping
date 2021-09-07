import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/service/firebase/men_service.dart';
import 'package:shopping_app/service/firebase/women_service.dart';

class SearchViewModel extends GetxController {

  List<ProductModel> _searchBy = [];
  List<ProductModel> get searchBy => _searchBy;

  List<ProductModel> _hoodies = [];
  List<ProductModel> _tShirts = [];
  List<ProductModel> _shirts = [];
  List<ProductModel> _jackets = [];
  List<ProductModel> _menShirts = [];

  List<String> department = ['men', 'women'];

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  toggleSearchBy(String title) {
    switch (title) {
      case 'Hoodie':
        _searchBy = _hoodies;
        getAllHoodies();
        break;

      case 'Shirts':
        _searchBy = _shirts;
        getAllShirts();
        break;

      case 'Men Shirts':
        _searchBy = _menShirts;
        getMenShirts();
        break;

      case 'Shoes':
        _searchBy = _hoodies;
        break;

      case 'Blouse':
        _searchBy = _hoodies;
        break;

      case 'tShirts':
        _searchBy = _tShirts;
        break;
    }
    update();
  }

  void getAllHoodies() async {
    _loading.value = true;
    String productType = 'hoodie';
    // for (int i = 0; i < department.length; i++) {
    //   Future<List<QueryDocumentSnapshot<Map>>?> service =
    //       getRelatedService(department[i], productType);
    //   service.then((queryDocumentSnapshots) {
    //     queryDocumentSnapshots?.forEach((element) {
    //       _hoodies.add(ProductModel.fromJson(element.data()));
    //     });
    //   });
    // }
    await MenService()
        .getMenProducts(productType, productType)
        .then((queryDocumentSnapshots) {
      queryDocumentSnapshots?.forEach((element) {
        _hoodies.add(ProductModel.fromJson(element.data()));
      });
    });
    await WomenService()
        .getWomenProducts(productType, productType)
        .then((queryDocumentSnapshots) {
      queryDocumentSnapshots?.forEach((element) {
        _hoodies.add(ProductModel.fromJson(element.data()));
      });
    });
    _hoodies.shuffle();
    _loading.value = false;
    update();
  }

  void getAllJackets() async {
    _loading.value = true;
    String productType = 'hoodie';
    await MenService()
        .getMenProducts(productType, productType)
        .then((queryDocumentSnapshots) {
      queryDocumentSnapshots?.forEach((element) {
        _jackets.add(ProductModel.fromJson(element.data()));
      });
    });
    await WomenService()
        .getWomenProducts(productType, productType)
        .then((queryDocumentSnapshots) {
      queryDocumentSnapshots?.forEach((element) {
        _jackets.add(ProductModel.fromJson(element.data()));
      });
    });
    _jackets.shuffle();
    _loading.value = false;
    update();
  }

  void getAllShirts() async {
    _loading.value = true;
    String productType = 'Shirts';
    await MenService()
        .getMenProducts(productType, productType)
        .then((queryDocumentSnapshots) {
      queryDocumentSnapshots?.forEach((element) {
        _shirts.add(ProductModel.fromJson(element.data()));
      });
    });
    await WomenService()
        .getWomenProducts(productType, productType)
        .then((queryDocumentSnapshots) {
      queryDocumentSnapshots?.forEach((element) {
        _shirts.add(ProductModel.fromJson(element.data()));
      });
    });
    _shirts.shuffle();
    _loading.value = false;
    update();
  }

  void getMenShirts() async {
    _loading.value = true;
    String productType = 'Shirts';
    await MenService()
        .getMenProducts(productType, productType)
        .then((queryDocumentSnapshots) {
      queryDocumentSnapshots?.forEach((element) {
        _menShirts.add(ProductModel.fromJson(element.data()));
      });
    });
    _menShirts.shuffle();
    _loading.value = false;
    update();
  }

// Future<List<QueryDocumentSnapshot<Map>>?> getRelatedService(
//     String department, String productType) async {
//   switch (department) {
//     case 'men':
//       await MenService().getMenProducts(productType, productType);
//       break;
//
//     case 'women':
//       await WomenService().getWomenProducts(productType, productType);
//       break;
//   }
// }
}
