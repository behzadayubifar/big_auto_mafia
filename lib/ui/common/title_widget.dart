import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TiTleTile extends StatelessWidget {
  TiTleTile({
    required this.title,
    this.width,
    this.textStyle,
  });

  final String title;
  final double? width;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Center(
          child: Opacity(
            opacity: 0.9,
            child: SvgPicture.asset(
              MyAssets.titleBg,
              height: width != null ? null : 100,
              width: width,
              alignment: Alignment.center,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: 1.0,
              duration: Duration(milliseconds: 500),
              child: Text(
                title,
                textAlign: TextAlign.center,
                textHeightBehavior: const TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                ),
                style: textStyle ??
                    Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: AppColors.white,
                        ),
              ),
            ),
            // SizedBox(height: 16),
          ],
        ),
      ],
    );
  }
}
