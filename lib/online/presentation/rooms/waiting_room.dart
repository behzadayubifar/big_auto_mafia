import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/offline/db/entities/room.dart';
import 'package:auto_mafia/offline/db/shared_prefs/shared_prefs.dart';
import 'package:auto_mafia/online/data/models/responses/events.dart';
import 'package:auto_mafia/online/events/sse.dart';
import 'package:auto_mafia/online/presentation/common/page_with_drawer_on_drag.dart';
import 'package:auto_mafia/online/presentation/rooms/controllers/active_room.dart';
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
    final liveEvents = ref.watch(appEventsProvider);
    // final alreadyJoinedFuture =
    //     ref.watch(isarServiceProvider.future).then((isar) {
    //   final roomId = SharedPrefs.getModel('currentRoom', Room.fromJson)!.id;
    //   return isar.retrieveRoomByID(roomId!).then((room) => room!.usersInfo);
    // });
    final activeRoom = ref.watch(activeRoomsProvider);
    //
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //
    // initial scroll offset is 0
    final scrollController = useScrollController(initialScrollOffset: 0);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2), () {
        scrollController.animateTo(
          height / 2,
          duration: Duration(seconds: 2),
          curve: Curves.easeInOut,
        );
      }).then((value) {
        Future.delayed(Duration(seconds: 2), () {
          scrollController.animateTo(
            0,
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
          );
        });
      });
    });

    return PageWithDrawerOnDrag(
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
          SizedBox(height: height / 24),
          // list of users joined the room
          Container(
            height: height / 2,
            width: width / 1.2,
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
                    // show first player as the room owner and the rest as ordinary players from alreadyJoinedFuture
                    // FutureBuilder(
                    //   future: alreadyJoinedFuture,
                    //   builder: (context, snapshot) {
                    //     if (snapshot.connectionState == ConnectionState.waiting) {
                    //       return LoadingAnimationWidget.twistingDots(
                    //         size: 30,
                    //         leftDotColor: Colors.green,
                    //         rightDotColor: Colors.red,
                    //       );
                    //     }
                    //     final players = snapshot.data as List<UsersInRoom>;
                    //     final owner = players[0];
                    //     final others = players.sublist(1);
                    //     return Column(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         UserCard(
                    //           height: height,
                    //           width: width,
                    //           user: owner,
                    //           color: const Color.fromARGB(255, 217, 215, 71),
                    //         ),
                    //         if (others.isNotEmpty)
                    //           ...others.map(
                    //             (user) => UserCard(
                    //               height: height,
                    //               width: width,
                    //               user: user,
                    //             ),
                    //           ),
                    //       ],
                    //     );
                    //   },
                    // ),
                    // SizedBox(height: height / 32),
                    activeRoom.maybeWhen(
                      data: (rooms) {
                        final room = rooms.firstOrNull;
                        if (room != null) {
                          final owner = room.usersInfo![0];
                          final others = room.usersInfo!.sublist(1);
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              UserCard(
                                height: height / 12,
                                width: width,
                                user: owner,
                                color: const Color.fromARGB(255, 217, 215, 71),
                                padding: EdgeInsets.symmetric(
                                  horizontal: width / 32,
                                  // vertical: height / 128,
                                ),
                              ),
                              if (others.isNotEmpty)
                                ...others.map(
                                  (user) => UserCard(
                                      height: height / 12,
                                      width: width,
                                      user: user,
                                      icon: FontAwesomeIcons.periscope,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: width / 32,
                                        // vertical: height / 128,
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
                    // show the rest of the players who joined the room after the first player
                    liveEvents.maybeWhen(
                      data: (events) {
                        events.where((event) {
                          switch (event.type) {
                            case JoinRoomEvent:
                              return true;
                            case _:
                              return false;
                          }
                        }).map((event) {
                          return UserCard(
                            height: height,
                            width: width,
                            user: (event as JoinRoomEvent).user,
                          );
                        });
                        return SizedBox();
                      },
                      orElse: () => LoadingAnimationWidget.newtonCradle(
                        size: width / 2,
                        color: Colors.green,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
      scaffoldKey: _scaffoldKey,
      width: width,
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

/* 
 data: (resp) {
              final playersOpt = resp.getRight().map((a) => a.users);
              // show first player as the room owner and the rest as ordinary players
              playersOpt.match(
                () => SizedBox(),
                (players) {
                  final owner = players![0].values.first;
                  final others =
                      players.sublist(1).map((e) => e.values.firstOrNull);
                  return SizedBox(
                    height: height / 1.3,
                    child: ListView(
                      children: [
                        UserCard(
                          height: height,
                          width: width,
                          user: owner,
                          color: const Color.fromARGB(255, 217, 215, 71),
                        ),
                        if (others.isNotEmpty)
                          ...others.map(
                            (user) => UserCard(
                              height: height,
                              width: width,
                              user: user!,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              );
              return SizedBox();
            },
          

 */
