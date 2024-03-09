import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/lotties_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GameOverPage extends StatelessWidget {
  final String winner;

  const GameOverPage({Key? key, required this.winner}) : super(key: key);

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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
