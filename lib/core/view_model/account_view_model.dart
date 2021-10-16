import 'package:e_commerce_app/core/database/local_data_storage.dart';
import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/view/widgets/account/account_list_tile.dart';
import 'package:get/get.dart';

class AccountViewModel extends GetxController {
  final LocalDataStorage _localDataStorage = Get.find<LocalDataStorage>();

  final List<AccountListTile> listTiles = [
    AccountListTile(
      width: Get.width,
      imageName: 'Icon_Edit-Profile',
      title: 'Edit Profile',
      function: () {},
    ),
    AccountListTile(
      width: Get.width,
      imageName: 'Icon_Location',
      title: 'Shipping Address',
      function: () {},
    ),
    AccountListTile(
      width: Get.width,
      imageName: 'Icon_History',
      title: 'Order History',
      function: () {},
    ),
    AccountListTile(
      width: Get.width,
      imageName: 'Icon_Payment',
      title: 'Cards',
      function: () {},
    ),
    AccountListTile(
      width: Get.width,
      imageName: 'Icon_Alert',
      title: 'Notifications',
      function: () {},
    ),
    AccountListTile(
      width: Get.width,
      imageName: 'Icon_Exit',
      title: 'Log Out',
      function: () {
        final AuthViewModel _authViewModel = Get.find<AuthViewModel>();

        _authViewModel.signOut();
      },
    ),
  ];

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  @override
  onInit() async {
    super.onInit();
    await getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    await _localDataStorage.getUserData.then((userData) {
      _userModel = userData;
    });
    update();
  }
}
