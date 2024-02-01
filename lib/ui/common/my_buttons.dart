import 'package:auto_mafia/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.onLongPress,
    required this.title,
    this.fontSize,
    this.textStyle,
  });

  final void Function()? onLongPress;
  final String title;
  final double? fontSize;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: AppColors.lightText,
          elevation: 9,
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          minimumSize: const Size(64, 48),
        ),
        child: Text(
          title,
          style: textStyle ??
              Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                    fontSize: fontSize,
                  ),
        ),
        onLongPress: onLongPress,
        onPressed: () {},
      ),
    );
  }
}
