import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_cash_book/app/data/db/users_database.dart';
import 'package:my_cash_book/app/data/model/user.dart';
import 'package:my_cash_book/app/routes/app_pages.dart';

class SettingController extends GetxController {
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    super.onClose();
  }

  void changePassword() async {
    var userJson = await box.read('user');
    var user = UserModel.fromJson(userJson);
    var password = user.password;

    var oldPassword = oldPasswordController.text;
    var newPassword = newPasswordController.text;

    if (md5.convert(utf8.encode(oldPassword)).toString() == password) {
      await UsersDatabase.instance.update(
        user = user.copyWith(
          password: md5.convert(utf8.encode(newPassword)).toString(),
          updatedAt: DateTime.now(),
        ),
      );

      await box.write('user', user.toJson());

      Get.snackbar('Change Password', 'Password changed successfully');
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar('Change Password', 'Error: oldPassword is incorrect');
    }
  }

  void logout() async {
    var userJson = await box.read('user');
    var user = UserModel.fromJson(userJson);
    var username = user.username;
    await box.remove('user');

    Get.snackbar('Logout', 'Goodbye $username');
    Get.offAllNamed(Routes.LOGIN);
  }
}
