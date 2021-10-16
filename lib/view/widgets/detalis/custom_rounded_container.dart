import 'package:e_commerce_app/view/widgets/common/custom_text.dart';
import 'package:flutter/material.dart';

class CustomRoundedContainer extends StatelessWidget {
  const CustomRoundedContainer({
    Key? key,
    required this.leftText,
    this.rightText,
    this.leftFontSize = 14,
    this.rightFontSize = 16,
    this.color,
  }) : super(key: key);

  final String leftText;
  final String? rightText;
  final double leftFontSize, rightFontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width * 0.42,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.3,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: leftText,
            fontSize: leftFontSize,
          ),
          if (rightText != null)
            CustomText(
              text: rightText!,
              fontSize: rightFontSize,
              fontWeight: FontWeight.bold,
            )
          else
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                color: color,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
        ],
      ),
    );
  }
}
