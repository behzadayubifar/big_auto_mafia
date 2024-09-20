import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/online/presentation/game/game_controller.dart';
import 'package:auto_mafia/online/presentation/situations/situations_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../offline/my_assets.dart';

class GamePage extends HookConsumerWidget {
  const GamePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    //
    final game = ref.watch(gameControllerProvider);
    final situationsCtrl = ref.watch(situationsControllerProvider);
    //
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: situationsCtrl.maybeWhen(
        data: (data) {
          return data.match(
            (l) {
              return Container(
                height: height,
                width: width,
                color: AppColors.backGround,
                child: Center(
                  child: Text(
                    'error : ${l.msg}',
                    style: MyTextStyles.headlineSmall.copyWith(
                      color: AppColors.lightestGrey,
                    ),
                  ),
                ),
              );
            },
            (r) {
              if (r.situation == null) {
                return Container(
                  height: height,
                  width: width,
                  color: AppColors.backGround,
                  child: Center(
                    child: Text(
                      'no situation',
                      style: MyTextStyles.headlineSmall.copyWith(
                        color: AppColors.lightestGrey,
                      ),
                    ),
                  ),
                );
              }
              return Stack(
                children: [
                  // background
                  Image.asset(
                    MyAssets.dayBg,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                  // day number
                  Positioned(
                    child: Text.rich(
                      TextSpan(
                        text: 'روز',
                        style: MyTextStyles.bodyMD,
                        children: [
                          TextSpan(
                            text: ' ${r.situation!.dayNumber}',
                            style: MyTextStyles.displayMedium,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    top: height / 3.6,
                    right: width / 2.5,
                  ),

                  //
                ],
              );
            },
          );
        },
        orElse: () => Center(
          child: LoadingAnimationWidget.bouncingBall(
            color: AppColors.secondaries[0],
            size: width / 4,
          ),
        ),
      ),
      // Center(
      //   child: game.maybeWhen(
      //     data: (game) {
      //       return game.match(
      //         // TODO: handle l case
      //         (l) {},
      //         (r) {
      //           // if (r.playerOnline == null) {}
      //           return Container(
      //             height: height,
      //             width: width,
      //             color: AppColors.backGround,
      //             child: Center(
      //               child: Text(
      //                 'role : ${r.playerOnline!.role}',
      //                 style: MyTextStyles.headlineSmall.copyWith(
      //                   color: AppColors.lightestGrey,
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       );
      //     },
      //     orElse: () => LoadingAnimationWidget.bouncingBall(
      //       color: AppColors.secondaries[0],
      //       size: width / 4,
      //     ),
      //   ),
      // ),
    );
  }
}
