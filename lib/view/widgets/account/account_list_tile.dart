import 'package:e_commerce_app/view/widgets/common/custom_text.dart';
import 'package:flutter/material.dart';

class AccountListTile extends StatelessWidget {
  const AccountListTile({
    Key? key,
    required this.width,
    required this.imageName,
    required this.title,
    required this.function,
  }) : super(key: key);

  final double width;
  final String imageName;
  final String title;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'assets/images/$imageName.png',
        width: width * 0.09,
      ),
      title: CustomText(
        text: title,
        alignment: Alignment.topLeft,
        fontSize: 15,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: width * 0.04,
        color: Colors.black,
      ),
      onTap: function,
    );
  }
}
