import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoriesRef =
      FirebaseFirestore.instance.collection('Categories');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoriesRef.get();
    return value.docs;
  }
}
