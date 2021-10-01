import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../common/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child:  CustomText(
        text: text,
        fontColor: Colors.white,
        alignment: Alignment.center,
      ),
      style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,
        padding: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
