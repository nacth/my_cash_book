import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_cash_book/app/modules/setting/widgets/about_widget.dart';
import 'package:my_cash_book/app/modules/setting/widgets/change_password_widget.dart';
import 'package:my_cash_book/app/widgets/button_custom.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Pengaturan',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(context.mediaQueryPadding.top),
          child: Column(
            children: [
              ChangePasswordWidget(controller: controller),
              const SizedBox(height: 16),
              Column(
                children: [
                  ButtonCustom(
                    color: Colors.amberAccent,
                    text: 'Kembali',
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Get.back();
                    },
                  ),
                  ButtonCustom(
                    color: Colors.greenAccent,
                    text: 'Simpan',
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      controller.changePassword();
                    },
                  ),
                ],
              ),
              const Spacer(),
              ButtonCustom(
                color: Colors.redAccent,
                text: 'Logout',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  controller.logout();
                },
              ),
              const AboutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
