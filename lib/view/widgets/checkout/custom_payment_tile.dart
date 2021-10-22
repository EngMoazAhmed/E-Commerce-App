import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/view/widgets/common/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPaymentTile extends StatelessWidget {
  const CustomPaymentTile({
    Key? key,
    required this.iconData,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.tileUniqueValue,
    required this.controllerGroupValue,
    required this.updateFunction,
  }) : super(key: key);
  final IconData iconData;
  final Color iconColor;
  final String title, subtitle;
  final Object tileUniqueValue;
  final Object? controllerGroupValue;
  final void Function(Object?)? updateFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ListTile(
        leading: Icon(
          iconData,
          color: iconColor,
          size: Get.width * 0.07,
        ),
        title: CustomText(
          text: title,
          fontWeight: FontWeight.bold,
          fontSize: Get.width * 0.045,
        ),
        subtitle: CustomText(
          text: subtitle,
          fontColor: Colors.grey.shade700,
          fontSize: Get.width * 0.03,
        ),
        trailing: Radio(
          value: tileUniqueValue,
          groupValue: controllerGroupValue,
          onChanged: updateFunction,
          activeColor: kPrimaryColor,
        ),
      ),
    );
  }
}
