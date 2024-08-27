import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/offline/models/guide_datasets.dart';
import 'package:auto_mafia/offline/ui/common/buttons/floating_action_button.dart';
import 'package:auto_mafia/offline/ui/common/title_widget.dart';
import 'package:auto_mafia/offline/ui/guide/guide_utils.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // back button
      floatingActionButton: buildFloatingActionButton(
        context: context,
        name: 'back',
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: AppColors.backGround,
      body: SafeArea(
        child: Column(
          children: [
            TiTleTile(title: 'راهنما'),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: height * 0.8,
              width: width * .95,
              child: ListView(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(4, 24, 4, 16),
                children: [
                  for (final q in guideDatasets)
                    Column(
                      children: [
                        ExpandablePanel(
                            header: Container(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  q.question,
                                  style: MyTextStyles.bodyLarge.copyWith(
                                    color: AppColors.white,
                                    height: 1.5,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  // color: AppColors.black20,
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: gradientBasedOnTag(q.tag),
                                )),
                            collapsed: Container(),
                            expanded: Container(
                              child: Text(
                                q.answer,
                                style: MyTextStyles.bodyMedium.copyWith(
                                  color: AppColors.white,
                                  height: 1.5,
                                ),
                              ),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                // color: AppColors.black20,
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.black20..withAlpha(40),
                              ),
                            ),
                            theme: const ExpandableThemeData(
                              alignment: Alignment.center,
                              iconColor: AppColors.white,
                              iconSize: 32,
                              iconPadding: EdgeInsets.only(right: 4),
                              tapHeaderToExpand: true,
                              tapBodyToCollapse: true,
                              hasIcon: true,
                              iconPlacement: ExpandablePanelIconPlacement.left,
                              bodyAlignment:
                                  ExpandablePanelBodyAlignment.center,
                              useInkWell: true,
                            )),
                        SizedBox(
                          height: height * .03,
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
