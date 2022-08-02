import 'package:flutter/material.dart';
import 'package:my_cash_book/app/modules/login/controllers/login_controller.dart';

class FormLoginWidget extends StatelessWidget {
  const FormLoginWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller.usernameController,
          decoration: const InputDecoration(hintText: 'Username'),
          textAlign: TextAlign.center,
        ),
        TextField(
          controller: controller.passwordController,
          decoration: const InputDecoration(hintText: 'Password'),
          obscureText: true,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
