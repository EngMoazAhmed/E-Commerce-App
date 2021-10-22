import 'package:e_commerce_app/constants/checkout.dart';
import 'package:e_commerce_app/core/view_model/checkout_view_model.dart';
import 'package:e_commerce_app/view/widgets/checkout/custom_radio_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryBody extends StatelessWidget {
  const DeliveryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(builder: (controller) {
      return Column(
        children: [
          SizedBox(height: Get.height * 0.1),
          const CustomRadioTile(
            title: 'Standard Delivery',
            subtitle: 'Order will be delivered between 3 - 5 business days.',
            deliveryValue: DeliveryType.standardDelivery,
          ),
          SizedBox(height: Get.height * 0.05),
          const CustomRadioTile(
            title: 'Next Day Delivery',
            subtitle: 'Place your order before 6pm and your items will be '
                'delivered the next day.',
            deliveryValue: DeliveryType.nextDayDelivery,
          ),
          SizedBox(height: Get.height * 0.05),
          const CustomRadioTile(
            title: 'Nominated Delivery',
            subtitle:
                'Pick a particular date from the calendar and order will be '
                'delivered on selected date.',
            deliveryValue: DeliveryType.nominatedDelivery,
          ),
        ],
      );
    });
  }
}
