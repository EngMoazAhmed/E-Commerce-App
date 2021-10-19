import 'package:e_commerce_app/constants/checkout.dart';
import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/core/view_model/checkout_view_model.dart';
import 'package:e_commerce_app/view/widgets/common/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRadioTile extends GetWidget<CheckoutViewModel> {
  const CustomRadioTile({
    required this.title,
    required this.subtitle,
    required this.deliveryValue,
    Key? key,
  }) : super(key: key);
  final String title, subtitle;
  final DeliveryType deliveryValue;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(builder: (_) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: RadioListTile(
          value: deliveryValue,
          groupValue: controller.deliveryType,
          onChanged: (newType) {
            controller.updateDeliveryType(newType as DeliveryType);
          },
          title: Directionality(
            textDirection: TextDirection.ltr,
            child: CustomText(
              text: title,
              fontWeight: FontWeight.bold,
              fontSize: Get.width * 0.05,
            ),
          ),
          subtitle: Directionality(
            textDirection: TextDirection.ltr,
            child: CustomText(
              text: subtitle,
              fontSize: Get.width * 0.04,
            ),
          ),
          activeColor: kPrimaryColor,
        ),
      );
    });
  }
}
