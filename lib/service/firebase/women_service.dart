import 'package:cloud_firestore/cloud_firestore.dart';


class WomenService {
  CollectionReference<Map<dynamic, dynamic>> _womenReference =
      FirebaseFirestore.instance.collection('women');

  Future<List<QueryDocumentSnapshot<Map<dynamic, dynamic>>>?> getWomenProducts(
      String doc, String coll) async {
    try {
      QuerySnapshot<Map<dynamic, dynamic>> querySnapshot =
          await _womenReference.doc(doc).collection(coll).get();
      return querySnapshot.docs;
    } catch (e) {
      print(e.toString());
    }
  }
}
