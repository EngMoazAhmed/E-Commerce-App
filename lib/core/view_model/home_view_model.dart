import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/services/home_service.dart';
import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:e_commerce_app/model/category_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCategories();
    getBestSellingProducts();
  }

  final List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;
  final List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;
  // final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  // ValueNotifier<bool> get isLoading => _isLoading;

  final Rx<bool> _loadingIndicator = false.obs;
  bool get loadingIndicator => _loadingIndicator.value;

  Future<void> getCategories() async {
    //as this function will run first - lets start the loadingIndicator here
    //true
    _changeLoadingIndicator();
    try {
      await HomeService().getCategories().then(
        (value) {
          // print(value.docs[0].data());
          value.forEach((element) {
            _categoryModel.add(
              CategoryModel.fromJson(
                element.data() as Map<String, dynamic>,
              ),
            );
          });
          update();
          // print(categoryModel.length);
        },
      );
    } on PlatformException catch (e) {
      AuthViewModel.handleFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      AuthViewModel.handleFirebaseAuthException(e.code);
    } catch (e) {
      AuthViewModel.handleFirebaseAuthException(e.toString());
    } finally {
      // _loadingIndicator.value = false;
    }
  }

  Future<void> getBestSellingProducts() async {
    try {
      await HomeService().getBestSelling().then((value) {
        value.forEach((element) {
          _productModel.add(
            ProductModel.fromJson(
              element.data() as Map<String, dynamic>,
            ),
          );
        });
      });
    } on PlatformException catch (e) {
      AuthViewModel.handleFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      AuthViewModel.handleFirebaseAuthException(e.code);
    } catch (e) {
      AuthViewModel.handleFirebaseAuthException(e.toString());
    } finally {
      //as this function will run second - lets disable the loadingIndicator here
      //false
      _changeLoadingIndicator();
    }
  }

  void _changeLoadingIndicator() {
    _loadingIndicator.value = !_loadingIndicator.value;
    update();
  }
}
