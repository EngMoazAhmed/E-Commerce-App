import 'package:e_commerce_app/view/account/account_view.dart';
import 'package:e_commerce_app/view/cart/cart_view.dart';
import 'package:e_commerce_app/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarViewModel extends GetxController {
  int _navBarIndex = 0;
  Widget _currentScreen = const HomeView();

  get currentScreen => _currentScreen;
  get navBarIndex => _navBarIndex;

  void changeNavBarIndex(int newIndex) {
    _navBarIndex = newIndex;
    switch (navBarIndex) {
      case 0:
        _currentScreen = const HomeView();
        break;
      case 1:
        _currentScreen = const CartView();
        break;
      case 2:
        _currentScreen = const AccountView();
        break;
      default:
        _currentScreen = const HomeView();
        break;
    }
    update();
  }
}
