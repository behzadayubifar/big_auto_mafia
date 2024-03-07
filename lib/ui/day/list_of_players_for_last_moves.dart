import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/ui/day/grid_list_of_players.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Widget listOfPlayersForLastMoves(
  AsyncValue<List<Player>> asyncAlivePlayers,
  double height,
  double width,
  ValueNotifier<List<String>> selectedPlayers,
  ScrollController scrollController,
  String playerWithCardRoleName,
  String lastMoveName,
  bool multiSelect,
) {
  Widget widget = SizedBox();
  switch (lastMoveName) {
    case MyStrings.faceOff:
    case MyStrings.handCuff:
    case MyStrings.silenceOfSheep:
    case MyStrings.beautifulMind:
      widget = GridOfPlayers(
        asyncAlivePlayers: asyncAlivePlayers,
        height: height,
        width: width,
        selectedPlayers: selectedPlayers,
        scrollController: scrollController,
        axix: Axis.vertical,
        multiSelect: multiSelect,
      );
      break;
    case MyStrings.roleReveal:
      widget = Center(
        child: Text(
          'نقش شما: $playerWithCardRoleName',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      break;
  }
  return widget;
}
