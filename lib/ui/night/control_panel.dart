import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/common/timers/night_timer.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({
    super.key,
    required double width,
    required double height,
    required this.finisher,
    this.timerController,
  })  : _width = width,
        _height = height;

  final double _width;
  final double _height;
  final Future<Null> Function() finisher;
  final CountDownController? timerController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NightTimer(
          width: _width / 4.8,
          height: _height / 4.8,
          onComplete: finisher,
          timerController: timerController,
        ),
        SizedBox(width: _width / 8),
        MyButton(
          title: MyStrings.finish,
          onLongPress: finisher,
        ),
      ],
    );
  }
}
