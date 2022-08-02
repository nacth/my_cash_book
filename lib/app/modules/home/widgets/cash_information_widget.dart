import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cash_book/app/modules/home/controllers/home_controller.dart';
import 'package:my_cash_book/app/widgets/text_custom.dart';

class CashInformationWidget extends StatelessWidget {
  const CashInformationWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Column(
          children: [
            TextCustom(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              text: 'Pemasukan ${controller.incomeText}',
            ),
            TextCustom(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              text: 'Pengeluaran ${controller.outcomeText}',
            )
          ],
        );
      },
    );
  }
}
