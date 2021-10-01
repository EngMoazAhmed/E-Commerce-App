import 'package:e_commerce_app/core/view_model/nav_bar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarViewModel>(
      builder: (controller) => BottomNavigationBar(
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade100,
        currentIndex: controller.navBarIndex,
        onTap: (index) => controller.changeNavBarIndex(index),
        items: [
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text('Explore'),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/explore.png',
                width: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text('Cart'),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/cart.png',
                width: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text('Account'),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/user.png',
                width: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
