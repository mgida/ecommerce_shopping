import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_app/model/product_model.dart';

class CartService {
  CollectionReference<Map<dynamic, dynamic>> _favReference =
      FirebaseFirestore.instance.collection('cart');

  User? user = FirebaseAuth.instance.currentUser;

  Future<List<QueryDocumentSnapshot<Map<dynamic, dynamic>>>?> getCartProducts(
      String doc, String coll) async {
    try {
      QuerySnapshot<Map<dynamic, dynamic>> querySnapshot = await _favReference
          .doc(doc)
          .collection(coll)
          .orderBy('timestamp', descending: true)
          .get();
      return querySnapshot.docs;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addProductToCart(ProductModel productModel) async {
    try {
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(user?.uid)
          .collection('my_cart')
          .doc(productModel.id)
          .set(productModel.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<void> removeProductFromCart(ProductModel productModel) async {
    try {
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(user?.uid)
          .collection('my_cart')
          .doc(productModel.id)
          .delete()
          .then((value) => print('item deleted ${productModel.id}'))
          .catchError((e) => print('error $e'));
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateQuantityOnFirestore(ProductModel productModel) async {
    await FirebaseFirestore.instance
        .collection('cart')
        .doc(user?.uid)
        .collection('my_cart')
        .doc(productModel.id)
        .update({'quantity': productModel.quantity})
        .then((value) => print("item Updated"))
        .catchError((error) => print("Failed to update item: $error"));
  }
}
