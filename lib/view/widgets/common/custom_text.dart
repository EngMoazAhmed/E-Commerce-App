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
    this.textStyle,
    this.textOverflow,
    this.fontHeight = 1.5,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final double fontSize;
  final double fontHeight;
  final Color fontColor;
  final Alignment alignment;
  final FontWeight fontWeight;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              color: fontColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
              overflow: textOverflow,
              height: fontHeight,
            ),
      ),
    );
  }
}
