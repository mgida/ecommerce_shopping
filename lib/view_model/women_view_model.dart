import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/category_model.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/service/firebase/women_service.dart';

class WomenViewModel extends GetxController {

  List<ProductModel> _women = [];
  List<ProductModel> get women => _women;

  final List<CategoryModel> _categories = [
    CategoryModel(name: 'hoodie'),
    CategoryModel(name: 'Shirts'),
  ];
  List<CategoryModel> get categories => _categories;

  List<ProductModel> _womenOnCategorySelected = [];
  List<ProductModel> get womenOnCategorySelected => _womenOnCategorySelected;

  final List<CategoryModel> _selectedCategories = [];
  List<CategoryModel> get selectedCategories => _selectedCategories;

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    getWomenProducts();
  }

  void getWomenProducts() async {
    _loading.value = true;
    for (int index = 0; index < _categories.length; index++) {
      String productType = changeProductType(index);
      await WomenService()
          .getWomenProducts(productType, productType)
          .then((queryDocumentSnapshots) {
        queryDocumentSnapshots?.forEach((element) {
          _women.add(ProductModel.fromJson(element.data()));
        });
      });
    }
    _women.shuffle();
    _loading.value = false;
    update();
  }

  String changeProductType(int index) {
    String productType = '';
    switch (index) {
      case 0:
        productType = 'hoodie';
        break;
      case 1:
        productType = 'Shirts';
        break;
    }
    return productType;
  }

  void toggleSelectedCategory(int index) {
    _categories[index].isSelected = !_categories[index].isSelected;
    addRemoveSelectedCategories(index);
    update();
  }

  void addRemoveSelectedCategories(int index) {
    bool isSelected = _categories[index].isSelected;
    if (isSelected == true) {
      _selectedCategories.add(_categories[index]);
    } else {
      _selectedCategories.remove(_categories[index]);
    }
    String selectedCategoryToFilter = _categories[index].name;
    filterWomenProducts(_categories[index].isSelected, index,
        document: selectedCategoryToFilter,
        collection: selectedCategoryToFilter);
  }

  void filterWomenProducts(bool isSelected, int index,
      {required String document, required String collection}) async {
    _women.clear();
    _loading.value = true;
    await WomenService()
        .getWomenProducts(document, collection)
        .then((queryDocumentSnapshots) {
      queryDocumentSnapshots?.forEach((element) {
        if (isSelected == true) {
          _womenOnCategorySelected.add(ProductModel.fromJson(element.data()));
        }
        if (isSelected == false) {
          _womenOnCategorySelected
              .removeWhere((element) => element.name!.contains(document));
        }
      });
      if (isSelected == false &&
          _womenOnCategorySelected.length == 0 &&
          _women.length == 0) {
        _women.clear();
        getWomenProducts();
      }
      _loading.value = false;
      update();
    });
  }

  removeSelectedCategory(int index, String productType) {
    _womenOnCategorySelected
        .removeWhere((element) => element.name!.contains(productType));
    _selectedCategories[index].isSelected = false;
    if (_selectedCategories[index].isSelected == false &&
        _womenOnCategorySelected.length == 0) {
      _selectedCategories.clear();
      _women.clear();
      getWomenProducts();
    }
    _selectedCategories
        .removeWhere((element) => element.name.contains(productType));
    update();
  }

  void resetSelectedCategories() {
    _loading.value = true;
    for (int index = 0; index < _categories.length; index++) {
      _categories[index].isSelected = false;
    }
    _selectedCategories.clear();
    _womenOnCategorySelected.clear();
    _women.clear();
    _loading.value = false;
    update();
  }
}
