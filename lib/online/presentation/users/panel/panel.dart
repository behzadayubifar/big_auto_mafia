import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/online/presentation/common/buttons/online_buttons.dart';
import 'package:auto_mafia/online/presentation/users/users_controller.dart';
import 'package:auto_mafia/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../ui/common/loading.dart';

class Panel extends HookConsumerWidget {
  const Panel({
    required this.name,
    required this.coins,
    super.key,
  });

  final String name;
  final int coins;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print(width);

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    double _dragStartX = 0.0;
    // Adjust this value to change the distance
    final double _dragThreshold = 100.0;

    return GlobalLoading(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.backGround,
        drawer: MyDrawer(height: height, name: name, width: width),
        body: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onHorizontalDragStart: (details) {
              _dragStartX = details.globalPosition.dx;
            },
            onHorizontalDragUpdate: (details) {
              // print("dragUpdateX: ${details.globalPosition.dx}");
              final dx = details.globalPosition.dx;
              final diff = _dragStartX - dx;
              // if diff is more than the threshold and the drag is from the right side of the screen
              if (diff > _dragThreshold && _dragStartX > width / 1.2) {
                _scaffoldKey.currentState?.openDrawer();
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App bar
                AppBar(height: height, width: width, scaffoldKey: _scaffoldKey),
                SizedBox(height: height / 24),
                // Header
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
                  onPressed: () {},
                ),
                SizedBox(height: height / 3.2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppBar extends ConsumerWidget {
  const AppBar({
    super.key,
    required this.height,
    required this.width,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final double height;
  final double width;
  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: height / 32, horizontal: width / 16),
      decoration: BoxDecoration(
        color: AppColors.primaries[4],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkerGrey,
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.bars,
              color: AppColors.lightestGrey,
              size: 32,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          Text(
            "پنل کاربری",
            style: MyTextStyles.headlineSmall.copyWith(
              color: AppColors.lightestGrey,
              height: 1.5,
            ),
          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.userCircle,
              color: AppColors.lightestGrey,
              size: 32,
            ),
            onPressed: () {
              ref.read(routerProvider).goNamed('user-entry');
            },
          ),
        ],
      ),
    );
  }
}

class MyDrawer extends ConsumerWidget {
  const MyDrawer({
    super.key,
    required this.height,
    required this.name,
    required this.width,
  });

  final double height;
  final String name;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
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
            // accounts list
            SizedBox(
              height: height / 1.6,
              child: ListView(
                children: [
                  // account with a divider --> widget
                  AccountTile(
                      title: "فاطمه جمشیدی", height: height, width: width),
                  AccountTile(title: "علی هاشمی", height: height, width: width),
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
