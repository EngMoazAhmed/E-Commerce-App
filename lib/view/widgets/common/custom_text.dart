import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.fontColor = Colors.black,
    this.alignment = Alignment.topLeft,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color fontColor;
  final Alignment alignment;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: fontColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
