import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Account View'),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<AuthViewModel>(builder: (controller) {
            return ElevatedButton(
              child: const Text('Sign Out!'),
              onPressed: () => controller.signOut(),
            );
          }),
        ],
      ),
    );
  }
}
