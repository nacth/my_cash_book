import 'package:get/get.dart';
import 'package:my_cash_book/app/data/db/transactions_database.dart';
import 'package:my_cash_book/app/data/model/transaction.dart';

class CashFlowController extends GetxController {
  var allTransactions = <TransactionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    readAllTransactions();
  }

  void readAllTransactions() async {
    allTransactions.value =
        await TransactionsDatabase.instance.readAllTransactions();
  }
}
