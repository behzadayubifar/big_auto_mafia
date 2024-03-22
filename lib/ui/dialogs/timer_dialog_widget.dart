import 'package:auto_mafia/audio/audio_assets.dart';
import 'package:auto_mafia/audio/audio_service.dart';
import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:auto_mafia/ui/common/timers/night_timer.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// now manage overlay entry to show the overlay

final timerOverlay = OverlayEntry(
  builder: (context) {
    return Material(
      color: AppColors.black20,
      elevation: 16,
      shadowColor: AppColors.black50,
      child: TimerDialog(),
    );
  },
);

class TimerDialog extends HookConsumerWidget {
  TimerDialog({
    Key? key,
    /* required this.timerController */
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //
    final timerController = useState(CountDownController());
    final rightButtonTitle = useState('شروع');
    //
    final duration = useState(45);
    final stateOfTimer = useState('not started');
    //
    final controller =
        useTextEditingController(text: duration.value.toString());
    //

    return Center(
      child: Stack(
        children: [
          Container(
            height: height / 2.4,
            width: width / 1.3,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.black50,
                  blurRadius: 16,
                  spreadRadius: 8,
                  offset: Offset(0, 8),
                ),
              ],
              border: Border.all(
                color: AppColors.grey,
                width: 2,
              ),
              gradient: LinearGradient(
                colors: [
                  AppColors.grey,
                  AppColors.darkerGrey,
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 48, 16.0, 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'مشورت ',
                            style: MyTextStyles.headlineSmall.copyWith(
                              color: AppColors.white,
                              fontSize: 32,
                            ),
                            children: [
                              TextSpan(
                                text: 'مافیا',
                                style: MyTextStyles.headlineSmall.copyWith(
                                  color: AppColors.secondaries[2],
                                  fontSize: 32,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height / 64),
                        // timer
                        // add a functionality to change the duration of the timer
                        // when the user press the timer
                        // and this is done by using another overlay entry
                        GestureDetector(
                          onTap: () {
                            if (stateOfTimer.value == 'not started')
                              stateOfTimer.value = 'editing';
                          },
                          child: (stateOfTimer.value == 'editing')
                              ? Column(
                                  children: [
                                    TextFormField(
                                      controller: controller,
                                      keyboardType: TextInputType.number,
                                      style:
                                          MyTextStyles.headlineSmall.copyWith(
                                        color: AppColors.white,
                                        height: 1.2,
                                        fontSize: 24,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'زمان',
                                        labelStyle:
                                            MyTextStyles.headlineSmall.copyWith(
                                          color: AppColors.white,
                                          fontSize: 24,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.white,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      // onChanged: (value) {
                                      //   // value must not be smaller than 12
                                      //   if (int.parse(value) < 12) {
                                      //     controller.text = '12';
                                      //     return;
                                      //   }
                                      // },
                                      onFieldSubmitted: (value) {
                                        if (int.parse(value) < 12) {
                                          controller.text = '12';
                                          return;
                                        }
                                        duration.value = int.parse(value);
                                        stateOfTimer.value = 'not started';
                                      },
                                    ),
                                    SizedBox(height: height / 64),
                                    MyButton(
                                      title: 'تایید',
                                      onPressed: () {
                                        stateOfTimer.value = 'not started';
                                        if (int.parse(controller.text) < 12) {
                                          controller.text = '12';
                                          return;
                                        }
                                        duration.value =
                                            int.parse(controller.text);
                                      },
                                    ),
                                  ],
                                )
                              : NightTimer(
                                  width: width / 4,
                                  height: height / 4.2,
                                  timerController: timerController.value,
                                  duration: duration.value,
                                  onComplete: () async {
                                    await playSound(AppAudios.finishAlarm);
                                    rightButtonTitle.value = 'تموم';
                                    await Future.delayed(Duration(seconds: 8),
                                        () async {
                                      await stopSound();
                                    });
                                    // remove the overlay
                                    timerOverlay.remove();
                                  },
                                ),
                        ),
                        // SizedBox(height: height / 42),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (rightButtonTitle.value != 'تموم')
                        MyButton(
                            title: rightButtonTitle.value,
                            onPressed: () async {
                              if (timerController.value.isPaused) {
                                print('is paused');
                                timerController.value.resume();
                                rightButtonTitle.value = 'وایسا';
                                await playSound(AppAudios.kitchenTimer);
                                return;
                              } else if (timerController.value.isStarted) {
                                print(timerController.value.getTime());
                                timerController.value.pause();
                                rightButtonTitle.value = 'ادامه';
                                await pauseSound();
                                return;
                              } else if ((timerController.value.getTime()) ==
                                      '00' &&
                                  timerController.value.isStarted) {
                                print('00');
                              } else {
                                print('is not started');
                                timerController.value.start();
                                rightButtonTitle.value = 'وایسا';
                                await playSound(AppAudios.tickingStopwatch);
                                await Future.delayed(
                                  Duration(seconds: 4),
                                  () async {
                                    if (rightButtonTitle.value != 'ادامه' &&
                                        context.mounted)
                                      await playSound(AppAudios.kitchenTimer);
                                  },
                                );
                                return;
                              }
                            }),
                      if (rightButtonTitle.value != 'تموم')
                        MyButton(
                            title: 'تموم',
                            onPressed: () async {
                              timerController.value.pause();
                              await stopSound();
                              timerOverlay.remove();
                              ref.read(loadingProvider.notifier).end();
                            }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: width / 5,
            child: Transform(
              transform: Matrix4.identity()..rotateZ(3.14 / 1.5),
              // ..translate(-width / 2, -height / 4),
              child: Stack(
                children: [
                  Image.asset(
                    MyAssets.mask,
                    color: AppColors.secondaries[4],
                    colorBlendMode: BlendMode.srcIn,
                    scale: 3.3,
                  ),
                  Image.asset(
                    MyAssets.mask,
                    scale: 3.3,
                    opacity: AlwaysStoppedAnimation(0.56),
                  ),
                ],
              ),
            ),
          ) /* .animate(
            autoPlay: true,
            effects: [
              RotateEffect(
                alignment: Alignment.topLeft,
                duration: Duration(seconds: 8),
                curve: Curves.decelerate,
                delay: Duration(milliseconds: 500),
                begin: 0,
                end: 3.14 / 2,
              ),
            ],
          ), */
        ],
        clipBehavior: Clip.none,
      ),
    );
  }
}
