import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_app/model/user_model.dart';

class FirestoreUser {
  CollectionReference _users = FirebaseFirestore.instance.collection('users');

  void saveUserOnFirestore(UserModel userModel) async {
    await _users.doc(userModel.userId).set((userModel.toJson()));
  }
}
