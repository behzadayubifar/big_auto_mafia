import 'dart:io';

import 'package:auto_mafia/db/entities/game_status.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_service.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isarInstance(IsarInstanceRef ref) {
  return IsarService.openDB();
}

@riverpod
Future<IsarService> isarService(IsarServiceRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  return IsarService(isar);
}

// live data for alive players
@riverpod
Future<List<Player?>> alivePlayers(AlivePlayersRef ref) async {
  final isar = await ref.watch(isarServiceProvider.future);
  return isar.alivePlayers();
}

// get the isar service

class IsarService {
  final Isar isar;
  static late List<Player> players;

  IsarService(this.isar);

  static Future<Isar> openDB() async {
    //ToDo: change the directory to the app directory
    // final dir = await getApplicationDocumentsDirectory();
    // a hardcoded diractory in the root of the device
    final dir = await Directory('E:/test_directory').create(recursive: true);
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          PlayerSchema,
          NightSchema,
          GameStatusSchema,
        ],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  /// initialize players `isar.writeTxnSync(() => isar.players.putAllSync(players));`
  void initializePlayers(List<Map<String, RoleName>> players) async {
    isar.writeTxnSync(() => isar.players.putAllSync(
          players
              .map((player) => Player.initializeBasedOnRole(player))
              .toList(),
        ));
  }

  Future<List<Player>> getAllPlayers() async =>
      isar.players.where(distinct: true).findAll();

  Future<Player?> getPlayerByName(String playerName) async =>
      isar.players.filter().playerNameEqualTo(playerName).findFirst();

  Future<Player?> getPlayerByRole(RoleName roleName) async =>
      isar.players.filter().roleNameEqualTo(roleNames[roleName]!).findFirst();

  void updatePlayer(Player player) =>
      isar.writeTxnSync(() => isar.players.putSync(isar.players
          .filter()
          .playerNameEqualTo(player.playerName)
          .findFirstSync()!
          .copy(
            heart: player.heart,
            isSaved: player.isSaved,
            isSavedOnce: player.isSavedOnce,
            hasGussed: player.hasGussed,
            hasReturned: player.hasReturned,
            disclosured: player.disclosured,
            isReversible: player.isReversible,
          )));

  void updatePlayers(List<Player> players) =>
      isar.writeTxnSync(() => isar.players.putAllSync(players));

  Future<void> deletePlayer(Player player) =>
      isar.writeTxnSync(() => isar.players.delete(player.id!));

  Future<void> deletePlayers(List<Player> players) => isar.writeTxnSync(
      () => isar.players.deleteAll(players.map((e) => e.id!).toList()));

  Future<void> deleteAllPlayers() =>
      isar.writeTxnSync(() => isar.players.deleteAll(
            players.map((e) => e.id!).toList(),
          ));

  Future<List<Player?>> alivePlayers() =>
      isar.players.filter().isAliveEqualTo(true).findAll();

  Future<List<Player?>> deadPlayers() =>
      isar.players.filter().isAliveEqualTo(false).findAll();

  Future<int> alivePlayersCount() =>
      isar.players.filter().isAliveEqualTo(true).count();

  Future<int> deadPlayersCount() =>
      isar.players.filter().isAliveEqualTo(false).count();

  // night choices

  Future<int> updateNightChoices({
    required int night,
    String? mafiasShot,
    String? godfatherChoice,
    String? leonChoice,
    String? kaneChoice,
    String? konstantinChoice,
    String? watsonChoice,
    String? matadorChoice,
    String? saulChoice,
  }) =>
      isar.writeTxnSync(() => isar.nights.put(
            isar.nights
                .filter()
                .nightNumberEqualTo(night)
                .findFirstSync()!
                .copy(
                  godfatherChoice: godfatherChoice,
                  leonChoice: leonChoice,
                  kaneChoice: kaneChoice,
                  konstantinChoice: konstantinChoice,
                  watsonChoice: watsonChoice,
                  matadorChoice: matadorChoice,
                  saulChoice: saulChoice,
                ),
          ));

  Map<String, String> getNightChoices(int night) {
    final Night nightChoices =
        isar.nights.filter().nightNumberEqualTo(night).findFirstSync()!.copy();
    return {
      "mafiasShot": nightChoices.mafiasShot,
      "godfatherChoice": nightChoices.godfatherChoice,
      "leonChoice": nightChoices.leonChoice,
      "kaneChoice": nightChoices.kaneChoice,
      "konstantinChoice": nightChoices.konstantinChoice,
      "watsonChoice": nightChoices.watsonChoice,
      "matadorChoice": nightChoices.matadorChoice,
      "saulChoice": nightChoices.saulChoice,
    };
  }

  // uodate night number
  updateNightNumber(int night) =>
      isar.writeTxnSync(() => isar.nights.put(Night()..nightNumber = night));

  // get night number
  int getNightNumber() =>
      isar.nights.where(distinct: true).findAllSync().last.nightNumber;

  // update night code
  updateNightCode(int nightCode) =>
      isar.writeTxnSync(() => isar.nights.put(Night()..nightCode = nightCode));

  // get night code
  int? getNightCode() =>
      isar.nights.where(distinct: true).findAllSync().last.nightCode;

  // update day number
  updateDayNumber(int day) => isar
      .writeTxnSync(() => isar.gameStatus.put(GameStatus()..dayNumber = day));

  // get day number
  int getDayNumber() =>
      isar.gameStatus.where(distinct: true).findAllSync().last.dayNumber;

  // update inComplete
  updateInComplete(int nightNumber, String inComplete) =>
      isar.writeTxnSync(() => isar.nights
          .filter()
          .nightNumberEqualTo(nightNumber)
          .findFirstSync()!
          .copy(inComplete: inComplete));

  // how to manage which player has done his/her night job
  // and which one has not?
  // and how to differntiate between
  // 1. handcuff and
  // 2. block and
  // 3. has done but still were in his/her night panel
  // 4. were in the night panel but has not done his/her night job
}
