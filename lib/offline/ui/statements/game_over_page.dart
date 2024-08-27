import 'dart:io';

import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/offline/db/entities/player.dart';
import 'package:auto_mafia/offline/lotties_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:go_router/go_router.dart';

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
        backgroundColor:
            winner == 'شهروندان' ? AppColors.green : AppColors.secondary,
        centerTitle: true,
        title: Text('اتمام بازی'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            LottieBuilder.asset(
              Lotties.celebrate,
              height: height / 1.24,
              width: width,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: height,
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
                    height: height / 24,
                  ),
                  Text(
                    "برنده شدند!",
                    style: MyTextStyles.bodyLarge.copyWith(
                      color: AppColors.white60,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: height / 24,
                  ),
                  // a 2 column table of players and their roles
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                    height: height / 2,
                    width: width / 1.2,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black50,
                          blurRadius: 16,
                          spreadRadius: 8,
                          offset: const Offset(0, 8),
                        ),
                      ],
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
                            // Text(
                            //   // '${FontAwesomeIcons.solidFaceSmile}',
                            //   '>',
                            //   style: MyTextStyles.bodyMedium.copyWith(
                            //     color: AppColors.white60,
                            //     height: 1.5,
                            //   ),
                            // ),
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

                  // buttons to restart and exit

                  SizedBox(
                    height: height / 24,
                  ),
                  // for exit
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // for restart
                      ElevatedButton(
                        onPressed: () => context.go('/name_list'),
                        child: Text(
                          'شروع مجدد',
                          style: MyTextStyles.bodyLarge.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shadowColor: AppColors.lightText,
                          elevation: 9,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                          backgroundColor: AppColors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          minimumSize: const Size(48, 48),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => exit(0),
                        child: Text(
                          'خروج',
                          style: MyTextStyles.bodyLarge.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shadowColor: AppColors.lightText,
                          elevation: 9,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                          backgroundColor: AppColors.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          minimumSize: const Size(48, 48),
                        ),
                      ),
                    ],
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
