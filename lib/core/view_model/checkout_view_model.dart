import 'package:e_commerce_app/constants/checkout.dart';
import 'package:e_commerce_app/view/checkout/address_body.dart';
import 'package:e_commerce_app/view/checkout/delivery_body.dart';
import 'package:e_commerce_app/view/checkout/payment_body.dart';
import 'package:e_commerce_app/view/checkout/summary_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutViewModel extends GetxController {
  String? street1, street2, city, state, country;
  CheckoutType currentScreen = CheckoutType.delivery;
  Widget currentCheckoutBody = const DeliveryBody();
  DeliveryType deliveryType = DeliveryType.standardDelivery;
  PaymentType paymentType = PaymentType.creditCard;

  void updatePaymentType(PaymentType newType) {
    paymentType = newType;
    update();
  }

  void updateDeliveryType(DeliveryType newType) {
    deliveryType = newType;
    update();
  }

  AddressType addressType = AddressType.sameAddress;

  void updateAddressType(AddressType newType) {
    addressType = newType;
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
        currentScreen = CheckoutType.payment;
        currentCheckoutBody = const PaymentBody();
        break;
      case 3:
        currentScreen = CheckoutType.summary;
        currentCheckoutBody = const SummaryBody();
        break;
    }
    update();
  }

  void resetCheckoutScreen() {
    updateCheckoutScreen(0);
  }
}
