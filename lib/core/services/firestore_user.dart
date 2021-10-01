import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/user_model.dart';

class FirestoreUser {
  // final CollectionReference _userCollectionReference =
  //     FirebaseFirestore.instance.collection('Users');

  static Future<void> addUserToFirestore(UserModel userModel) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
}
