import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../offline/constants/app_colors.dart';
import '../../../../offline/models/role_datasets.dart';
import '../../rooms/room_entry.dart';
import '../buttons/online_buttons.dart';
import '../checkboxes/app_checkbox.dart';
import '../guide.dart';

class AppDialog<T> extends HookConsumerWidget {
  const AppDialog({
    super.key,
    required this.content,
  });

  final Widget? content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
  }) {
    return AppDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // guied
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightestGrey,
              borderRadius: BorderRadius.circular(width / 32),
            ),
            padding: EdgeInsets.symmetric(horizontal: width / 64),
            height: height / 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Guied(
                  width: width,
                  title: 'شهروند',
                  iconColor: AppColors.green,
                ),
                SizedBox(width: width / 48),
                Guied(
                  width: width,
                  title: 'مافیا',
                  iconColor: AppColors.secondary,
                ),
                SizedBox(width: width / 48),
                Guied(
                  width: width,
                  title: 'مستقل',
                  iconColor: AppColors.primaries[2],
                ),
              ],
            ),
          ),
          SizedBox(height: height / 32),
          // a list of roles & for each role a checkbox and color is based on side
          SizedBox(
            height: height / 2,
            width: width / 1,
            child: Scrollbar(
              scrollbarOrientation: ScrollbarOrientation.right,
              child: ListView(
                children: roleNames.values.map(
                  (roleName) {
                    return RolesSelectionCheckbox(
                      title: roleName,
                      textColor: switch (allRoles2[roleName]!['type']) {
                        RoleType.citizen => AppColors.green,
                        RoleType.mafia => AppColors.secondary,
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
              // submit the selected roles
            },
          ),
        ],
      ),
    );
  }
}
