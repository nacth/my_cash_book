import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_cash_book/app/modules/login/widgets/login_button_widget.dart';
import 'package:my_cash_book/app/modules/login/widgets/login_form.dart';
import 'package:my_cash_book/app/modules/login/widgets/logo_widget.dart';
import 'package:my_cash_book/app/modules/login/widgets/title_widget.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(context.mediaQueryPadding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: const [
                  LogoWidget(),
                  SizedBox(height: 16),
                  TitleWidget(),
                ],
              ),
              Column(
                children: [
                  FormLoginWidget(controller: controller),
                  const SizedBox(height: 16),
                  LoginButtonWidget(controller: controller),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
