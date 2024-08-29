import 'package:auto_mafia/offline/db/entities/room.dart';
import 'package:auto_mafia/online/presentation/common/page_with_drawer_on_drag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../../offline/db/entities/user.dart';
import '../common/app_bar.dart';
import '../common/my_drawer.dart';

class WaitingRoom extends ConsumerWidget {
  WaitingRoom({
    required this.currentUser,
    required this.otherAccounts,
    required this.repeatedNames,
    required this.room,
    super.key,
  });

  final User currentUser;
  final List<User>? otherAccounts;
  final List<String>? repeatedNames;

  final Room room;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            title: room.name!,
            leftIcon: Icons.share,
            leftIconFunc: () {
              // Share the room ID
              Share.share(room.id!);
            },
          ),
          SizedBox(height: height / 24),
          PlayerCard(height: height, width: width, currentUser: currentUser),
        ],
      ),
      scaffoldKey: _scaffoldKey,
      width: width,
    );
  }
}

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
    required this.height,
    required this.width,
    required this.currentUser,
  });

  final double height;
  final double width;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 2,
      width: width / 1.5,
      color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(FontAwesomeIcons.crown),
          Text(currentUser.fullName),
          Icon(FontAwesomeIcons.person),
        ],
      ),
    );
  }
}
