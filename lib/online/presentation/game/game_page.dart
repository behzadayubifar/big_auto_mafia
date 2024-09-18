import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/online/presentation/game/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GamePage extends HookConsumerWidget {
  const GamePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final game = ref.watch(gameControllerProvider);
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: Center(
        child: game.maybeWhen(
          data: (game) {
            return game.match(
              // TODO: handle l case
              (l) {},
              (r) {
                return Container(
                  height: height,
                  width: width,
                  color: AppColors.backGround,
                  child: Center(
                    child: Text(
                      'role : ${r.playerOnline!.role}',
                      style: MyTextStyles.headlineSmall.copyWith(
                        color: AppColors.lightestGrey,
                      ),
                    ),
                  ),
                );
              },
            );
          },
          orElse: () => LoadingAnimationWidget.bouncingBall(
              color: AppColors.secondaries[0], size: 50),
        ),
      ),
    );
  }
}
