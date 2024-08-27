import 'package:auto_mafia/offline/db/entities/user.dart';
import 'package:auto_mafia/online/presentation/common/account_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../offline/constants/app_colors.dart';
import '../../../offline/constants/my_text_styles.dart';
import '../../../routes/routes.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({
    super.key,
    required this.height,
    required this.currentUserName,
    required this.width,
    this.otherAccounts,
    this.repeatedNames,
  });

  final double height;
  final String currentUserName;
  final double width;
  final List<User>? otherAccounts;
  final List<String>? repeatedNames;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: AppColors.lightestGrey,
      elevation: 24,
      shadowColor: AppColors.black,
      // a place to swith between otherAccounts -- if there are multiple otherAccounts we show them here and a plus button to add a new account
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.white,
              AppColors.primaries[0],
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            // Header
            Container(
              color: AppColors.primaries[0],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height / 32),
                  // TODO: later we can get the [user's *image] from the server
                  Icon(
                    FontAwesomeIcons.circleUser,
                    size: 128,
                    color: AppColors.primaries[2],
                  ),
                  SizedBox(height: height / 32),
                  Text(
                    currentUserName,
                    style: MyTextStyles.headlineSmall.copyWith(
                      color: AppColors.darkestGrey,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: height / 32),
                ],
              ),
            ),
            // Divider
            Divider(color: AppColors.white, thickness: 1, height: 0),
            // otherAccounts list
            SizedBox(
              height: height / 1.6,
              child: otherAccounts == null
                  ? SizedBox()
                  : ListView(
                      children: [
                        // otherAccounts
                        for (int i = 0; i < otherAccounts!.length; i++)
                          AccountTile(
                            user: otherAccounts![i],
                            height: height,
                            width: width,
                            onPressed: () {
                              ref.read(routerProvider).goNamed(
                                    'user-entry',
                                    pathParameters: {'isLogin': 'true'},
                                    extra: otherAccounts![i].username!,
                                  );
                            },
                            repeatedName: repeatedNames != null
                                ? repeatedNames!
                                    .contains(otherAccounts![i].fullName)
                                : false,
                          ),
                        // add new account
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: height / 32, horizontal: width / 16),
                          child: Row(
                            children: [
                              // icon
                              Icon(
                                FontAwesomeIcons.plus,
                                size: 24,
                                color: AppColors.darkerGrey,
                              ),
                              SizedBox(width: width / 32),
                              // name
                              TextButton(
                                child: Text(
                                  "افزودن حساب کاربری",
                                  style: MyTextStyles.bodyMD.copyWith(
                                      color: AppColors.darkestGrey,
                                      height: 1.5),
                                ),
                                onPressed: () {
                                  ref.read(routerProvider).goNamed(
                                    'user-entry',
                                    pathParameters: {'isLogin': 'true'},
                                  );
                                },
                              ),
                            ],
                          ),
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
