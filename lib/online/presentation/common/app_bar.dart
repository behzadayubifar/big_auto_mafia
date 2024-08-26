import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/my_text_styles.dart';

class MyAppBar extends ConsumerWidget {
  const MyAppBar({
    required this.height,
    required this.width,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required this.title,
    this.leftIcon,
    this.leftIconFunc,
    this.rightIcon,
    this.righttIconFunc,
    super.key,
  }) : _scaffoldKey = scaffoldKey;

  final double height;
  final double width;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final String title;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final void Function()? leftIconFunc;
  final void Function()? righttIconFunc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: height / 32, horizontal: width / 16),
      decoration: BoxDecoration(
        color: AppColors.primaries[4],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaries[3],
            blurRadius: 16,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              rightIcon ?? FontAwesomeIcons.bars,
              color: AppColors.lightestGrey,
              size: 32,
            ),
            onPressed: righttIconFunc ??
                () {
                  _scaffoldKey.currentState?.openDrawer();
                },
          ),
          Text(
            title,
            style: MyTextStyles.headlineSmall.copyWith(
              color: AppColors.lightestGrey,
              height: 1.5,
            ),
          ),
          IconButton(
            icon: Icon(
              leftIcon ?? FontAwesomeIcons.userGear,
              color: AppColors.lightestGrey,
              size: 32,
            ),
            onPressed: leftIconFunc ?? () {},
          ),
        ],
      ),
    );
  }
}
