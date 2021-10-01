import 'dart:io';

import 'package:e_commerce_app/core/services/firestore_user.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/view/home_view.dart';
import 'package:e_commerce_app/view/login_control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  String? email, password, name;

  Rxn<User> _user = Rxn<User>();

  User? get user => _user.value;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //Google SignIn
  void signInWithGoogle() async {
    try {
      //Trigger the authentication flow
      final googleUser = await GoogleSignIn().signIn();
      // print(googleUser);

      //obtain the auth details from the user
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      //create a new credential for the user's device
      final AuthCredential googleAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // print(credential);

      await _auth.signInWithCredential(googleAuthCredential).then(
          (UserCredential userCredential) async =>
              await _saveUserToFirestore(userCredential));
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthException(e.code);
    } on PlatformException catch (e) {
      handleFirebaseAuthException(e.code);
      return;
    } catch (e) {
      print(e);
    }
  }

  void signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.accessToken != null) {
        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        // Once signed in, return the UserCredential
        await _auth.signInWithCredential(facebookAuthCredential).then(
            (UserCredential userCredential) async =>
                await _saveUserToFirestore(userCredential));
      }
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthException(e.code);
    } on PlatformException catch (e) {
      handleFirebaseAuthException(e.code);
    } catch (e) {
      print(e);
    }
  }

  //email & password
  void signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!.trim(),
        password: password!,
      );
      //Navigate to Home
      Get.offAll(() => HomeView());
      // print(userCredential);
    } on SocketException {
      print('network error');
      return;
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'user-not-found') {
      //   print('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   print('Wrong password provided for that user.');
      // }
      // Get.snackbar(
      //   'Error : ',
      //   e.code,
      //   colorText: Colors.black,
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      handleFirebaseAuthException(e.code);
    }
  }

  void signUpWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email!.trim(),
            password: password!,
          )
          .then((UserCredential userCredential) async =>
              await _saveUserToFirestore(userCredential));

      //Navigate to Home View
      Get.offAll(() => const HomeView());
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'weak-password') {
      //   print('The password provided is too weak.');
      // } else if (e.code == 'email-already-in-use') {
      //   print('The account already exists for that email.');
      // }
      handleFirebaseAuthException(e.code);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _saveUserToFirestore(UserCredential userCredential) async {
    final UserModel userModel = UserModel(
      userId: userCredential.user?.uid,
      name: name ?? userCredential.user?.displayName,
      email: userCredential.user?.email,
      profilePic: '',
    );

    await FirestoreUser.addUserToFirestore(userModel);
  }

  //FirebaseException Handling
  void handleFirebaseAuthException(String? errorCode) {
    String? errorMessage;
    switch (errorCode) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        errorMessage = "Email already used.";
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        errorMessage = "Wrong email/password combination.";
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        errorMessage = "No user found with this email.";
        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        errorMessage = "User disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        errorMessage = "Too many requests to log into this account.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        errorMessage = "Server error, please try again later.";
        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        errorMessage = "Email address is invalid.";
        break;
      default:
        errorMessage = "Login failed. Please Check your Internet Connetion.";
        break;
    }
    Get.snackbar(
      'Error : ',
      errorMessage,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void signOut() {
    _auth.signOut();
    _user.value = null;
    print(user);
    Get.offAll(() => const LoginControlView());
  }
}
