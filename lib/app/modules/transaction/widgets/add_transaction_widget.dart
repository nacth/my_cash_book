import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:my_cash_book/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:my_cash_book/app/widgets/text_custom.dart';

class AddTransactionWidget extends StatelessWidget {
  const AddTransactionWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TransactionController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextCustom(
          text: 'Tanggal',
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.dateController,
                readOnly: true,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 5),
                  lastDate: DateTime(DateTime.now().year + 5),
                  selectableDayPredicate: (day) {
                    if (day.isBefore(DateTime.now())) return true;
                    return false;
                  },
                ).then((date) => controller.setDateTime(date));
              },
              icon: const Icon(
                Icons.date_range_rounded,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const TextCustom(
          text: 'Nominal:',
          fontWeight: FontWeight.bold,
        ),
        TextField(
          controller: controller.nominalController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: (value) {
            if (value.isNotEmpty) {
              value = NumberFormat.currency(
                locale: 'id',
                symbol: 'Rp',
                decimalDigits: 0,
              ).format(int.parse(value));
              controller.nominalController.value = TextEditingValue(
                text: value,
                selection: TextSelection.collapsed(offset: value.length),
              );
            }
          },
        ),
        const SizedBox(height: 8),
        const TextCustom(
          text: 'Keterangan',
          fontWeight: FontWeight.bold,
        ),
        TextField(
          controller: controller.descriptionController,
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
