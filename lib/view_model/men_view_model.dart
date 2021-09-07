import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/category_model.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/service/firebase/men_service.dart';

class MenViewModel extends GetxController {
  List<ProductModel> _men = [];
  List<ProductModel> get men => _men;

  final List<CategoryModel> _categories = [
    CategoryModel(name: 'shorts'),
    CategoryModel(name: 'Shirts'),
    // temporally until change database to match our filter ... shirts , t-shirts in contain not working correct
    CategoryModel(name: 'hoodie'),
    CategoryModel(name: 't-shirts')
  ];

  List<CategoryModel> get categories => _categories;

  List<ProductModel> _menOnCategorySelected = [];
  List<ProductModel> get menOnCategorySelected => _menOnCategorySelected;

  final List<CategoryModel> _selectedCategories = [];
  List<CategoryModel> get selectedCategories => _selectedCategories;

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    getMenProducts();
  }

  void getMenProducts() async {
    _loading.value = true;
    for (int index = 0; index < _categories.length; index++) {
      String productType = changeProductType(index);
      await MenService()
          .getMenProducts(productType, productType)
          .then((queryDocumentSnapshots) {
        queryDocumentSnapshots?.forEach((element) {
          _men.add(ProductModel.fromJson(element.data()));
        });
      });
    }
    _men.shuffle();
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
        productType = 'shorts';
        break;
      case 2:
        productType = 'Shirts';
        break;
      case 3:
        productType = 't-shirts';
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
    filterMenProducts(_categories[index].isSelected, index,
        document: selectedCategoryToFilter,
        collection: selectedCategoryToFilter);
  }

  void filterMenProducts(bool isSelected, int index,
      {required String document, required String collection}) async {
    _men.clear();
    _loading.value = true;
    await MenService()
        .getMenProducts(document, collection)
        .then((queryDocumentSnapshots) {
      queryDocumentSnapshots?.forEach((element) {
        if (isSelected == true) {
          _menOnCategorySelected.add(ProductModel.fromJson(element.data()));
        }
        if (isSelected == false) {
          _menOnCategorySelected
              .removeWhere((element) => element.name!.contains(document));
        }
      });
      //for back in navigation if we only selected shorts for example and then unSelected it
      if (isSelected == false &&
          _menOnCategorySelected.length == 0 &&
          _men.length == 0) {
        _men.clear();
        getMenProducts();
      }
      _loading.value = false;
      update();
    });
  }

  removeSelectedCategory(int index, String productType) {
    _menOnCategorySelected
        .removeWhere((element) => element.name!.contains(productType));
    _selectedCategories[index].isSelected = false;
    if (_selectedCategories[index].isSelected == false &&
        _menOnCategorySelected.length == 0) {
      _selectedCategories.clear();
      _men.clear();
      getMenProducts();
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
    _menOnCategorySelected.clear();
    _men.clear();
    _loading.value = false;
    update();
  }
}
