import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<AuthViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            controller.signOut();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
