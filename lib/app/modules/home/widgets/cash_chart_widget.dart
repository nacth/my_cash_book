import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_cash_book/app/data/model/chart_data.dart';
import 'package:my_cash_book/app/modules/home/controllers/home_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CashChartWidget extends StatelessWidget {
  const CashChartWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.width * 0.5,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Obx(
        () {
          TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);
          if (controller.chartDataIncome.isNotEmpty ||
              controller.chartDataOutcome.isNotEmpty) {
            return SfCartesianChart(
              title: ChartTitle(text: 'Line Chart'),
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
              ),
              tooltipBehavior: tooltipBehavior,
              primaryXAxis: DateTimeAxis(
                intervalType: DateTimeIntervalType.days,
                axisLine: const AxisLine(width: 1),
              ),
              primaryYAxis: NumericAxis(
                numberFormat: NumberFormat.compactSimpleCurrency(locale: 'id'),
                axisLine: const AxisLine(width: 1),
              ),
              series: <SplineSeries>[
                SplineSeries<ChartData, DateTime>(
                  color: Colors.greenAccent,
                  name: 'Income',
                  dataSource: controller.chartDataIncome,
                  enableTooltip: true,
                  xValueMapper: (data, _) => data.date,
                  yValueMapper: (data, _) => data.nominal,
                ),
                SplineSeries<ChartData, DateTime>(
                  color: Colors.redAccent,
                  name: 'Outcome',
                  dataSource: controller.chartDataOutcome,
                  enableTooltip: true,
                  xValueMapper: (data, _) => data.date,
                  yValueMapper: (data, _) => data.nominal,
                ),
              ],
            );
          }
          return SfCartesianChart();
        },
      ),
    );
  }
}
