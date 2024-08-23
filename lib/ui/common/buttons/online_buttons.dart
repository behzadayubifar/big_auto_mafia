import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OnlineButton extends HookWidget {
  const OnlineButton({required this.title, required this.onPressed, super.key});

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: AppColors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 32.0,
          horizontal: 32.0,
        ), // Add padding to make the button bigger
      ),
      onPressed: () {
        onPressed?.call();
      },
      child: Text(
        title,
        style: MyTextStyles.headlineSmall.copyWith(
          color: AppColors.green,
        ),
      ),
    );
  }
}
