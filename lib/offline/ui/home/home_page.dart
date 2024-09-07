import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/offline/logic/load_logics.dart';
import 'package:auto_mafia/offline/lotties_assets.dart';
import 'package:auto_mafia/offline/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/offline/ui/common/loading.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulHookConsumerWidget {
  HomePage({required this.isFinished, super.key});
  // HomePage({super.key});

  // final bool isFinished = true;
  final bool? isFinished;
  //
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.NO_HEADER,
        animType: AnimType.BOTTOMSLIDE,
        dismissOnTouchOutside: false,
        dismissOnBackKeyPress: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: context.size!.height / 3.2,
              width: context.size!.width / 1.2,
              child: ListView(
                padding: EdgeInsets.all(8),
                children: [
                  Text('تذکر مهم در مورد دکمه ها',
                      style: MyTextStyles.bodyLarge.copyWith(
                        color: AppColors.secondaries[1],
                        height: 1.5,
                      )),
                  SizedBox(
                    height: context.size!.height / 48,
                  ),
                  Text(
                    'اکثر مواقع برای اجرا شدن دکمه ها نیاز به نگه داشتن آنها برای 2 ثانیه دارید تا از اشتباهی اجرا شدن عملیات ها بر اثر تصادف جلوگیری شود برای اطلاعات بیشتر حتما به راهنما یه سری بزنید لطفا (:)',
                    style: MyTextStyles.bodyMD.copyWith(
                      color: AppColors.primaries[3],
                      height: 1.5,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(
                    height: context.size!.height / 32,
                  ),
                ],
              ),
            ),
            AnimatedButton(
              color: AppColors.primaries[1],
              width: 120,
              buttonTextStyle: MyTextStyles.bodyLarge.copyWith(
                color: AppColors.white,
              ),
              text: 'فهمیدم',
              pressEvent: () async {
                // final isUpdateAvailable = await checkForUpdate();
                // print(isUpdateAvailable);
                // if (isUpdateAvailable != null) {
                //   Navigator.of(context).pop();
                //   checkUpdateDialog(context);
                //   return;
                // }
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              height: context.size!.height / 64,
            ),
          ],
        ),
      ).show();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.only(top: height / 64, right: width / 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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

                      if (widget.isFinished == null ||
                          widget.isFinished != true)
                        SizedBox(
                          height: 48,
                        ),
                      //
                      if (widget.isFinished == null ||
                          widget.isFinished != true)
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
                      SizedBox(
                        height: 48,
                      ),
                      //
                      MyButton(
                        title: 'درباره ما',
                        place: 'home',
                        onPressed: () {
                          context.push('/about');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
