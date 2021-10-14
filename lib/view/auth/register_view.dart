import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:e_commerce_app/view/auth/login_view.dart';
import 'package:e_commerce_app/view/widgets/auth/custom_button.dart';
import 'package:e_commerce_app/view/widgets/auth/custom_signin_button.dart';
import 'package:e_commerce_app/view/widgets/common/custom_text.dart';
import 'package:e_commerce_app/view/widgets/auth/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  RegisterView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0,
        leading: GestureDetector(
          onTap: () =>
              Get.off(() => LoginView(), transition: Transition.rightToLeft),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomText(
                  text: 'Sign Up,',
                  fontSize: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  text: 'Name',
                  hint: 'Moaz Ahmed',
                  onSave: (value) {
                    controller.name = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: 'Email',
                  hint: 'moaz@test.com',
                  onSave: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: 'Password',
                  hint: '***********',
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'SIGN UP',
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      controller.signUpWithEmailAndPassword();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
