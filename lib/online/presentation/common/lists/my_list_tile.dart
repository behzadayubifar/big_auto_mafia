import 'package:flutter/material.dart';

import '../../../../offline/constants/app_colors.dart';
import '../../../../offline/constants/my_text_styles.dart';

class MyListTile extends StatelessWidget {
  MyListTile({
    required this.height,
    required this.width,
    required this.index,
    required this.title,
    this.gradient,
    this.leading,
    this.onTap,
    this.boxShadow,
    super.key,
  });

  final double height;
  final double width;
  final int index;
  final String title;
  final String? leading;
  final Function? onTap;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            boxShadow: boxShadow ??
                [
                  BoxShadow(
                    color: AppColors.primaries[3],
                    blurRadius: 4,
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 2,
                  ),
                ],
            gradient: gradient ??
                LinearGradient(
                  colors: [
                    AppColors.primaries[2],
                    AppColors.primaries[3],
                  ],
                ),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: width / 24,
            // vertical: height / 64,
          ),
          child: Row(
            mainAxisAlignment: leading != null
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: MyTextStyles.bodyLarge.copyWith(
                  color: AppColors.lightestGrey,
                ),
              ),
              if (leading != null)
                Text(
                  leading!,
                  style: MyTextStyles.bodyMD.copyWith(
                    color: AppColors.lighterGrey,
                  ),
                ),
            ],
          ),
        ),
        Material(
          color: Colors.transparent, // To keep the background transparent
          child: InkWell(
            splashColor: AppColors.greens[0],
            onTap: () {
              onTap?.call();
            },
            borderRadius: BorderRadius.circular(16), // Match the border radius
            child: Container(
              height: height,
              width:
                  double.infinity, // Ensure the InkWell covers the entire area
            ),
          ),
        ),
      ],
    );
  }
}
