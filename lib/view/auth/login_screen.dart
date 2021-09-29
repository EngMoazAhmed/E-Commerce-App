import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/view/auth/widgets/custom_button.dart';
import 'package:e_commerce_app/view/auth/widgets/custom_signin_button.dart';
import 'package:e_commerce_app/view/auth/widgets/custom_text.dart';
import 'package:e_commerce_app/view/auth/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(
                  text: 'Welcome,',
                  fontSize: 30,
                ),
                CustomText(
                  text: 'Sign Up',
                  color: kPrimaryColor,
                  fontSize: 18,
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
              onSave: (value) {},
              validator: (value) {
                return '';
              },
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextFormField(
              text: 'Password',
              hint: '***********',
              onSave: (value) {},
              validator: (value) {
                return '';
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
              onPressed: () {},
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
              function: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            CustomSignInButton(
              text: 'Sign In with Facebook',
              imagePath: 'assets/images/facebook.png',
              function: () {},
            ),
          ],
        ),
      ),
    );
  }
}
