import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cash_book/app/modules/home/widgets/menu_button_custom.dart';
import 'package:my_cash_book/app/routes/app_pages.dart';

class CashMenuWidget extends StatelessWidget {
  const CashMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            MenuButtonCustom(
              icon: Icons.upload_rounded,
              text: 'Tambah Pemasukan',
              onTap: () {
                Get.toNamed(
                  Routes.TRANSACTION,
                  arguments: 'in',
                );
              },
            ),
            const SizedBox(width: 8),
            MenuButtonCustom(
              icon: Icons.download_rounded,
              text: 'Tambah Pengeluaran',
              onTap: () {
                Get.toNamed(
                  Routes.TRANSACTION,
                  arguments: 'out',
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            MenuButtonCustom(
              icon: Icons.list_alt_rounded,
              text: 'Detail Cash Flow',
              onTap: () {
                Get.toNamed(Routes.CASH_FLOW);
              },
            ),
            const SizedBox(width: 8),
            MenuButtonCustom(
              icon: Icons.settings,
              text: 'Pengaturan',
              onTap: () {
                Get.toNamed(Routes.SETTING);
              },
            ),
          ],
        ),
      ],
    );
  }
}
