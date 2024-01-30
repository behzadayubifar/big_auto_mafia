import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/logics_utils.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

Future<void> start({
  required List<TextEditingController> controllers,
  required Future<IsarService> isar,
  required ValueNotifier<Map<String, String>> pageInfo,
  required List<String> listOfPlayersNames,
}) async {
  for (var i = 0; i < controllers.length; i++) {
    final controller = controllers[i];
    final playerName = controller.text;
    if (playerName != '') {
      listOfPlayersNames.add(playerName);
    }
  }
  devtools.log('listOfPlayersNames: $listOfPlayersNames');
  final List<Map<String, String>> playerRoleMapList = assignRandomRole(
    listOfPlayersNames,
    roleNamesList(listOfPlayersNames.length),
  ).entries.map((e) {
    return {
      e.key: e.value,
    };
  }).toList();
  devtools.log('playerRoleMapList: $playerRoleMapList');

  // time to add players to db
  await (await isar).initializePlayers(playerRoleMapList);

  // update info
  pageInfo.value = Info.updateInfo(topic: InfoOptions.showRoles);
}
