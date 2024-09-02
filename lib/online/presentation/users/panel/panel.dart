import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/offline/db/shared_prefs/shared_prefs.dart';
import 'package:auto_mafia/online/presentation/common/buttons/online_buttons.dart';
import 'package:auto_mafia/online/presentation/rooms/controllers/active_room.dart';
import 'package:auto_mafia/online/presentation/rooms/controllers/rooms_controller.dart';
import 'package:auto_mafia/online/presentation/users/controller/accounts_controller.dart';
import 'package:auto_mafia/online/presentation/users/controller/users_controller.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../routes/routes.dart';
import '../../../../offline/ui/common/loading.dart';
import '../../common/app_bar.dart';
import '../../common/fields/text_form_fields.dart';
import '../../common/lists/my_list_tile.dart';
import '../../common/lists/my_list_view.dart';
import '../../common/my_drawer.dart';
import '../../common/page_with_drawer_on_drag.dart';

class Panel extends HookConsumerWidget {
  const Panel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsController = ref.watch(accountsControllerProvider);
    final activeRooms = ref.watch(activeRoomsProvider);
    // ---

    final roomIdController = useTextEditingController();
    final passwordController = useTextEditingController();
    final scrollController = useScrollController();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final _formKey = GlobalKey<FormState>();

    return GlobalLoading(
      child: PageWithDrawerOnDrag(
        width: width,
        scaffoldKey: _scaffoldKey,
        drawer: MyDrawer(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // App bar
              MyAppBar(
                height: height,
                width: width,
                scaffoldKey: _scaffoldKey,
                title: "پنل کاربری",
              ),
              SizedBox(height: height / 24),
              RefreshIndicator(
                onRefresh: () async {
                  final id = SharedPrefs.userID;
                  if (id == null) {
                    return;
                  }
                  await ref
                      .read(accountsControllerProvider.notifier)
                      .getAccountFromServer(id);
                },
                child: SizedBox(
                  height: height / 1.4,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: height / 1.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Header
                            accountsController.maybeWhen(
                              data: (accounts) {
                                if (accounts.isRight()) {
                                  final users =
                                      accounts.getRight().getOrElse(() => []);
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // profile
                                      Text(
                                        users[0].fullName,
                                        style: MyTextStyles.bodyLarge.copyWith(
                                          color: AppColors.lightestGrey,
                                          height: 1.5,
                                        ),
                                      ),
                                      // coin
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            (users[0].coins ?? "0").toString(),
                                            style:
                                                MyTextStyles.bodyLarge.copyWith(
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
                                  );
                                }
                                return SizedBox();
                              },
                              orElse: () =>
                                  LoadingAnimationWidget.prograssiveDots(
                                color: AppColors.green,
                                size: width / 4,
                              ),
                            ),
                            SizedBox(
                              height: height / 32,
                            ),
                            // TODO: change proider to roomControllerProvider
                            // join room
                            OnlineButton(
                              title: "پیوستن به روم",
                              height: height / 8,
                              width: width / 1.6,
                              provider: roomsControllerProvider,
                              shadowColor: AppColors.primaries[0],
                              elevation: 12,
                              onPressed: () async {
                                AwesomeDialog(
                                    context: context,
                                    title: "ENTER IP",
                                    body: SingleChildScrollView(
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // roomId
                                            MyTextField(
                                                textDirection:
                                                    TextDirection.ltr,
                                                labelText: 'شناسه روم',
                                                controller: roomIdController,
                                                nextController:
                                                    passwordController,
                                                validator: (content) {
                                                  if (content == null ||
                                                      content.isEmpty) {
                                                    return 'لطفا IP را وارد کنید';
                                                  }
                                                  return null;
                                                }),
                                            SizedBox(
                                              height: height / 32,
                                            ),
                                            // password
                                            MyTextField(
                                              textDirection: TextDirection.ltr,
                                              labelText: 'رمز روم',
                                              controller: passwordController,
                                              textInputAction:
                                                  TextInputAction.done,
                                              obscureText: true,
                                              validator: (content) {
                                                if (content == null ||
                                                    content.isEmpty) {
                                                  return 'لطفا رمز روم را وارد کنید';
                                                }
                                                return null;
                                              },
                                            ),
                                            SizedBox(
                                              height: height / 32,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    buttonsTextStyle:
                                        MyTextStyles.bodyLarge.copyWith(
                                      height: 1.3,
                                    ),
                                    btnOk: OnlineButton(
                                      height: height / 10,
                                      width: width,
                                      backgroundColor: AppColors.greens[0],
                                      title: 'پیوستن',
                                      provider: roomsControllerProvider,
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate())
                                          await ref
                                              .read(roomsControllerProvider
                                                  .notifier)
                                              .joinRoom(
                                                roomIdController.text,
                                                passwordController.text,
                                              );
                                      },
                                    )).show();
                              },
                            ),
                            SizedBox(height: height / 24),
                            // create room
                            OnlineButton(
                              title: "ایجاد روم",
                              height: height / 8,
                              width: width / 1.6,
                              provider: roomsControllerProvider,
                              shadowColor: AppColors.primaries[0],
                              elevation: 12,
                              onPressed: () => ref
                                  .read(routerProvider)
                                  .pushNamed('room-entry'),
                            ),
                            // Active rooms
                            SizedBox(height: height / 24),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width / 16),
                              child: activeRooms.maybeWhen(
                                data: (rooms) {
                                  return MyListView(
                                      height: height / 4,
                                      width: width,
                                      children: rooms,
                                      scrollController: scrollController,
                                      itemBuilder: (context, index) {
                                        return MyListTile(
                                          height: height / 16,
                                          width: width,
                                          index: index,
                                          title: rooms[index]!.name!,
                                          leading: rooms[index]!
                                              .numberOfPlayers
                                              .toString(),
                                        );
                                      });
                                },
                                loading: () =>
                                    LoadingAnimationWidget.prograssiveDots(
                                  color: AppColors.green,
                                  size: width / 4,
                                ),
                                orElse: () => SizedBox(),
                              ),
                            ),

                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
