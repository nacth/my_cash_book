import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_cash_book/app/modules/cash_flow/widgets/cash_flow_widget.dart';
import 'package:my_cash_book/app/widgets/button_custom.dart';

import '../controllers/cash_flow_controller.dart';

class CashFlowView extends GetView<CashFlowController> {
  const CashFlowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Detail Cash Flow',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(context.mediaQueryPadding.top),
          child: Column(
            children: [
              Expanded(
                child: CashFlowWidget(
                  controller: controller,
                ),
              ),
              ButtonCustom(
                color: Colors.amberAccent,
                text: 'Kembali',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
