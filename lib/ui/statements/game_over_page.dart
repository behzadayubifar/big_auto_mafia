import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/lotties_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class GameOverPage extends StatelessWidget {
  const GameOverPage({
    Key? key,
    required this.winner,
    required this.players,
  }) : super(key: key);

  final String winner;
  final List<Player> players;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
//
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        centerTitle: true,
        title: Text('اتمام بازی'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            LottieBuilder.asset(
              Lotties.celebrate,
              height: height / 1.5,
              width: width,
              fit: BoxFit.cover,
            ),
            SizedBox(
              // width: width / 1.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    winner,
                    style: MyTextStyles.displayLarge.copyWith(
                      color: AppColors.white,
                      height: 1.5,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: height / 16,
                  ),
                  Text(
                    "برنده شدند!",
                    style: MyTextStyles.bodyLarge.copyWith(
                      color: AppColors.white60,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: height / 12,
                  ),
                  // a 2 column table of players and their roles
                  Container(
                    height: height / 3,
                    width: width / 1.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.black20,
                          AppColors.black,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListView.separated(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.fromLTRB(4, 24, 4, 16),
                      separatorBuilder: (context, index) => Divider(
                        color: AppColors.grey,
                        height: 16,
                      ),
                      itemCount: players.length,
                      itemBuilder: (context, index) {
                        final player = players.elementAt(index);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              player.playerName!,
                              style: MyTextStyles.bodyLarge.copyWith(
                                color: AppColors.white,
                                height: 1.5,
                              ),
                            ),
                            Text(
                              '<=' * 3,
                              style: MyTextStyles.bodyMedium.copyWith(
                                color: AppColors.white60,
                                height: 1.5,
                              ),
                            ),
                            Text(
                              player.roleName!,
                              style: MyTextStyles.bodyLarge.copyWith(
                                color: AppColors.white,
                                height: 1.5,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
