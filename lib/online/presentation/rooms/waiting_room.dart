import 'dart:developer';

import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/offline/db/entities/room.dart';
import 'package:auto_mafia/offline/db/shared_prefs/shared_prefs.dart';
import 'package:auto_mafia/online/data/models/responses/events.dart';
import 'package:auto_mafia/online/events/sse.dart';
import 'package:auto_mafia/online/presentation/common/buttons/online_buttons.dart';
import 'package:auto_mafia/online/presentation/common/dialogs/app_dialog.dart';
import 'package:auto_mafia/online/presentation/common/page_with_drawer_on_drag.dart';
import 'package:auto_mafia/online/presentation/rooms/controllers/active_room.dart';
import 'package:auto_mafia/online/presentation/rooms/controllers/rooms_controller.dart';
import 'package:auto_mafia/routes/routes.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/models/responses/rooms.dart';
import '../common/app_bar.dart';
import '../common/my_drawer.dart';

class WaitingRoom extends HookConsumerWidget {
  WaitingRoom({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeRoom = ref.watch(activeRoomsProvider);
    final liveEvents = ref.watch(appEventsProvider);
    //
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //
    final fullness = useState(false);

    liveEvents.maybeWhen(
      data: (events) {
        for (final event in events) {
          if (event is RoomFull) {
            fullness.value = true;
            final isCreator = SharedPrefs.userID == event.users[0].id;
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AppDialog.roomIsFull(
                  height: height,
                  width: width,
                  context: context,
                  ref: ref,
                  isCreator: isCreator,
                );
              },
            );
          } else if (event is FinishedJoining) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AppDialog.finishedJoining(
                  height: height,
                  width: width,
                  context: context,
                  ref: ref,
                );
              },
            );
          } else if (event is GameStarted) {
            final player = event.player;
            ref.read(routerProvider).goNamed(
                  'show-role',
                  extra: player,
                );
          }
        }
      },
      orElse: () {},
    );
    // initial scroll offset is 0
    final scrollController = useScrollController(initialScrollOffset: 0);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients)
        Future.delayed(Duration(milliseconds: 1500), () {
          scrollController.animateTo(
            height / 2.4,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        }).then((value) {
          if (scrollController.hasClients)
            Future.delayed(Duration(milliseconds: 1500), () {
              scrollController.animateTo(
                0,
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            });
        });
    });

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          // close the connection for the SSE
          log('closing the connection');
          // dispose riverpod stream
          // ref.read(appEventsProvider.notifier).closeConnection();
        }
      },
      child: PageWithDrawerOnDrag(
        drawer: MyDrawer(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyAppBar(
              height: height,
              width: width,
              scaffoldKey: _scaffoldKey,
              title: SharedPrefs.getModel<Room>(
                'currentRoom',
                Room.fromJson,
              )!
                  .name!,
              leftIcon: Icons.share,
              leftIconFunc: () {
                // Share the room ID
                Share.share(
                    SharedPrefs.getModel<Room>('currentRoom', Room.fromJson)!
                        .id!);
              },
            ),
            RefreshIndicator(
              onRefresh: () async {
                final roomId =
                    SharedPrefs.getModel<Room>('currentRoom', Room.fromJson)!
                        .id;
                await ref
                    .read(activeRoomsProvider.notifier)
                    .refreshRoomById(roomId!);
              },
              // show the list of users joined the room
              child: SizedBox(
                height: height / 1.6,
                width: width / 1.2,
                child: ListView(
                  children: [
                    // TODO: Later we put headers in a separate widget and use it here
                    SizedBox(height: height / 24),
                    // room
                    activeRoom.maybeWhen(
                      data: (rooms) {
                        final room = rooms.firstOrNull;
                        if (room != null) {
                          final numberOfJoinedPlayers = room.usersInfo!.length;
                          final owner = room.usersInfo![0];
                          final others = room.usersInfo!.sublist(1);
                          return Column(
                            children: [
                              // show the number of players joined the room
                              Row(
                                children: [
                                  SizedBox(width: width / 32),
                                  Icon(FontAwesomeIcons.users),
                                  SizedBox(width: width / 32),
                                  Text(
                                    'تعداد بازیکنان: $numberOfJoinedPlayers',
                                    style: MyTextStyles.bodyLarge.copyWith(
                                      color: AppColors.primaries[0],
                                      height: 1.5,
                                    ),
                                  ),
                                  // show the room capacity
                                  Text(
                                    ' / ${room.numberOfPlayers}',
                                    style: MyTextStyles.bodyLarge.copyWith(
                                      color: AppColors.lighterGrey,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height / 24),
                              // show the list of users joined the room
                              ColorFiltered(
                                colorFilter: !fullness.value
                                    ? ColorFilter.mode(
                                        Colors.transparent,
                                        BlendMode.color,
                                      )
                                    : ColorFilter.mode(
                                        Colors.grey,
                                        BlendMode.saturation,
                                      ),
                                child: Container(
                                    height: height / 2.4,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.primaries[2],
                                          AppColors.primaries[3],
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListView.custom(
                                      physics: const BouncingScrollPhysics(),
                                      controller: scrollController,
                                      // controller: ,
                                      childrenDelegate: SliverChildListDelegate(
                                        [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              // show the owner of the room --- never wanted no more
                                              UserCard(
                                                height: height / 12,
                                                width: width,
                                                user: owner,
                                                color: const Color.fromARGB(
                                                    255, 217, 215, 71),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: width / 32,
                                                  // vertical: height / 128,
                                                ),
                                              ),
                                              // show the rest of the players who joined the room after the first player
                                              if (others.isNotEmpty)
                                                ...others.map(
                                                  (user) => UserCard(
                                                      height: height / 12,
                                                      width: width,
                                                      user: user,
                                                      icon: FontAwesomeIcons
                                                          .periscope,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: width / 32,
                                                        // vertical: height / 128,
                                                      )),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          );
                        }
                        return SizedBox();
                      },
                      orElse: () => LoadingAnimationWidget.newtonCradle(
                        size: width / 1,
                        color: AppColors.primaries[1],
                      ),
                    ),
                    LoadingAnimationWidget.flickr(
                      size: width / 8,
                      leftDotColor: AppColors.greens[1],
                      rightDotColor: AppColors.primaries[1],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height / 24),
            // Leave the room button
            if (!fullness.value)
              OnlineButton(
                provider: roomsControllerProvider,
                child: AnimatedButton(
                  color: AppColors.darkerGrey,
                  width: width / 2,
                  buttonTextStyle: MyTextStyles.bodyLarge.copyWith(
                    color: AppColors.lighterGrey,
                  ),
                  text: 'ترک روم',
                  pressEvent: () async {
                    final roomId = SharedPrefs.getModel<Room>(
                            'currentRoom', Room.fromJson)!
                        .id;
                    await ref
                        .read(roomsControllerProvider.notifier)
                        .leaveRoom(roomId!);
                  },
                ),
              )
            else
              SizedBox(),
          ],
        ),
        scaffoldKey: _scaffoldKey,
        width: width,
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.height,
    required this.width,
    required this.user,
    this.color,
    this.icon,
    this.padding,
  });

  final double height;
  final double width;
  final UsersInRoom user;
  final Color? color;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      color: color ?? Colors.white54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon ?? FontAwesomeIcons.crown),
          Text(user.fullName!,
              style: MyTextStyles.bodyMD.copyWith(
                height: 1.5,
              )),
          Icon(FontAwesomeIcons.person),
        ],
      ),
    );
  }
}
