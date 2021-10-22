import 'dart:convert';
import 'package:e_commerce_app/constants/local_data_storage.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataStorage extends GetxController {
  Future<void> setUserData(UserModel userModel) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    await _sharedPreferences.setString(
        kLocalDataStorageKey, json.encode(userModel.toJson()));
  }

  Future<UserModel?> get getUserData async {
    try {
      UserModel? userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      //print(e.toString());
      return null;
    }
  }

  Future<UserModel>? _getUserData() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    return UserModel.fromJson(
        json.decode('${_sharedPreferences.getString(kLocalDataStorageKey)}'));
  }

  Future<void> deleteUserData() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    await _sharedPreferences.clear();
  }
}
