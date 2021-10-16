import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:e_commerce_app/core/view_model/nav_bar_view_model.dart';

import 'package:e_commerce_app/view/auth/login_view.dart';

import 'package:e_commerce_app/view/widgets/home/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginControlView extends GetWidget<AuthViewModel> {
  const LoginControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.user == null
          ? LoginView()
          : Scaffold(
              body: GetBuilder<NavBarViewModel>(
                init: NavBarViewModel(),
                builder: (controller) => controller.currentScreen,
              ),
              bottomNavigationBar: const BottomNavigationBarWidget(),
            );
    });
  }
}
