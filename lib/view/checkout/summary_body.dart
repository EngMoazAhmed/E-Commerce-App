import 'package:e_commerce_app/constants/checkout.dart';
import 'package:e_commerce_app/core/view_model/cart_view_model.dart';
import 'package:e_commerce_app/core/view_model/checkout_view_model.dart';
import 'package:e_commerce_app/view/widgets/common/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryBody extends GetWidget<CartViewModel> {
  const SummaryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Get.height * 0.05,
        left: Get.width * 0.01,
        right: Get.width * 0.01,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomText(
              text: 'Items',
              fontWeight: FontWeight.bold,
            ),
            GetBuilder<CartViewModel>(
              builder: (_) {
                return Container(
                  height: Get.height * 0.26,
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.cartProductModel.length,
                    // separatorBuilder: (context, index) => SizedBox(
                    //   width: Get.width * 0.01,
                    // ),
                    itemBuilder: (context, index) {
                      final String itemName =
                          controller.cartProductModel[index].name.toString();
                      final String itemImage =
                          controller.cartProductModel[index].image.toString();
                      final int itemQuantity =
                          controller.cartProductModel[index].quantity!;
                      final double itemTotalPrice = itemQuantity *
                          double.parse(controller.cartProductModel[index].price!
                              .replaceAll('\$', ''));

                      return Container(
                        width: Get.width * 0.5,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              itemImage,
                              fit: BoxFit.fill,
                              height: Get.height * 0.13,
                            ),
                            SizedBox(width: Get.height * 0.05),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Name : $itemName',
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                                CustomText(text: 'Quantity : $itemQuantity'),
                                CustomText(
                                    text: 'Total Price : $itemTotalPrice'
                                        '\$'),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            GetBuilder<CheckoutViewModel>(
              builder: (checkoutController) => Column(
                children: [
                  const Divider(thickness: 1.5),
                  const CustomText(
                    text: 'Delivery',
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: checkoutController.deliveryType ==
                            DeliveryType.standardDelivery
                        ? 'Standard Delivery : 3-5 days'
                        : checkoutController.deliveryType ==
                                DeliveryType.nextDayDelivery
                            ? 'Next Day Delivery : '
                                'Tomorrow'
                            : 'Nominated Delivery : Check '
                                'your nearest pickup location',
                  ),
                  const Divider(thickness: 1.5),
                  const CustomText(
                    text: 'Address',
                    fontWeight: FontWeight.bold,
                  ),
                  const CustomText(
                    text:
                        '21, Alex Davidson Avenue - Opposite Omegatron, Vicent '
                        'Quarters - Victoria Island - Nigeria',
                  ),
                  const Divider(thickness: 1.5),
                  const CustomText(
                    text: 'Payment',
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                      text: checkoutController.paymentType == PaymentType.paypal
                          ? 'Payment with Paypal'
                          : checkoutController.paymentType ==
                                  PaymentType.creditCard
                              ? 'Credit card ends with '
                                  '0445'
                              : 'Payment with Crypto'),
                  GetBuilder<CartViewModel>(builder: (_) {
                    return CustomText(
                        text: 'Total Price : ${controller.totalPrice}\$');
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
