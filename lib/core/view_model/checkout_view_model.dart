import 'package:e_commerce_app/constants/checkout.dart';
import 'package:e_commerce_app/view/checkout/address.body.dart';
import 'package:e_commerce_app/view/checkout/delivery.body.dart';
import 'package:e_commerce_app/view/checkout/finished.body.dart';
import 'package:e_commerce_app/view/checkout/summary.body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutViewModel extends GetxController {
  CheckoutType currentScreen = CheckoutType.delivery;
  Widget currentCheckoutBody = const DeliveryBody();
  DeliveryType deliveryType = DeliveryType.standardDelivery;

  void updateDeliveryType(DeliveryType newType) {
    deliveryType = newType;
    update();
  }

  void updateCheckoutScreen(int bodyIndex) {
    switch (bodyIndex) {
      case 0:
        currentScreen = CheckoutType.delivery;
        currentCheckoutBody = const DeliveryBody();
        break;
      case 1:
        currentScreen = CheckoutType.address;
        currentCheckoutBody = const AddressBody();
        break;
      case 2:
        currentScreen = CheckoutType.summary;
        currentCheckoutBody = const SummaryBody();
        break;
      case 3:
        currentScreen = CheckoutType.finished;
        currentCheckoutBody = const FinishedBody();
        break;
    }
    update();
  }

  void resetCheckoutScreen() {
    updateCheckoutScreen(0);
  }
}
