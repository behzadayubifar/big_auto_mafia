import 'package:flutter/material.dart';

import '../../../../offline/constants/app_colors.dart';
import '../../../../offline/constants/my_text_styles.dart';

class MyListTile extends StatelessWidget {
  const MyListTile(
      {required this.height,
      required this.width,
      required this.index,
      required this.title,
      required this.leading,
      this.onTap,
      super.key});

  final double height;
  final double width;
  final int index;
  final String title;
  final String leading;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaries[2],
              AppColors.primaries[3],
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: width / 32,
          vertical: height / 64,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: MyTextStyles.bodyLarge.copyWith(
                color: AppColors.lightestGrey,
              ),
            ),
            Text(
              leading,
              style: MyTextStyles.bodyMD.copyWith(
                color: AppColors.lighterGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
