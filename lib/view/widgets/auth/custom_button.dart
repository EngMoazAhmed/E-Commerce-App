import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../common/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.padding = const EdgeInsets.all(18),
  }) : super(key: key);

  final String text;
  final void Function() onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: CustomText(
        text: text,
        fontColor: Colors.white,
        alignment: Alignment.center,
      ),
      style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
