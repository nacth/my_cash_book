import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_cash_book/app/data/db/transactions_database.dart';
import 'package:my_cash_book/app/data/model/chart_data.dart';

class HomeController extends GetxController {
  var income = 0;
  var outcome = 0;

  var incomeText = ''.obs;
  var outcomeText = ''.obs;

  var chartDataIncome = <ChartData>[].obs;
  var chartDataOutcome = <ChartData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getSummaryMonth();
    getChartData();
  }

  void getSummaryMonth() async {
    await TransactionsDatabase.instance.getSummaryMonth('in').then((value) {
      var nominal = value?['nominal'];
      if (nominal != null) {
        income = nominal as int;
      }
    });
    await TransactionsDatabase.instance.getSummaryMonth('out').then((value) {
      var nominal = value?['nominal'];
      if (nominal != null) {
        outcome = nominal as int;
      }
    });

    incomeText.value = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: 0,
    ).format(income);
    outcomeText.value = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: 0,
    ).format(outcome);
  }

  // void initChartData() {
  //   for (int i = 1; i <= 31; i++) {
  //     chartDataIncome.add(ChartData(date: i, nominal: 0));
  //     chartDataOutcome.add(ChartData(date: i, nominal: 0));
  //   }
  // }

  void getChartData() async {
    var income = await TransactionsDatabase.instance.getChartData('in');
    var dataIncome = income?.map((data) => ChartData.fromJson(data)).toList();

    if (dataIncome != null) {
      chartDataIncome.value = dataIncome;
    }

    var outcome = await TransactionsDatabase.instance.getChartData('out');
    var dataOutcome = outcome?.map((data) => ChartData.fromJson(data)).toList();

    if (dataOutcome != null) {
      chartDataOutcome.value = dataOutcome;
    }
  }
}
