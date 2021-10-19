import 'package:e_commerce_app/view/widgets/auth/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import 'custom_text.dart';

class DetailsActionButton extends StatelessWidget {
  const DetailsActionButton({
    Key? key,
    required this.upperText,
    required this.lowerText,
    required this.buttonText,
    required this.function,
    this.textColor = Colors.white,
    this.buttonColor = kPrimaryColor,
  }) : super(key: key);

  final String upperText;
  final String lowerText;
  final String buttonText;
  final Color textColor, buttonColor;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomText(
                text: upperText,
                fontColor: Colors.grey,
                fontSize: 14,
              ),
              CustomText(
                text: lowerText,
                fontColor: kPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          CustomButton(
            text: buttonText,
            textColor: textColor,
            buttonColor: buttonColor,
            // padding: const EdgeInsets.symmetric(
            //   horizontal: 40,
            //   vertical: 15,
            // ),
            onPressed: function,
          ),
        ],
      ),
    );
  }
}
