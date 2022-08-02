import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/cash_logo.png',
      width: Get.width * 0.3,
      height: Get.width * 0.3,
    );
  }
}