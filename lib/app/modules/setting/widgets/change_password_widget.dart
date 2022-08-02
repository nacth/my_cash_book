import 'package:flutter/material.dart';
import 'package:my_cash_book/app/modules/setting/controllers/setting_controller.dart';
import 'package:my_cash_book/app/widgets/text_custom.dart';

class ChangePasswordWidget extends StatelessWidget {
  const ChangePasswordWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SettingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextCustom(
          decoration: TextDecoration.underline,
          decorationThickness: 2,
          fontWeight: FontWeight.bold,
          text: 'Ganti Password',
        ),
        const SizedBox(height: 16),
        const TextCustom(
          text: 'Password Saat Ini',
          fontWeight: FontWeight.bold,
        ),
        TextField(
          controller: controller.oldPasswordController,
          obscureText: true,
        ),
        const SizedBox(height: 16),
        const TextCustom(
          text: 'Password Baru',
          fontWeight: FontWeight.bold,
        ),
        TextField(
          controller: controller.newPasswordController,
          obscureText: true,
        ),
      ],
    );
  }
}
