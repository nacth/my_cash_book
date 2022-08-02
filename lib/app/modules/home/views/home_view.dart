import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_cash_book/app/modules/home/widgets/cash_chart_widget.dart';
import 'package:my_cash_book/app/modules/home/widgets/cash_information_widget.dart';

import '../controllers/home_controller.dart';
import '../widgets/cash_menu_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Rangkuman Bulan Ini',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(context.mediaQueryPadding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CashInformationWidget(controller: controller),
              const SizedBox(height: 16),
              CashChartWidget(controller: controller),
              const SizedBox(height: 16),
              const CashMenuWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
