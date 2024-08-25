import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/online/presentation/common/buttons/online_buttons.dart';
import 'package:auto_mafia/online/presentation/users/users_controller.dart';
import 'package:auto_mafia/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../ui/common/loading.dart';

class Panel extends StatefulHookConsumerWidget {
  const Panel({
    required this.id,
    super.key,
  });

  final String id;

  @override
  ConsumerState<Panel> createState() => _PanelState();
}

class _PanelState extends ConsumerState<Panel> {
  late final String name;
  late int coins;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(loadingProvider.notifier).toggle();
      final isar = await ref.read(isarServiceProvider.future);
      final user = (await isar.retrieveUserByID(widget.id));
      if (user != null) {
        name = user.firstName! + ' ' + user.lastName!;
        coins = user.coins ?? 0;
      } else {
        ref.read(routerProvider).goNamed('user-entry', pathParameters: {
          'isLogin': 'true',
        });
      }
    });
    ref.read(loadingProvider.notifier).toggle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GlobalLoading(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: AppColors.lightestGrey,
          elevation: 24,
          shadowColor: AppColors.black,
          // a place to swith between accounts -- if there are multiple accounts we show them here and a plus button to add a new account
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
                        name,
                        style: MyTextStyles.bodyLarge.copyWith(
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
                // accounts list
                SizedBox(
                  height: height / 1.6,
                  child: ListView(
                    children: [
                      // account with a divider --> widget
                      AccountTile(
                          title: "فاطمه جمشیدی", height: height, width: width),
                      AccountTile(
                          title: "علی هاشمی", height: height, width: width),
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
                                    color: AppColors.darkestGrey, height: 1.5),
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
        ),
        backgroundColor: AppColors.backGround,
        body: SafeArea(
          minimum: EdgeInsets.fromLTRB(0, height / 12, 0, 64),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // profile
                    Text(
                      name,
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
                OnlineButton(
                  title: "پیوستن به روم",
                  height: height / 8,
                  width: width / 1.6,
                  onPressed: () {},
                  provider: usersControllerProvider,
                ),
                SizedBox(height: height / 24),
                OnlineButton(
                    title: "ایجاد روم",
                    height: height / 8,
                    width: width / 1.6,
                    onPressed: () {},
                    provider: usersControllerProvider),
                SizedBox(height: height / 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AccountTile extends StatelessWidget {
  const AccountTile({
    required this.title,
    required this.height,
    required this.width,
    super.key,
  });

  final String title;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: height / 32, horizontal: width / 16),
          child: Row(
            children: [
              // icon
              Icon(
                FontAwesomeIcons.userNinja,
                size: 48,
                color: AppColors.darkerGrey,
              ),
              SizedBox(width: width / 32),
              // name
              Text(
                title,
                style: MyTextStyles.bodyLarge.copyWith(
                  color: AppColors.grey,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        // Divider
        Divider(
            color: AppColors.primaries[0],
            thickness: 1,
            height: 0,
            indent: width / 16,
            endIndent: width / 16),
      ],
    );
  }
}
