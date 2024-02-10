import 'package:flutter/material.dart';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/ui/statements/torn_paper_statement.dart';

class EnquiryResultsWidget extends StatelessWidget {
  EnquiryResultsWidget({
    super.key,
    this.height,
    this.width,
    this.mafia,
    this.citizen,
    this.independent,
  });

  final height;
  final width;
//
  final int? mafia;
  final int? citizen;
  final int? independent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset(MyAssets.pureBgOverlay, scale: 6.4, fit: BoxFit.cover),
        Positioned(
          // top: MediaQuery.sizeOf(context).height /
          // height: MediaQuery.sizeOf(context).height / 3.6,
          // width: MediaQuery.sizeOf(context).width / 1.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (mafia != 0)
                TornPaperStatement(
                    text: '$mafia مافیا', backColor: AppColors.secondaries[2]),
              if (citizen != 0)
                TornPaperStatement(
                  text: '$citizen شهر',
                  backColor: AppColors.green,
                ),
              if (independent != 0)
                TornPaperStatement(
                  text: '$independent مستقل',
                  backColor: AppColors.secondaries[3],
                ),
            ],
          ),
        ),
      ],
    );
  }
}

// --------------------------------------------------------------------------------------------------------------------------

// --------------------------------------------------------------------------------------------------------------------------
