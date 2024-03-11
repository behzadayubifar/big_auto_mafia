import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/load_logics.dart';
import 'package:auto_mafia/lotties_assets.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class HomePage extends ConsumerWidget {
  HomePage({required this.isFinished, super.key});
  // HomePage({super.key});

  // final bool isFinished = true;
  final bool isFinished;
  //
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //

    return Scaffold(
        backgroundColor: AppColors.backGround,
        body: SafeArea(
          child: Stack(
            children: [
              LottieBuilder.asset(
                Lotties.bg,
                height: height,
                // width: width,
                fit: BoxFit.cover,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: height / 64),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Mafia',
                                textStyle: MyTextStyles.displayMedium.copyWith(
                                  color: AppColors.secondaries[2],
                                  fontSize: 64,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                          AnimatedTextKit(
                            // repeatForever: true,
                            // totalRepeatCount: 8,

                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Auto ',
                                textAlign: TextAlign.start,
                                textStyle: MyTextStyles.displayMedium.copyWith(
                                  color: AppColors.primaries[1],
                                  fontSize: 32,
                                  height: 1.5,
                                ),
                              ),

                              /* Text.rich(
                              TextSpan(
                                text: 'Auto ',
                                style: MyTextStyles.displayMedium.copyWith(
                                  color: AppColors.primaries[1],
                                  fontSize: 32,
                                  height: 1.5,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Mafia',
                                    style: MyTextStyles.displayMedium.copyWith(
                                      color: AppColors.secondaries[2],
                                      fontSize: 48,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ), */
                            ],
                          ),
                        ],
                      ),

                      SizedBox(
                        height: height / 24,
                      ),

                      MyButton(
                        title: 'شروع بازی جدید',
                        place: 'home',
                        onLongPress: () {
                          context.go('/name_list');
                        },
                      ),
                      //

                      if (!isFinished)
                        SizedBox(
                          height: 48,
                        ),
                      //
                      if (!isFinished)
                        MyButton(
                          title: 'ادامه بازی قبلی',
                          place: 'home',
                          onLongPress: () async {
                            print('objec   t');
                            ref.read(loadingProvider.notifier).toggle();
                            Future.delayed(Duration(seconds: 1));

                            await loadGame(context);

                            ref.read(loadingProvider.notifier).toggle();
                          },
                        ),
                      SizedBox(
                        height: 48,
                      ),
                      //
                      MyButton(
                        title: 'راهنما',
                        place: 'home',
                        onPressed: () {
                          context.push('/guide');
                        },
                      ),
                      //
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
