import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/online/presentation/rooms/controllers/rooms_controller.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../offline/constants/app_colors.dart';
import '../../../../offline/models/role_datasets.dart';
import '../buttons/online_buttons.dart';
import '../checkboxes/roles_selection_checkbox.dart';
import '../guide.dart';

class AppDialog extends HookConsumerWidget {
  const AppDialog({
    super.key,
    required this.content,
    required this.context,
  });

  final Widget? content;
  final BuildContext context;

  @override
  Widget build(_, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: SizedBox(
            height: height / 8,
            width: width / 4,
            child: FlareHeader(
              dialogType: DialogType.QUESTION,
              loop: false,
            ),
          ),
        ),
        AlertDialog(
          content: content,
          // actions: actions,
        ),
      ],
    );
  }

  factory AppDialog.rolesSelection({
    required double height,
    required double width,
    required int numberOfPlayers,
    required WidgetRef ref, // Add ref as a parameter
    required BuildContext context,
  }) {
    return AppDialog(
      context: context,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // guied
          Container(
            decoration: BoxDecoration(
              // color: AppColors.lightestGrey,
              gradient: LinearGradient(
                colors: [
                  AppColors.grey.withOpacity(0.6),
                  AppColors.lightestGrey.withOpacity(0.8),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(width / 32),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: width / 32, vertical: height / 64),
            // height: height / 4,
            width: width / 1.2,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Guied(
                  width: width,
                  side: 'شهروند',
                  iconColor: AppColors.green,
                ),
                SizedBox(height: height / 24),
                Guied(
                  width: width,
                  side: 'مافیا',
                  iconColor: AppColors.secondary,
                ),
                SizedBox(height: height / 24),
                Guied(
                  width: width,
                  side: 'مستقل',
                  iconColor: AppColors.primaries[2],
                ),
              ],
            ),
          ),
          SizedBox(height: height / 32),
          // a list of roles & for each role a checkbox and color is based on side
          SizedBox(
            height: height / 2.4,
            width: width / 1,
            child: Scrollbar(
              scrollbarOrientation: ScrollbarOrientation.right,
              child: ListView(
                children: roleNames.values.map(
                  (roleName) {
                    return RolesSelectionCheckbox(
                      title: roleName,
                      textColor: switch (allRoles2[roleName]!['side']) {
                        'شهروند' => AppColors.green,
                        'مافیا' => AppColors.secondary,
                        _ => AppColors.primaries[2],
                      },
                    );
                  },
                ).toList(),
              ),
            ),
          ),

          SizedBox(height: height / 32),

          // a button to submit the selected roles
          OnlineButton(
            height: height / 12,
            width: width / 1.6,
            title: 'ثبت نقش‌ها',
            onPressed: () {
              print('submit the selected roles');
              // submit the selected roles
              final selectedRoles = ref.read(selectedRolesProvider);
              if (selectedRoles.length == numberOfPlayers) {
              } else {
                AwesomeDialog(
                  context: context,
                  padding: EdgeInsets.all(width / 32),
                  dialogType: DialogType.WARNING,
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        selectedRoles.length < numberOfPlayers
                            ? 'تعداد نقش‌ها کمتر از تعداد بازیکنان است'
                            : 'تعداد نقش‌ها بیشتر از تعداد بازیکنان است',
                        style: MyTextStyles.bodyLarge.copyWith(
                          color: AppColors.darkText,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: height / 64),
                      Text(
                        selectedRoles.length < numberOfPlayers
                            ? 'لطفا برای هر بازیکن یک نقش انتخاب کنید'
                            : 'لطفا برای هر بازیکن یک نقش انتخاب کنید',
                        style: MyTextStyles.bodyMD.copyWith(
                          color: AppColors.darkerGrey,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                )..show();
              }
            },
          ),
        ],
      ),
    );
  }
}
