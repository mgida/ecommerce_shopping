import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/service/firebase/favourite_service.dart';
import 'package:shopping_app/utils/display_snackbar.dart';

class FavouriteViewModel extends GetxController {
  List<ProductModel> _favourites = [];
  List<ProductModel> get favourites => _favourites;

  List<String?> _favIds = [];
  List<String?> get favIds => _favIds;

  bool isFav = false;

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  User? user = FirebaseAuth.instance.currentUser;

  FavouriteViewModel() {
    getFavItems();
  }

  @override
  get onDelete {
    print('onDelete called ..fav');
    return super.onDelete;
  }

  void getFavItems() async {
    _loading.value = true;
    await FavouriteService()
        .getFavProducts('${user?.uid}', 'userFavs')
        .then((queryDocumentSnapshots) {
      queryDocumentSnapshots?.forEach((element) {
        _favourites.add(ProductModel.fromJson(element.data()));
        _favIds.add((element.data()['id']));
      });
    });
    _loading.value = false;
    update();
  }

  void toggleFav(ProductModel productModel, BuildContext context) {
    if (_favIds.contains(productModel.id)) {
      isFav = true;
    } else {
      isFav = false;
    }
    isFav = !isFav;
    if (isFav) {
      addProductToFav(productModel, context);
    } else {
      removeProductFromFav(productModel, context);
    }
    update();
  }

  void addProductToFav(ProductModel productModel, BuildContext context) {
    try {
      FavouriteService().addProductToFav(productModel);
      _favIds.add(productModel.id);
      displaySnackBar(context, 'Added to Favourites');
    } catch (e) {
      print(e);
    }
    update();
  }

  void removeProductFromFav(ProductModel productModel, BuildContext context) {
    try {
      FavouriteService().removeProductFromFav(productModel);
      _favIds.removeWhere((element) => element == productModel.id);
      _favourites.removeWhere((element) => element == productModel);
      displaySnackBar(context, 'Removed From Favourites');
    } catch (e) {
      print(e);
    }
    update();
  }

  void resetFavourites() {
    _favourites.clear();
    _favIds.clear();
    getFavItems();
    update();
  }
}
