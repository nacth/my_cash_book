import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_cash_book/app/modules/cash_flow/controllers/cash_flow_controller.dart';

class CashFlowWidget extends StatelessWidget {
  const CashFlowWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CashFlowController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return ListView.separated(
          itemCount: controller.allTransactions.length,
          itemBuilder: (context, index) {
            var transaction = controller.allTransactions[index];
            var nominal = NumberFormat.currency(
              locale: 'id',
              symbol: 'Rp',
              decimalDigits: 0,
            ).format(transaction.nominal);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.type == 'in'
                          ? '[ + ] $nominal'
                          : '[ - ] $nominal',
                      style: TextStyle(
                        color: transaction.type == 'in'
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      transaction.description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      DateFormat('d-M-y').format((transaction.date)),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(
                  transaction.type == 'in'
                      ? Icons.arrow_back
                      : Icons.arrow_forward,
                  color: transaction.type == 'in'
                      ? Colors.greenAccent
                      : Colors.redAccent,
                  size: 48,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 2,
            );
          },
        );
      },
    );
  }
}
