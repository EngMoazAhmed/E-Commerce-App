import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoriesRef =
      FirebaseFirestore.instance.collection('Categories');
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getCategories() async {
    var value = await _categoriesRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _productsRef.get();
    return value.docs;
  }
}
