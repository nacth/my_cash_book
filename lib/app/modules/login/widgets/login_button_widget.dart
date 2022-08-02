import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cash_book/app/modules/login/controllers/login_controller.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ElevatedButton(
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          controller.login();
        },
        child: const Text('Login'),
      ),
    );
  }
}
