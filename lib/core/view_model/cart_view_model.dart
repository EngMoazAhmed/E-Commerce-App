import 'package:flutter/foundation.dart';
import 'package:e_commerce_app/core/database/cart_database_helper.dart';
import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  CartDatabaseHelper cDBHelper = CartDatabaseHelper.cDB;

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  @override
  void onInit() async {
    super.onInit();
    await getAllProducts();
  }

  Future<void> addProduct(CartProductModel cartProduct) async {
    //Check all products exist in the cart
    for (CartProductModel product in cartProductModel) {
      //if the product u wanna add is different than what's inside the cart in terms of productID (not the same product) then add it.
      if (product.productId == cartProduct.productId) {
        return;
      }
    }

    //add in database
    await cDBHelper.insert(cartProduct);
    //add in cart view
    _cartProductModel.add(cartProduct);
    //get all products prices
    _totalPrice += (double.parse(cartProduct.price!.replaceAll('\$', '')) *
        cartProduct.quantity!);
    //update UI
    update();
  }

  Future<void> getAllProducts() async {
    _isLoading.value = true;
    //get all products
    _cartProductModel = await cDBHelper.getAllProducts();
    //get all products prices
    getTotalPrice();
    _isLoading.value = false;
    update();
  }

  getTotalPrice() {
    for (CartProductModel cartProduct in cartProductModel) {
      _totalPrice += (double.parse(cartProduct.price!.replaceAll('\$', '')) *
          cartProduct.quantity!);
    }
    // print(totalPrice);
    update();
  }

  //Increase Cart Product Item
  increaseProductItem(int index) async {
    _cartProductModel[index].quantity = _cartProductModel[index].quantity! + 1;
    _totalPrice +=
        double.parse(_cartProductModel[index].price!.replaceAll('\$', ''));
    await cDBHelper.updateCartQuantity(cartProductModel[index]);
    update();
  }

  //Decrease Cart Product Item
  decreaseProductItem(int index) async {
    if (cartProductModel[index].quantity! > 1) {
      _cartProductModel[index].quantity =
          _cartProductModel[index].quantity! - 1;
      _totalPrice -=
          double.parse(_cartProductModel[index].price!.replaceAll('\$', ''));
      await cDBHelper.updateCartQuantity(cartProductModel[index]);
      update();
    } else {
      return;
    }
  }

  //
}
