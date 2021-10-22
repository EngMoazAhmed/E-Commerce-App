import 'package:e_commerce_app/constants/checkout.dart';
import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/core/view_model/checkout_view_model.dart';
import 'package:e_commerce_app/view/widgets/common/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    Key? key,
    required this.color,
    required this.circleText,
  }) : super(key: key);
  final Color color;
  final String circleText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          width: 30,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            // color: color,
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: CircleAvatar(
            radius: 2,
            backgroundColor: color,
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        GetBuilder<CheckoutViewModel>(builder: (controller) {
          return CustomText(
            text: circleText,
            fontSize: Get.width * 0.027,
            fontWeight: FontWeight.bold,
            fontColor: controller.currentScreen == CheckoutType.delivery &&
                    circleText == 'Delivery'
                ? kPrimaryColor
                : controller.currentScreen == CheckoutType.address &&
                        circleText == 'Address'
                    ? kPrimaryColor
                    : controller.currentScreen == CheckoutType.payment &&
                            circleText == 'Payment'
                        ? kPrimaryColor
                        : controller.currentScreen == CheckoutType.summary &&
                                circleText == 'Summary'
                            ? kPrimaryColor
                            : Colors.grey,
          );
        }),
      ],
    );
  }
}
