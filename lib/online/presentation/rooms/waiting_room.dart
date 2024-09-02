import 'package:auto_mafia/offline/db/entities/room.dart';
import 'package:auto_mafia/offline/db/isar_service.dart';
import 'package:auto_mafia/offline/db/shared_prefs/shared_prefs.dart';
import 'package:auto_mafia/online/data/models/responses/events.dart';
import 'package:auto_mafia/online/events/sse.dart';
import 'package:auto_mafia/online/presentation/common/page_with_drawer_on_drag.dart';
import 'package:auto_mafia/online/presentation/rooms/controllers/rooms_controller.dart';
import 'package:auto_mafia/online/presentation/users/controller/accounts_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:share_plus/share_plus.dart';

import '../../../offline/db/entities/user.dart';
import '../../data/models/responses/rooms.dart';
import '../common/app_bar.dart';
import '../common/my_drawer.dart';

class WaitingRoom extends ConsumerWidget {
  WaitingRoom({
    // this.alreadyJoined,
    super.key,
  });

  // final List<UsersInRoom> alreadyJoined = SharedPrefs.getModel<Room>(
  //   'currentRoom',
  //   Room.fromJson,
  // )!
  //     .players!;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveEvents = ref.watch(appEventsProvider);
    final alreadyJoinedFuture =
        ref.watch(isarServiceProvider.future).then((isar) {
      final roomId = SharedPrefs.getModel('currentRoom', Room.fromJson)!.id;
      return isar.retrieveRoomByID(roomId!).then((room) => room!.usersInfo);
    });
    //
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return PageWithDrawerOnDrag(
      drawer: MyDrawer(),
      child: Column(
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
          SizedBox(
            height: height / 1.3,
            width: width / 1.5,
            child: ListView.custom(
                childrenDelegate: SliverChildListDelegate(
              [
                // show first player as the room owner and the rest as ordinary players from alreadyJoinedFuture
                FutureBuilder(
                  future: alreadyJoinedFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingAnimationWidget.twistingDots(
                        size: 30,
                        leftDotColor: Colors.green,
                        rightDotColor: Colors.red,
                      );
                    }
                    final players = snapshot.data as List<UsersInRoom>;
                    final owner = players[0];
                    final others = players.sublist(1);
                    return Column(
                      mainAxisSize: MainAxisSize.min,
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
                              user: user,
                            ),
                          ),
                      ],
                    );
                  },
                ),
                // SizedBox(height: height / 32),
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
  });

  final double height;
  final double width;
  final UsersInRoom user;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 12,
      width: width / 1.5,
      color: color ?? Colors.white54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(FontAwesomeIcons.crown),
          Text(user.fullName!),
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
