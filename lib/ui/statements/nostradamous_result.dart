import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:flutter/material.dart';

class NostradamouResult extends StatelessWidget {
  NostradamouResult({super.key, this.height, this.width});

  final height;
  final width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(MyAssets.pureBgOverlay, scale: 6.4, fit: BoxFit.cover),
        Positioned(
          // top: MediaQuery.sizeOf(context).height /
          // height: MediaQuery.sizeOf(context).height / 3.6,
          // width: MediaQuery.sizeOf(context).width / 1.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TornPaperStatement(
                  text: '2 مافیا', backColor: AppColors.secondaries[2]),
              TornPaperStatement(
                text: '1 شهر',
                backColor: AppColors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// --------------------------------------------------------------------------------------------------------------------------

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

// --------------------------------------------------------------------------------------------------------------------------
