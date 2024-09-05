import 'package:auto_mafia/offline/db/entities/user.dart';
import 'package:auto_mafia/online/presentation/common/account_tile.dart';
import 'package:auto_mafia/online/presentation/users/controller/accounts_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:fpdart/fpdart.dart';

import '../../../offline/constants/app_colors.dart';
import '../../../offline/constants/my_text_styles.dart';
import '../../../routes/routes.dart';

class MyDrawer extends ConsumerWidget {
  MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(accountsControllerProvider);
    //
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Drawer(
      backgroundColor: AppColors.lightestGrey,
      elevation: 24,
      shadowColor: AppColors.black,
      // a place to swith between otherAccounts -- if there are multiple otherAccounts we show them here and a plus button to add a new account
      child: accounts.when(
        data: (accounts) {
          if (accounts.isRight()) {
            final users = accounts.getRight().getOrElse(() => []);
            final currentUser = users[0];
            final otherAccounts = users.sublist(1);
            final repeatedNames = getUsersWithRepeatedFullName(users);

            return _buildDrawer(
              height: height,
              width: width,
              currentUser: currentUser,
              otherAccounts: otherAccounts,
              repeatedNames: repeatedNames,
              ref: ref,
            );
          } else {
            // TODO: show last retrieved data
          }
        },
        loading: () => Center(
          child: LoadingAnimationWidget.inkDrop(
            color: AppColors.green,
            size: height / 3,
          ),
        ),
        error: (error, stackTrace) {
          return Center(
            child: Text(
              "خطا در بارگذاری اطلاعات",
              style: MyTextStyles.bodyLarge.copyWith(
                color: AppColors.darkestGrey,
              ),
            ),
          );
        },
      ),
    );
  }

  Container _buildDrawer({
    required double height,
    required double width,
    required User currentUser,
    required List<User> otherAccounts,
    required List<User> repeatedNames,
    required WidgetRef ref,
  }) {
    return Container(
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
                  currentUser.fullName,
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
            width: width / 4,
            child: ListView(
              children: [
                // otherAccounts
                if (otherAccounts.isNotEmpty)
                  for (int i = 0; i < otherAccounts.length; i++)
                    AccountTile(
                      user: otherAccounts[i],
                      height: height,
                      width: width,
                      onPressed: () {
                        ref.read(routerProvider).goNamed(
                              'user-entry',
                              pathParameters: {'isLogin': 'true'},
                              extra: otherAccounts[i].username!,
                            );
                      },
                      repeatedName: repeatedNames.isNotEmpty
                          ? repeatedNames.any((element) =>
                              element.fullName == otherAccounts[i].fullName)
                          : false,
                    ),
                // add new account
                AddNewAccount(height: height, width: width),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddNewAccount extends ConsumerWidget {
  const AddNewAccount({
    required this.height,
    required this.width,
    super.key,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: height / 32, horizontal: width / 16),
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
              style: MyTextStyles.bodyMD
                  .copyWith(color: AppColors.darkestGrey, height: 1.5),
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
    );
  }
}
