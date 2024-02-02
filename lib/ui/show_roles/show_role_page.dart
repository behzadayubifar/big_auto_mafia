import 'dart:ffi';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:auto_mafia/ui/night/night_page.dart';
import 'package:auto_mafia/ui/show_roles/widgets/show_role_widget.dart';
import 'package:auto_mafia/ui/ui_widget/names_list_show/names_list_funcs.dart';
import 'package:auto_mafia/utils/dev_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:go_router/go_router.dart';

class ShowRolePage extends HookConsumerWidget {
  ShowRolePage({required String this.role, super.key});

  final pageFlipKey = GlobalKey<PageFlipBuilderState>();
  final String role;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(role);
    final _height = MediaQuery.sizeOf(context).height;
    final _width = MediaQuery.sizeOf(context).width;
    final situation = useState(MyStrings.beforeShowingRole);
    final isComplete = useState(false);

    final players = ref.watch(currentPlayersProvider);

    final frontBuilder = (_) => GestureDetector(
          onTap: () {
            print('on tap');
            situation.value = MyStrings.roleIsShowing;
            pageFlipKey.currentState!.flip();
          },
          child: SvgPicture.asset(
            MyAssets.whichRole,
          ),
        );

    final backBuilder = (_) => ShowRoleWidget(
          width: _width,
          height: _height,
          image: Info.cardByRole(role),
          title: MyStrings.saw,
          textStyle: MyTextStyles.displaySmall.copyWith(
            color: AppColors.white,
          ),
          // show button only if
          isComplete: isComplete.value,
          onLongPress: () async {
            print('on long press me');
            final isar = await ref.read(isarServiceProvider.future);
            final playersWhoSawTheirRole =
                (await isar.retrieveGameStatusN(n: 0))!
                    .playersWhoSawTheirRole
                    ?.toList();
            playersWhoSawTheirRole?.log();
            final playersCount =
                await isar.retrievePlayer().then((rec) => rec.count);
            final haveAllSeenTheirRoles =
                playersWhoSawTheirRole?.length == playersCount;
            if (!haveAllSeenTheirRoles) {
              print('mio');
              await ref
                  .read(currentPlayersProvider.notifier)
                  .action(MyStrings.nightPage);
              context.pushReplacementNamed(
                'night',
                extra: Info.night,
              );
            } else {
              await ref
                  .read(currentPlayersProvider.notifier)
                  .action(MyStrings.showRoles);
              context.pop();
            }
          },
        );

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backGround,
          image: DecorationImage(
            opacity: 0.5,
            scale: .5,
            image: AssetImage(MyAssets.mysteriousGangsterCharacter),
          ),
        ),
        child: Center(
          child: PageFlipBuilder(
            key: pageFlipKey,
            frontBuilder: frontBuilder,
            backBuilder: backBuilder,
            onFlipComplete: (bool value) {
              isComplete.value = !value;
            },
            interactiveFlipEnabled: !isComplete.value,
          ),
        ),
      ),
    );
  }
}
