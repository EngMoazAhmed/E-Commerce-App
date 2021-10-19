import 'package:e_commerce_app/core/database/local_data_storage.dart';
import 'package:e_commerce_app/core/view_model/account_view_model.dart';
import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:e_commerce_app/core/view_model/cart_view_model.dart';
import 'package:e_commerce_app/core/view_model/checkout_view_model.dart';
import 'package:e_commerce_app/core/view_model/home_view_model.dart';
import 'package:e_commerce_app/core/view_model/nav_bar_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => NavBarViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => AccountViewModel());
    Get.lazyPut(() => LocalDataStorage());
    Get.putAsync(() async => await CartViewModel());
    Get.lazyPut(() => LocalDataStorage());
    Get.lazyPut(() => CheckoutViewModel());
  }
}
