import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/online/presentation/common/buttons/online_buttons.dart';
import 'package:auto_mafia/online/presentation/users/controller/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../offline/db/entities/user.dart';
import '../../../../routes/routes.dart';
import '../../../../offline/ui/common/loading.dart';
import '../../common/app_bar.dart';
import '../../common/my_drawer.dart';
import '../../common/page_with_drawer_on_drag.dart';

class Panel extends HookConsumerWidget {
  const Panel({
    required this.currentUser,
    required this.coins,
    required this.otherAccounts,
    required this.repeatedNames,
    super.key,
  });

  final User currentUser;
  final int coins;
  final List<User>? otherAccounts;
  final List<String>? repeatedNames;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return GlobalLoading(
      child: PageWithDrawerOnDrag(
        width: width,
        scaffoldKey: _scaffoldKey,
        drawer: MyDrawer(
          height: height,
          currentUserName: currentUser.fullName,
          otherAccounts: otherAccounts,
          repeatedNames: repeatedNames,
          width: width,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App bar
            MyAppBar(
              height: height,
              width: width,
              scaffoldKey: _scaffoldKey,
              title: "پنل کاربری",
            ),
            SizedBox(height: height / 24),
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // profile
                Text(
                  currentUser.fullName,
                  style: MyTextStyles.bodyLarge.copyWith(
                    color: AppColors.lightestGrey,
                    height: 1.5,
                  ),
                ),
                // coin
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      coins.toString(),
                      style: MyTextStyles.bodyLarge.copyWith(
                        color: AppColors.lightestGrey,
                      ),
                    ),
                    SizedBox(width: width / 32),
                    Icon(
                      FontAwesomeIcons.coins,
                      color: Colors.yellow,
                      size: 48,
                    ),
                  ],
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            // TODO: change proider to roomControllerProvider
            // join room
            OnlineButton(
              title: "پیوستن به روم",
              height: height / 8,
              width: width / 1.6,
              provider: usersControllerProvider,
              shadowColor: AppColors.primaries[0],
              elevation: 12,
              onPressed: () {},
            ),
            SizedBox(height: height / 16),
            // create room
            OnlineButton(
              title: "ایجاد روم",
              height: height / 8,
              width: width / 1.6,
              provider: usersControllerProvider,
              shadowColor: AppColors.primaries[0],
              elevation: 12,
              onPressed: () => ref.read(routerProvider).pushNamed('room-entry'),
            ),
            SizedBox(height: height / 3.2),
          ],
        ),
      ),
    );
  }
}
