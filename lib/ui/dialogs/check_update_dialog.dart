import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void checkUpdateDialog(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    animType: AnimType.BOTTOMSLIDE,
    // title: 'به‌روزرسانی',
    // desc: 'نسخه جدیدی از بازی موجود است. لطفا برنامه را به‌روز کنید.',
    body: Column(
      children: [
        SizedBox(height: 32),
        Text('به‌روزرسانی',
            style: MyTextStyles.headlineSmall.copyWith(
              height: 1,
            )),
        SizedBox(height: 40),
        Text(
          'نسخه جدیدی از بازی موجود است. لطفا برنامه را به‌روز کنید.',
          // overflow: TextOverflow.ellipsis
          // maxLines: 5,
          style: MyTextStyles.bodyLarge.copyWith(height: 1.5),
        ),
      ],
    ),
  ).show();
}
