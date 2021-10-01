import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/services/home_service.dart';
import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:e_commerce_app/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  final List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  Future<void> getCategories() async {
    _isLoading.value = true;
    try {
      await HomeService().getCategory().then(
        (value) {
          // print(value.docs[0].data());
          for (QueryDocumentSnapshot<Object?> element in value) {
            _categoryModel.add(
              CategoryModel.fromJson(element.data() as Map<String, dynamic>),
            );
          }
          _isLoading.value = false;
          update();
          // print(categoryModel.length);
        },
      );
    } on PlatformException catch (e) {
      AuthViewModel.handleFirebaseAuthException(e.code);
      _isLoading.value = false;
    } on FirebaseException catch (e) {
      AuthViewModel.handleFirebaseAuthException(e.code);
      _isLoading.value = false;
    } catch (e) {
      AuthViewModel.handleFirebaseAuthException(e.toString());
      _isLoading.value = false;
    }

    // finally {
    //   _isLoading.value = false;
    // }
  }
}
