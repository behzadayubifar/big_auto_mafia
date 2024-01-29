import 'package:auto_mafia/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, this.onLongPress, required this.title});

  final void Function()? onLongPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      onLongPress: onLongPress,
      onPressed: () {},
    );
  }
}
