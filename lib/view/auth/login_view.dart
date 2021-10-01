import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:e_commerce_app/view/auth/register_view.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_signin_button.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: 'Welcome,',
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => RegisterView(),
                          transition: Transition.leftToRight),
                      child: const CustomText(
                        text: 'Sign Up',
                        color: kPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: 'Sign in to Continue',
                  fontSize: 14,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 30,
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
                const CustomText(
                  text: 'Forgot Password',
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'SIGN IN',
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: '- OR -',
                  alignment: Alignment.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomSignInButton(
                  text: 'Sign In with Google',
                  imagePath: 'assets/images/google.png',
                  function: () {
                    controller.signInWithGoogle();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomSignInButton(
                  text: 'Sign In with Facebook',
                  imagePath: 'assets/images/facebook.png',
                  function: () {
                    // controller.facebookSignInMethod();
                    controller.signInWithFacebook();
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
