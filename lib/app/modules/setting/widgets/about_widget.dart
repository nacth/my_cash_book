import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cash_book/app/widgets/text_custom.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/abdurrasyid_muhasibi.jpeg',
            height: Get.width * 0.3,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 8),
          SizedBox(
            height: Get.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TextCustom(
                  text: 'About this App..',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                TextCustom(text: 'Aplikasi ini dibuat oleh:'),
                TextCustom(text: 'Nama: Abdurrasyid Muhasibi'),
                TextCustom(text: 'NIM: 1841720213'),
                TextCustom(text: 'Tanggal: 01 Agustus 2022'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
