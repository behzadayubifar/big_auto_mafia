import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NightTimer extends HookWidget {
  NightTimer({
    super.key,
    required this.width,
    required this.height,
    this.onComplete,
    this.timerController,
  });

  final double width;
  final double height;
  final void Function()? onComplete;
  final CountDownController? timerController;

  @override
  Widget build(BuildContext context) {
    Color ringColor = AppColors.darkText;
    Color backgroundColor = AppColors.primaries[4];
    var fillCollor = useState(AppColors.lighterGrey);
    return Center(
      child: CircularCountDownTimer(
        controller: timerController,
        width: width,
        height: height,
        // later must read this from db (the user can change it)
        duration: 3000,
        onChange: (remained) {
          // print(double.tryParse(remained));
          // print(remained);
          if (double.tryParse(remained)! < 10)
            fillCollor.value = AppColors.secondaries[3];
        },
        onComplete: onComplete,
        backgroundColor: backgroundColor,
        fillColor: fillCollor.value,
        ringColor: ringColor,
        textFormat: CountdownTextFormat.SS,
        textStyle:
            MyTextStyles.bodyLarge.copyWith(color: AppColors.lighterGrey),
        isReverse: true,
        isReverseAnimation: true,
        // controller: ,
      ),
    );
  }
}
