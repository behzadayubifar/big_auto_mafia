import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class NightTimer extends StatelessWidget {
  const NightTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final height = size.height;
    final width = size.width;
    // later remove scaffold
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: Center(
        child: CircularCountDownTimer(
          width: width / 4,
          height: height / 4,
          // later must read this from db (the user can change it)
          duration: 10,
          fillColor: AppColors.primaries[1],
          ringColor: AppColors.primaries[4],
          backgroundColor: AppColors.primaries[3],
          textFormat: CountdownTextFormat.SS,
          textStyle:
              MyTextStyles.bodyLarge.copyWith(color: AppColors.lighterGrey),
          isReverse: true,
        ),
      ),
    );
  }
}
