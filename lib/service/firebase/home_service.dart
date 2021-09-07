import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  CollectionReference<Map<dynamic, dynamic>> _recommendationsReference =
      FirebaseFirestore.instance.collection('recommendations');

  CollectionReference<Map<dynamic, dynamic>> _trendingReference =
      FirebaseFirestore.instance.collection('trending');

  Future<List<QueryDocumentSnapshot<Map<dynamic, dynamic>>>?>
      getAllRecommendationsProducts() async {
    try {
      QuerySnapshot<Map<dynamic, dynamic>> querySnapshot =
          await _recommendationsReference.get();
      return querySnapshot.docs;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<QueryDocumentSnapshot<Map<dynamic, dynamic>>>?>
      getAllTrendingProducts() async {
    try {
      //  await FirebaseFirestore.instance.collection('trending').get().then((QuerySnapshot<Map<dynamic, dynamic>> querySnapshot) => querySnapshot.docs);
      QuerySnapshot<Map<dynamic, dynamic>> querySnapshot =
          await _trendingReference.get();
      return querySnapshot.docs;
    } catch (e) {
      print(e.toString());
    }
  }
}
