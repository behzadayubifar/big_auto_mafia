import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/common/title_widget.dart';
import 'package:auto_mafia/ui/statements/result_row_widget.dart';
import 'package:flutter/material.dart';

class NightsResuls extends StatelessWidget {
  const NightsResuls({
    super.key,
    required this.tonight,
    this.slaughtered,
    this.bornPlayer,
    this.disclosured,
    this.tonightDeads,
    this.nightCode,
    this.allDeadPlayers,
  });

  final String tonight;
  //
  final String? slaughtered;
  final String? bornPlayer;
  final String? disclosured;
  final List<String>? tonightDeads;
  //
  final int? nightCode;
  //
  final List<String>? allDeadPlayers;
  //

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TiTleTile(title: MyStrings.nightResults + ' ' + tonight),
            SizedBox(height: height / 24),
            Expanded(
              child: ListView(
                children: [
                  if (bornPlayer != null)
                    ResultRow(
                        width: width,
                        names: [bornPlayer!],
                        topic: MyStrings.bornPlayer),
                  SizedBox(height: height / 24),
                  if (disclosured != null) SizedBox(height: height / 24),
                  ResultRow(
                      width: width,
                      names: [disclosured!],
                      topic: MyStrings.disclosured),
                  SizedBox(height: height / 24),
                  if (slaughtered != null)
                    ResultRow(
                        width: width,
                        names: [slaughtered!],
                        topic: MyStrings.slaughtered),
                  SizedBox(height: height / 24),
                  if (tonightDeads != null)
                    ResultRow(
                      width: width,
                      names: tonightDeads!,
                      topic: MyStrings.deads,
                    ),
                  SizedBox(height: height / 24),
                  // show night code
                  if (nightCode != null)
                    Text(
                      MyStrings.nightCode + nightCode.toString(),
                      style: MyTextStyles.bodyMD.copyWith(
                        color: AppColors.darkText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  // show all the Deads
                  if (allDeadPlayers != null)
                    Text.rich(
                      TextSpan(
                        text: MyStrings.allDeads + ': ',
                        style: MyTextStyles.bodyLarge.copyWith(
                          color: AppColors.darkText,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          for (String dead in allDeadPlayers!)
                            TextSpan(
                              text: dead + ', ',
                              style: MyTextStyles.bodyMD.copyWith(
                                color: AppColors.darkText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            // TODO:
            MyButton(title: MyStrings.enquiry, onLongPress: () {}),
            SizedBox(height: height / 24),
            MyButton(title: MyStrings.next, onLongPress: () {}),
          ],
        ),
      ),
    );
  }
}
