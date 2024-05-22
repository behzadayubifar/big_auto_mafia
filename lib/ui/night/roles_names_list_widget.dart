import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:flutter/material.dart';

class RoleNamesList extends StatelessWidget {
  const RoleNamesList({
    super.key,
    required double width,
    required double height,
    required this.scrollController,
    required this.guessedRole,
  })  : _width = width,
        _height = height;

  final double _width;
  final double _height;
  final ScrollController scrollController;
  final ValueNotifier<String> guessedRole;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: SizedBox(
        // width: _width / 1.8,
        height: _height / 1.8,
        child: SafeArea(
          minimum: EdgeInsets.only(top: _height / 15),
          child: Scrollbar(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SizedBox(
                    width: _width / 2,
                    height: _height / 1.64,
                    child: ListView.separated(
                      controller: scrollController,
                      cacheExtent: _height / 1.64,
                      restorationId: 'night-page',
                      clipBehavior: Clip.antiAlias,
                      itemCount: roleNames
                          .values
                          // .where((role) => ![
                          //       MyStrings.godfather,
                          //       MyStrings.matador,
                          //       MyStrings.saul,
                          //       MyStrings.mafia,
                          //     ].contains(role))
                          .length,
                      itemBuilder: (context, index) {
                        return MyButton(
                          textStyle: MyTextStyles.bodyMedium
                              .copyWith(color: AppColors.white),
                          title: roleNames.values.elementAt(index),
                          selected: roleNames.values.elementAt(index) ==
                              guessedRole.value,
                          onPressed: () => guessedRole.value =
                              roleNames.values.elementAt(index),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: _height / 56);
                      },
                    ),
                  ),
                ),
                SizedBox(height: _height / 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
