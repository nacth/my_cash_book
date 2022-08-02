import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_cash_book/app/data/db/users_database.dart';
import 'package:my_cash_book/app/routes/app_pages.dart';

class LoginController extends GetxController {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() async {
    var password = passwordController.text;

    var user = await UsersDatabase.instance.login(
      usernameController.text,
      md5.convert(utf8.encode(password)).toString(),
    );

    if (user != null) {
      await box.write('user', user);

      Get.snackbar('Login', 'Welcome ${user.username}');
      Get.offNamed(Routes.HOME);
    } else {
      Get.snackbar('Login', 'Error: username or password is incorrect');
    }
  }
}
