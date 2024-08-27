import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void showConfirmDialog({
  required BuildContext context,
  required String title,
  required String desc,
  required Function onConfirm,
  required Function onCancel,
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    animType: AnimType.BOTTOMSLIDE,
    title: title,
    desc: desc,
    btnCancelOnPress: onCancel,
    btnCancelText: 'انصراف',
    btnOkOnPress: onConfirm,
    btnOkText: 'تایید',
  )..show();
}
