import 'package:auto_mafia/offline/db/entities/room.dart';
import 'package:auto_mafia/offline/db/shared_prefs/shared_prefs.dart';
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
    super.key,
  });

  /*  final User currentUser;
  final List<User>? otherAccounts;
  final List<String>? repeatedNames;

  final Room room; */

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final room = ref.watch(roomsControllerProvider);
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
              Share.share(SharedPrefs.getString('currentRoomID')!);
            },
          ),
          SizedBox(height: height / 24),
          // list of users joined the room
          // room.maybeWhen(
          //   data: (resp) {
          //     if (resp.isRight()) {
          //       final rooms =
          //           resp.getRight().getOrElse(() => RoomResp.empty()).rooms;
          //       return ListView.separated(
          //         shrinkWrap: true,
          //         itemCount: rooms.length,
          //         separatorBuilder: (context, index) =>
          //             const SizedBox(height: 8.0),
          //         itemBuilder: (context, index) {
          //           final user = rooms[index].players[0];
          //           return UserCard(
          //             height: height,
          //             width: width,
          //             user: user,
          //           );
          //         },
          //       );
          //     }
          //   },
          //   orElse: () => LoadingAnimationWidget.bouncingBall(
          //     size: height / 3.2,
          //     color: Colors.white,
          //   ),
          // ),
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
  final User user;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 2,
      width: width / 1.5,
      color: color ?? Colors.white54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(FontAwesomeIcons.crown),
          Text(user.fullName),
          Icon(FontAwesomeIcons.person),
        ],
      ),
    );
  }
}
