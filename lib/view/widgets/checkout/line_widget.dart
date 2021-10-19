import 'package:e_commerce_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10,
          width: Get.width * 0.15,
          decoration: const BoxDecoration(
            // color: color,
            border: Border.symmetric(
              horizontal: BorderSide(color: Colors.black),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            height: 5,
            width: 50,
            color: color,
          ),
        ),
        SizedBox(height: Get.height * 0.034),
      ],
    );
  }
}
