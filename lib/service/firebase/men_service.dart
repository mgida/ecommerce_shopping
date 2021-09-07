import 'package:cloud_firestore/cloud_firestore.dart';

class MenService {
  CollectionReference<Map<dynamic, dynamic>> _menReference =
      FirebaseFirestore.instance.collection('men');

  Future<List<QueryDocumentSnapshot<Map<dynamic, dynamic>>>?> getMenProducts(
      String doc, String coll) async {
    try {
      QuerySnapshot<Map<dynamic, dynamic>> querySnapshot =
          await _menReference.doc(doc).collection(coll).get();
      return querySnapshot.docs;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<QueryDocumentSnapshot<Map<dynamic, dynamic>>>?> filterProductBySize(
      {required String document, required String collection}) async {
    try {
      QuerySnapshot<Map<dynamic, dynamic>> querySnapshot = await _menReference
          .doc(document)
          .collection(collection)
          .where('size', isEqualTo: 'M')
          .get();
      return querySnapshot.docs;
    } catch (e) {
      print(e.toString());
    }
  }
}

