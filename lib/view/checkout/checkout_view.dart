import 'package:e_commerce_app/constants/checkout.dart';
import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/core/view_model/cart_view_model.dart';
import 'package:e_commerce_app/core/view_model/checkout_view_model.dart';
import 'package:e_commerce_app/view/widgets/checkout/circle_widget.dart';
import 'package:e_commerce_app/view/widgets/checkout/line_widget.dart';
import 'package:e_commerce_app/view/widgets/common/details_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CheckoutView extends GetWidget<CheckoutViewModel> {
  CheckoutView({Key? key}) : super(key: key);

  @override
  final controller = Get.put(CheckoutViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: Get.height * 0.09,
          left: Get.width * 0.03,
          right: Get.width * 0.03,
        ),
        child: GetBuilder<CheckoutViewModel>(
            // init: CheckoutViewModel(),
            builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //delivery -- 0
                  const CircleWidget(
                      circleText: 'Delivery', color: kPrimaryColor),
                  LineWidget(
                      color: controller.currentScreen != CheckoutType.delivery
                          ? kPrimaryColor
                          : Colors.white),
                  //address -- 1
                  CircleWidget(
                      circleText: 'Address',
                      color: controller.currentScreen != CheckoutType.delivery
                          ? kPrimaryColor
                          : Colors.white),
                  LineWidget(
                      color: controller.currentScreen == CheckoutType.payment ||
                              controller.currentScreen == CheckoutType.summary
                          ? kPrimaryColor
                          : Colors.white),
                  //summary -- 2
                  CircleWidget(
                      circleText: 'Payment',
                      color: controller.currentScreen == CheckoutType.payment ||
                              controller.currentScreen == CheckoutType.summary
                          ? kPrimaryColor
                          : Colors.white),
                  LineWidget(
                      color: controller.currentScreen == CheckoutType.summary
                          ? kPrimaryColor
                          : Colors.white),
                  //finished -- 3
                  CircleWidget(
                      circleText: 'Summary',
                      color: controller.currentScreen == CheckoutType.summary
                          ? kPrimaryColor
                          : Colors.white),
                ],
              ),
              Expanded(
                child: SizedBox(
                  child: controller.currentCheckoutBody,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DetailsActionButton(
                    upperText: '',
                    lowerText: '',
                    buttonColor: Colors.white,
                    textColor: kPrimaryColor,
                    buttonText:
                        controller.currentScreen == CheckoutType.delivery
                            ? 'Cancel'
                            : 'Back',
                    function: controller.currentScreen == CheckoutType.delivery
                        ? () {
                            Get.back();
                          }
                        : () {
                            controller.updateCheckoutScreen(
                                controller.currentScreen.index - 1);
                          },
                  ),
                  GetBuilder<CartViewModel>(builder: (cartController) {
                    return DetailsActionButton(
                      upperText: '',
                      lowerText: '',
                      buttonText:
                          controller.currentScreen != CheckoutType.summary
                              ? 'Next'
                              : 'Order',
                      function: controller.currentScreen != CheckoutType.summary
                          ? () {
                              // print(controller.deliveryType);
                              controller.updateCheckoutScreen(
                                  controller.currentScreen.index + 1);
                            }
                          : () {
                              //order function
                              //reset screens
                              controller.resetCheckoutScreen();
                              //notify of success order
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Dummy Order is filled!'),
                                ),
                              );
                              //clear the card
                              cartController.deleteAllProductsInCart();
                              //Get of this screen
                              Get.back();
                            },
                    );
                  }),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
