import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/online/presentation/common/online_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Panel extends HookWidget {
  const Panel({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: SafeArea(
        minimum: EdgeInsets.fromLTRB(0, height / 12, 0, 64),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // profile
                  Text(
                    "بهزاد ایوبی فر",
                    style: MyTextStyles.bodyLarge.copyWith(
                      color: AppColors.lightestGrey,
                      height: 1.5,
                    ),
                  ),
                  // coin
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "100",
                        style: MyTextStyles.bodyLarge.copyWith(
                          color: AppColors.lightestGrey,
                        ),
                      ),
                      SizedBox(width: width / 32),
                      Icon(
                        FontAwesomeIcons.coins,
                        color: Colors.yellow,
                        size: 48,
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              OnlineButton(title: "ایجاد روم", onPressed: null),
              SizedBox(height: 48.0),
              OnlineButton(title: "پیوستن به روم", onPressed: null),
              SizedBox(height: height / 4),
            ],
          ),
        ),
      ),
    );
  }
}
