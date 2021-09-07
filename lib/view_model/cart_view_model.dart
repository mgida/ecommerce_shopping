import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/service/firebase/cart_service.dart';
import 'package:shopping_app/utils/display_snackbar.dart';

class CartViewModel extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;

  List<ProductModel> _cartProducts = [];

  List<ProductModel> get cartProducts => _cartProducts;


  List<String?> _cartIds = [];
  List<String?> get cartIds => _cartIds;

  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  CartViewModel() {
    getCartProducts();
  }

  @override
  get onDelete {
    print('onDelete called .. cart');
    return super.onDelete;
  }

  void getCartProducts() async {
    _cartProducts.clear();
    _cartIds.clear();
    _totalPrice = 0;
    _loading.value = true;
    await CartService()
        .getCartProducts('${user?.uid}', 'my_cart')
        .then((queryDocumentSnapshots) {
      queryDocumentSnapshots?.forEach((element) {
        _cartProducts.add(ProductModel.fromJson(element.data()));
        _cartIds.add((element.data()['id']));

      });
    });
    getTotalPrice();
    _loading.value = false;
    update();
  }

  void getTotalPrice() {
    for (int i = 0; i < _cartProducts.length; i++) {
      _totalPrice = _totalPrice +
          (double.parse(_cartProducts[i].price!) *
              _cartProducts[i].quantity!.toDouble());
    }
    update();
  }

  void addProductToCart(ProductModel productModel, BuildContext context) {
    if (_cartIds.contains(productModel.id)) {
      displaySnackBar(context, 'Already in Cart');
      return;
    }
    try {
      CartService().addProductToCart(productModel);
      _cartProducts.add(productModel);
      _cartIds.add(productModel.id);
      displaySnackBar(context, 'Added to Cart');
    } catch (e) {
      print(e);
    }
    update();
  }

  void removeProductFromCart(ProductModel productModel, BuildContext context) {
    try {
      CartService().removeProductFromCart(productModel);
      _cartProducts.removeWhere((element) => element == productModel);
      _cartIds.removeWhere((element) => element == productModel.id);
      _totalPrice = _totalPrice -
          (double.parse(productModel.price!) *
              productModel.quantity!.toDouble());
      displaySnackBar(context, 'Removed from Cart');
    } catch (e) {
      print(e);
    }
    update();
  }

  void increaseQuantity(int index) {
    _cartProducts[index].quantity = (_cartProducts[index].quantity! + 1);
    _totalPrice = _totalPrice + (double.parse(_cartProducts[index].price!));
    updateQuantityOnFirestore(_cartProducts[index]);
    update();
  }

  void decreaseQuantity(int index) {
    if (_cartProducts[index].quantity! > 1) {
      _cartProducts[index].quantity = (_cartProducts[index].quantity! - 1);
      _totalPrice = _totalPrice - (double.parse(_cartProducts[index].price!));
      updateQuantityOnFirestore(_cartProducts[index]);
      update();
    }
  }

  void updateQuantityOnFirestore(ProductModel productModel) {
    CartService().updateQuantityOnFirestore(productModel);
  }
}
