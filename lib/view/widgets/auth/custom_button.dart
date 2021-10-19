import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../common/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white,
    this.buttonColor = kPrimaryColor,

    // this.padding = const EdgeInsets.all(18),
  }) : super(key: key);

  final String text;
  final void Function() onPressed;
  final Color textColor, buttonColor;

  // final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: CustomText(
        text: text,
        fontColor: textColor,
        alignment: Alignment.center,
      ),
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        fixedSize: Size(Get.width * 0.3, Get.height * 0.07),

        // padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(
            color: kPrimaryColor,
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
