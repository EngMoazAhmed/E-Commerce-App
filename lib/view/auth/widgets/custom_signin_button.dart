import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomSignInButton extends StatelessWidget {
  const CustomSignInButton({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.function,
  }) : super(key: key);

  final String text, imagePath;

  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(15),
        side: const BorderSide(
          color: Colors.grey,
          width: 0.4,
        ),
        backgroundColor: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 25,
          ),
          const SizedBox(
            width: 90,
          ),
          CustomText(
            text: text,
            fontSize: 14,
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
      onPressed: function,
    );
  }
}
