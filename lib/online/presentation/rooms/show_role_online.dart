import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/db/entities/user.dart';
import 'package:auto_mafia/offline/ui/show_roles/widgets/show_role_widget.dart';
import 'package:auto_mafia/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

import '../../../offline/constants/info_strings.dart';
import '../../../offline/constants/my_strings.dart';
import '../../../offline/constants/my_text_styles.dart';
import '../../../offline/my_assets.dart';
import '../common/buttons/online_buttons.dart';

class ShowRoleOnline extends ConsumerWidget {
  ShowRoleOnline({
    required this.player,
    super.key,
  });
  final PlayerOnline player;
  // used to flip the page programmatically
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    final _height = MediaQuery.sizeOf(context).height;
    final _width = MediaQuery.sizeOf(context).width;
    //

    return Container(
      color: AppColors.backGround,
      child: PageFlipBuilder(
        key: pageFlipKey,
        frontBuilder: (context) {
          return GestureDetector(
            onTap: () {
              pageFlipKey.currentState!.flip();
            },
            child: Container(
              color: AppColors.backGround,
              child: Center(
                child: SvgPicture.asset(
                  MyAssets.whichRole,
                ),
              ),
            ),
          );
        },
        backBuilder: (context) {
          return ShowRoleWidget(
            width: _width,
            height: _height,
            image: Info.cardByRole(player.role!),
            button: OnlineButton(
              backgroundColor: AppColors.darkText,
              title: MyStrings.saw,
              textStyle: MyTextStyles.displaySmall.copyWith(
                color: AppColors.lightestGrey,
                height: .05,
              ),
              onPressed: () {
                ref.read(routerProvider).goNamed('game-page');
              },
            ),
          );
        },
      ),
    );
  }
}
