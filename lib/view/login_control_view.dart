import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:e_commerce_app/view/auth/login_view.dart';
import 'package:e_commerce_app/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginControlView extends GetWidget<AuthViewModel> {
  const LoginControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.user != null ? HomeView() : LoginView();
    });
  }
}
