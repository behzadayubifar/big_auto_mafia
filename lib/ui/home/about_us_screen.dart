import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/lotties_assets.dart';
import 'package:auto_mafia/ui/common/buttons/floating_action_button.dart';
import 'package:auto_mafia/utils/about_utils.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    child:
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(
        context: context,
        name: 'back',
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: AppColors.backGround,
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(
            top: height / 8,
            right: width / 16,
            left: width / 16,
          ),
          children: [
            AnimatedTextKit(animatedTexts: [
              TyperAnimatedText(
                'درباره ما',
                textStyle: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaries[0],
                ),
              ),
            ]),
            SizedBox(
              height: height / 16,
            ),
            Text(
              'این برنامه توسط گروه برنامه نویسی اتومافیا توسعه یافته است.',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.white,
                height: 1.5,
              ),
            ),
            // please comment and rate us on myket
            SizedBox(
              height: height / 24,
            ),
            TextButton(
              onPressed: rateInMyket,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.tintsOfBlack[2],
                      AppColors.tintsOfBlack[3],
                    ],
                  ),
                ),
                child: Text(
                  'امتیاز و نظر برای برنامه',
                  style: MyTextStyles.bodyLarge.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 24,
            ),
            LottieBuilder.asset(
              Lotties.aboutUs,
              // height: height,
              width: width,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
