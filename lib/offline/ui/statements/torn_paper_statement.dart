import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/offline/my_assets.dart';
import 'package:flutter/material.dart';

class TornPaperStatement extends StatelessWidget {
  TornPaperStatement({
    super.key,
    required this.text,
    required this.backColor,
  });

  final String text;
  final Color backColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.sizeOf(context).height / 6.4,
      width: MediaQuery.sizeOf(context).width / 4.8,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            backColor,
            BlendMode.srcATop,
          ),
          scale: 1,
          image: AssetImage(
            MyAssets.tornPaper,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: MyTextStyles.bodyMD.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
