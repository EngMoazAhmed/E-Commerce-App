import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:e_commerce_app/view/widgets/home/bottom_navigation_bar.dart';
import 'package:e_commerce_app/view/widgets/common/custom_text.dart';
import 'package:e_commerce_app/view/widgets/home/custom_text_field.dart';
import 'package:e_commerce_app/view/widgets/home/list_view_category.dart';
import 'package:e_commerce_app/view/widgets/home/list_view_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<AuthViewModel> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomTextField(),
              const SizedBox(
                height: 50,
              ),
              const CustomText(
                text: 'Catergories',
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              const ListViewCategory(),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  CustomText(
                    text: 'Best Selling',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  CustomText(
                    text: 'See all',
                    fontSize: 16,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const ListViewProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
