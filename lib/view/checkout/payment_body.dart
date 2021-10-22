import 'package:e_commerce_app/constants/checkout.dart';
import 'package:e_commerce_app/core/view_model/checkout_view_model.dart';
import 'package:e_commerce_app/view/widgets/checkout/custom_payment_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PaymentBody extends GetWidget<CheckoutViewModel> {
  const PaymentBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Get.height * 0.1,
        left: Get.width * 0.01,
        right: Get.width * 0.01,
      ),
      child: GetBuilder<CheckoutViewModel>(builder: (_) {
        return Column(
          children: [
            CustomPaymentTile(
              iconData: FontAwesomeIcons.paypal,
              iconColor: Colors.blue.shade900,
              title: 'Paypal',
              subtitle: 'Faster & safer way to send money',
              tileUniqueValue: PaymentType.paypal,
              controllerGroupValue: controller.paymentType,
              updateFunction: (newType) =>
                  controller.updatePaymentType(newType as PaymentType),
            ),
            SizedBox(height: Get.height * 0.025),
            CustomPaymentTile(
              iconData: FontAwesomeIcons.creditCard,
              iconColor: Colors.green,
              title: 'Credit Card',
              subtitle: 'Pay with Mastercard or Visa',
              tileUniqueValue: PaymentType.creditCard,
              controllerGroupValue: controller.paymentType,
              updateFunction: (newType) =>
                  controller.updatePaymentType(newType as PaymentType),
            ),
            SizedBox(height: Get.height * 0.025),
            CustomPaymentTile(
              iconData: FontAwesomeIcons.bitcoin,
              iconColor: Colors.brown,
              title: 'Crypto',
              subtitle: 'Pay with Crypto currency',
              tileUniqueValue: PaymentType.crypto,
              controllerGroupValue: controller.paymentType,
              updateFunction: (newType) =>
                  controller.updatePaymentType(newType as PaymentType),
            ),
          ],
        );
      }),
    );
  }
}
