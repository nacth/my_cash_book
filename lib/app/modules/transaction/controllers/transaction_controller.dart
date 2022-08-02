import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:my_cash_book/app/data/db/transactions_database.dart';
import 'package:my_cash_book/app/data/model/transaction.dart';
import 'package:my_cash_book/app/data/model/user.dart';
import 'package:my_cash_book/app/routes/app_pages.dart';

class TransactionController extends GetxController {
  final String type = Get.arguments.toString();

  late TextEditingController dateController;
  late TextEditingController nominalController;
  late TextEditingController descriptionController;

  final box = GetStorage();

  DateTime? dateTime;

  @override
  void onInit() {
    super.onInit();
    dateController = TextEditingController();
    nominalController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void onClose() {
    dateController.dispose();
    nominalController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void setDateTime(DateTime? date) {
    dateTime = date;
    dateController.text = DateFormat('d/M/y').format((date ?? DateTime.now()));
  }

  void create() async {
    var user = await box.read('user') as UserModel;
    var idUser = user.idUser;

    var date = DateTime.now();

    await TransactionsDatabase.instance.create(
      TransactionModel(
        idUser: idUser,
        type: type,
        date: dateTime ?? DateTime.now(),
        nominal: int.parse(
          nominalController.text.substring(2).replaceAll('.', ''),
        ),
        description: descriptionController.text,
        createdAt: date,
        updatedAt: date,
        deletedAt: date,
      ),
    );

    Get.snackbar('Transaction', 'Transaction added successfully');
    Get.offAllNamed(Routes.HOME);
  }
}
