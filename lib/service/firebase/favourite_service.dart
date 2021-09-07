import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_app/model/product_model.dart';

class FavouriteService {
  User? user = FirebaseAuth.instance.currentUser;

  CollectionReference<Map<dynamic, dynamic>> _favReference =
      FirebaseFirestore.instance.collection('fav');

  Future<List<QueryDocumentSnapshot<Map<dynamic, dynamic>>>?> getFavProducts(
      String doc, String coll) async {
    try {
      QuerySnapshot<Map<dynamic, dynamic>> querySnapshot =
          await _favReference.doc(doc).collection(coll).orderBy('timestamp', descending: true).get();
      return querySnapshot.docs;
    } catch (e) {
      print(e.toString());
    }
  }

  DocumentReference<Map<String, dynamic>>? getProductById(
      ProductModel productModel) {
    try {
      DocumentReference<Map<String, dynamic>> documentReference = _favReference
          .doc(user?.uid)
          .collection('userFavs')
          .doc(productModel.id);
      return documentReference;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addProductToFav(ProductModel productModel) async {
    try {
      await FirebaseFirestore.instance
          .collection('fav')
          .doc(user?.uid)
          .collection('userFavs')
          .doc(productModel.id)
          .set(productModel.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<void> removeProductFromFav(ProductModel productModel) async {
    try {
      await FirebaseFirestore.instance
          .collection('fav')
          .doc(user?.uid)
          .collection('userFavs')
          .doc(productModel.id)
          .delete()
          .then((value) => print('item deleted ${productModel.id}'))
          .catchError((e) => print('error $e'));
    } catch (e) {
      print(e);
    }
  }
}
