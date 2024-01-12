import 'dart:developer';
import 'dart:io';

import 'package:auto_mafia/db/entities/game_status.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';
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
  Future<void> initializePlayers(List<Map<String, RoleName>> players) async {
    isar.writeTxn(() => isar.players.putAll(
          players
              .map((player) => Player.initializeBasedOnRole(player))
              .toList(),
        ));

    // ToDo: remove this part
    // jsut for testing
    final List<Player?> insertedPlayers = await alivePlayers();
    if (insertedPlayers.isNotEmpty) {
      for (var player in insertedPlayers) {
        log(player!.playerToString(true), name: 'inserted Players');
      }
    }
  }

  Future<List<Player>> getAllPlayers() =>
      isar.players.where(distinct: true).findAll();

  Future<Player?> getPlayerByName(String playerName) =>
      isar.players.filter().playerNameEqualTo(playerName).findFirst();

  Future<Player?> getPlayerByRole(RoleName roleName) =>
      isar.players.filter().roleNameEqualTo(roleNames[roleName]!).findFirst();

  Future<void> updatePlayer(Player player) =>
      isar.writeTxnSync(() => isar.players.put(isar.players
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

  Future<void> updatePlayers(List<Player> players) async =>
      isar.writeTxnSync(() => isar.players.putAllSync(players));

  Future<String?> deletePlayer(String playerName) async {
    final playerToDelete = await getPlayerByName(playerName);
    if (playerToDelete != null) {
      bool isDeleted =
          await isar.writeTxn(() => isar.players.delete(playerToDelete.id!));
      // ToDo: remove this part
      // jsut for testing
      if (isDeleted) {
        log('player deleted', name: 'deletePlayer');
        return playerToDelete.playerName;
      }
    } else {
      log('player not found', name: 'deletePlayer');
    }
    return null;
  }

  Future<void> deletePlayers(List<Player> players) async {
    final playersToDelete = await isar.writeTxnSync(
        () => isar.players.deleteAll(players.map((e) => e.id!).toList()));
  }

  Future<void> deleteAllPlayers() async =>
      isar.writeTxn(() => isar.players.clear());
  //isar.writeTxnSync(() => isar.players.deleteAll());

  Future<List<Player?>> alivePlayers() async =>
      isar.players.filter().isAliveEqualTo(true).findAll();

  Future<List<Player?>> deadPlayers() =>
      isar.players.filter().isAliveEqualTo(false).findAll();

  Future<int> alivePlayersCount() =>
      isar.writeTxn(() => isar.players.filter().isAliveEqualTo(true).count());

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
  Future<int?> getNightCode() async {
    final code = isar.nights.where(distinct: true).findAllSync().last.nightCode;
    print(code);
    return code;
  }

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

  // update game status
  updateGameStatus({
    required int dayNumber,
    bool? isDay,
    int? wholeGameTimePassed,
    List<String>? timeLeft,
    int? nightCode,
  }) =>
      isar.writeTxn(() async {
        final gameStatus = await isar.gameStatus
            .filter()
            .dayNumberEqualTo(dayNumber)
            .findFirst();
        if (gameStatus != null) {
          isar.gameStatus.put(gameStatus.copy(
            isDay: isDay,
            wholeGameTimePassed: wholeGameTimePassed,
            timeLeft: timeLeft,
            nightCode: nightCode,
          ));
        }
      });
}

  // how to manage which player has done his/her night job
  // and which one has not?
  // and how to differntiate between
  // | [timeLeft] in Night table |/
  // timeLeft determines whether the player has done his/her night job or not
  // (and still were in role panel) here is how it works:
  //  | if (timeLeft[0] == '') then it must show list of players who has not done their night's jobs yet|
  //  | if (timeLeft[0] != '') then it must show the role panel of the player who has not done (or mabe done it is determined in next layer) his/her night's job yet|
  // 1. handcuff and -> in day before next night, make [handCuffed = true]
  // 2. block and -> not important to determine !!!
  // 3. has done but still were in his/her night panel
  //  -> [set the nightDone of player to true]
  //     if (nightDone == true && timeLeft != 0) then the player has done his/her night job
  //     but stil were in the role panel
  // 4. were in the night panel but has not done his/her night job
  //  -> if (nightDone == false && timeLeft != 0) then the player has not done his/her night job
  //     but still were in role panel

