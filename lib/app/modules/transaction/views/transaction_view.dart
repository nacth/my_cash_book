import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_cash_book/app/modules/transaction/widgets/add_transaction_widget.dart';
import 'package:my_cash_book/app/widgets/button_custom.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: (controller.type == 'in')
            ? const Text(
                'Tambah Pemasukan',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const Text(
                'Tambah Pengeluaran',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(context.mediaQueryPadding.top),
          child: Column(
            children: [
              AddTransactionWidget(controller: controller),
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
                      controller.create();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
