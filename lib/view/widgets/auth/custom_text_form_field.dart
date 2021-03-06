import 'package:flutter/material.dart';

import '../common/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.text,
    required this.hint,
    required this.onSave,
    required this.validator,
  }) : super(key: key);

  final String text, hint;
  final Function(String?) onSave;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 14,
          fontColor: Colors.grey.shade900,
        ),
        TextFormField(
          textInputAction: TextInputAction.next,
          obscureText: text == 'Password' ? true : false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            fillColor: Colors.white,
          ),
          onSaved: onSave,
          validator: validator,
        ),
      ],
    );
  }
}
