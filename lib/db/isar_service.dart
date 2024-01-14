import 'dart:developer';
import 'dart:io';

import 'package:auto_mafia/db/entities/game_status.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:fpdart/fpdart.dart';
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

@riverpod
Future<Either<Map<String, String>, bool>> nightJson(NightJsonRef ref) async {
  final isar = await ref.watch(isarServiceProvider.future);
  final night = await isar.getNightNumber();
  print('night: $night');
  return isar.getNightChoicesOfNightN(n: night);
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

  // close the database
  Future<void> close() async => await isar.close();

  /// initialize players `isar.writeTxnSync(() => isar.players.putAllSync(players));`
  Future<void> initializePlayers(List<Map<String, String>> players) async {
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

// output: {roleName: playerName}
  Future<Map<String, String>> getAllPlayers() async {
    var result = <String, String>{};
    final players = await isar.players.where(distinct: true).findAll();
    if (players.isNotEmpty) {
      for (var player in players) {
        result[player.roleName!] = player.playerName!;
      }
    }
    return result;
  }

  Future<Player?> getPlayerByName(String playerName) =>
      isar.players.filter().playerNameEqualTo(playerName).findFirst();

  Future<Player?> getPlayerByRole(RoleName roleName) =>
      isar.players.filter().roleNameEqualTo(roleNames[roleName]!).findFirst();

  Future<bool> updatePlayer({
    required String playerName,
    bool? isBlocked,
    bool? isSaved,
    bool? isSavedOnce,
    bool? handCuffed,
    bool? hasGuessed,
    bool? hasBeenSlaughtered,
    bool? hasBuyed,
    bool? nightDone,
    bool? disclosured,
    bool? isReversible,
    bool? hasReturned,
    int? heart,
    int? shotCount,
    RoleType? side,
  }) =>
      isar.writeTxn(() async {
        var playerToUpdate = await isar.players
            .filter()
            .playerNameEqualTo(playerName)
            .findFirst();
        if (playerToUpdate != null) {
          print('playerToUpdate: ${playerToUpdate.playerName}');
          print('new heart must be $heart');
          playerToUpdate = playerToUpdate.copy(
            isBlocked: isBlocked,
            isSaved: isSaved,
            isSavedOnce: isSavedOnce,
            handCuffed: handCuffed,
            hasGuessed: hasGuessed,
            hasBeenSlaughtered: hasBeenSlaughtered,
            hasBuyed: hasBuyed,
            nightDone: nightDone,
            disclosured: disclosured,
            isReversible: isReversible,
            hasReturned: hasReturned,
            heart: heart,
            shotCount: shotCount,
            whichSideWillWin: side,
          );
          await isar.players.put(playerToUpdate);
          log('player updated successfully',
              name: 'updatePlayer ${playerName}');
          return true;
        }
        log('player not found', name: 'updatePlayer ${playerName}');
        return false;
      });

  Future<List<bool>> updatePlayers(
    List<Player> players, {
    bool? isBlocked,
    bool? isSaved,
    bool? isSavedOnce,
    bool? handCuffed,
    bool? hasGuessed,
    bool? hasBeenSlaughtered,
    bool? hasBuyed,
    bool? nightDone,
    bool? disclosured,
    bool? isReversible,
    bool? hasReturned,
    int? heart,
    int? shotCount,
    RoleType? side,
  }) async {
    final Map<String, bool> result = {};
    result.addEntries(
        players.map((player) => MapEntry(player.playerName!, false)));
    for (var player in players) {
      final bool isUpdated = await updatePlayer(
        playerName: player.playerName!,
        isBlocked: isBlocked,
        isSaved: isSaved,
        isSavedOnce: isSavedOnce,
        handCuffed: handCuffed,
        hasGuessed: hasGuessed,
        hasBeenSlaughtered: hasBeenSlaughtered,
        hasBuyed: hasBuyed,
        nightDone: nightDone,
        disclosured: disclosured,
        isReversible: isReversible,
        hasReturned: hasReturned,
        heart: heart,
        shotCount: shotCount,
        side: side,
      );
      result.update(player.playerName!, (value) => isUpdated);
    }
    return result.values.toList();
  }

  Future<bool> deletePlayer(String playerName) async {
    final playerToDelete = await getPlayerByName(playerName);
    if (playerToDelete != null) {
      bool isDeleted =
          await isar.writeTxn(() => isar.players.delete(playerToDelete.id!));

      if (isDeleted) {
        log('player $playerName deleted successfully', name: 'deleting Player');
        return true;
      }
    } else {
      log('player not found', name: 'deletePlayer');
      return false;
    }
    log('player not found', name: 'deletePlayer');
    return false;
  }

  Future<void> deletePlayers(List<String> playersNames) async {
    for (String playerName in playersNames) {
      if (await isAPlayer(playerName)) {
        deletePlayer(playerName);
        log('player $playerName deleted successfully', name: 'deletePlayers');
      }
    }
  }

  /// check if a player exists in the database
  /// return true if the player exists
  Future<bool> isAPlayer(String playerName) async {
    final player = await getPlayerByName(playerName);
    if (player != null) {
      log('player $playerName found', name: 'isAPlayer');
      return true;
    }
    return false;
  }

  Future<void> clearPlayers() async =>
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

  /// alwasys use this only before
  Future<bool> putNightChoices({
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
      isar.writeTxn(() async {
        var tonightChoices =
            await isar.nights.filter().nightNumberEqualTo(night).findFirst();
        log('tonightChoices: ${tonightChoices?.toString() ?? 'tonightChoices is null'}',
            name: 'putNightChoices');
        if (tonightChoices != null) {
          tonightChoices.mafiasShot = mafiasShot ?? tonightChoices.mafiasShot;
          tonightChoices.watsonChoice =
              watsonChoice ?? tonightChoices.watsonChoice;
          tonightChoices.godfatherChoice =
              godfatherChoice ?? tonightChoices.godfatherChoice;
          tonightChoices.leonChoice = leonChoice ?? tonightChoices.leonChoice;
          tonightChoices.kaneChoice = kaneChoice ?? tonightChoices.kaneChoice;
          tonightChoices.konstantinChoice =
              konstantinChoice ?? tonightChoices.konstantinChoice;
          tonightChoices.matadorChoice =
              matadorChoice ?? tonightChoices.matadorChoice;
          tonightChoices.saulChoice = saulChoice ?? tonightChoices.saulChoice;

          await isar.nights.put(tonightChoices);
          log('tonightChoices updated successfully', name: 'putNightChoices');
          return true;
        } else {
          final nightChoices = Night()
            ..nightNumber = night
            ..mafiasShot = mafiasShot ?? ''
            ..godfatherChoice = godfatherChoice ?? ''
            ..leonChoice = leonChoice ?? ''
            ..kaneChoice = kaneChoice ?? ''
            ..konstantinChoice = konstantinChoice ?? ''
            ..watsonChoice = watsonChoice ?? ''
            ..matadorChoice = matadorChoice ?? ''
            ..saulChoice = saulChoice ?? '';
          final int id = await isar.nights.put(nightChoices);
          if (id != 0) {
            log('tonightChoices inserted successfully',
                name: 'putNightChoices');
            return true;
          }
        }
        log('tonightChoices not found', name: 'putNightChoices');
        return false;
      });

  // isar.nights.put(
  //   nightChoices.copy(
  //     mafiasShot: mafiasShot,
  //     godfatherChoice: godfatherChoice,
  //     leonChoice: leonChoice,
  //     kaneChoice: kaneChoice,
  //     konstantinChoice: konstantinChoice,
  //     watsonChoice: watsonChoice,
  //     matadorChoice: matadorChoice,
  //     saulChoice: saulChoice,
  //   ),
  // ),

  Future<Either<Map<String, String>, bool>> getNightChoicesOfNightN({
    required int n,
  }) async {
    final Night? nightChoices =
        await isar.nights.filter().nightNumberEqualTo(n).findFirst();

    if (nightChoices == null) {
      return Future.sync(() => Either.right(false));
    }

    return Future.sync(() => Either.left({
          "mafiasShot": nightChoices.mafiasShot,
          "godfatherChoice": nightChoices.godfatherChoice,
          "leonChoice": nightChoices.leonChoice,
          "kaneChoice": nightChoices.kaneChoice,
          "konstantinChoice": nightChoices.konstantinChoice,
          "watsonChoice": nightChoices.watsonChoice,
          "matadorChoice": nightChoices.matadorChoice,
          "saulChoice": nightChoices.saulChoice,
        }));
  }

  /// add new night number to the database
  updateNightNumber(int night) =>
      isar.writeTxnSync(() => isar.nights.put(Night()..nightNumber = night));

  /// get night number
  Future<int> getNightNumber() async {
    final night = await isar.nights.where(distinct: true).findAll();
    if (night.isNotEmpty) {
      final nightNumber = night.last.nightNumber;
      log('night number is $nightNumber', name: 'getNightNumber');
      return nightNumber;
    }
    log('night number is 0', name: 'getNightNumber for the first time');
    return 0;
  }

  /// update night code
  updateNightCode(int nightCode) =>
      isar.writeTxnSync(() => isar.nights.put(Night()..nightCode = nightCode));

  /// get night code
  Future<int?> getNightCode() async {
    final code = isar.nights.where(distinct: true).findAllSync().last.nightCode;
    log('night code is $code', name: 'getNightCode');
    return code;
  }

//TODO: remove updateNumber method because putGameStatus method is enough
  /// update day number
  updateDayNumber(int day) =>
      isar.writeTxn(() => isar.gameStatus.put(GameStatus()..dayNumber = day));

  /// get day number
  Future<int> getDayNumber() async {
    final day = await isar.gameStatus.where(distinct: true).findAll();
    if (day.isNotEmpty) {
      final dayNumber = day.last.dayNumber;
      log('day number is $dayNumber', name: 'getDayNumber');
      return dayNumber;
    }
    log('day number is 0', name: 'getDayNumber for the first time');
    return 0;
  }

  Future<bool> putGameStatus({
    required int dayNumber,
    bool isDay = false,
    int? wholeGameTimePassed,
    List<String>? timeLeft,
    int? nightCode,
  }) async {
    final alreadyExists =
        await isar.gameStatus.filter().dayNumberEqualTo(dayNumber).findFirst();
    log('alreadyExists: ${alreadyExists.toString()}', name: 'insertGameStatus');
    if (alreadyExists == null) {
      final gameStatus = GameStatus()
        ..dayNumber = dayNumber
        ..isDay = isDay
        ..wholeGameTimePassed = wholeGameTimePassed
        ..timeLeft = timeLeft
        ..nightCode = nightCode;
      final int id = await isar.writeTxn(() => isar.gameStatus.put(gameStatus));
      if (id != 0) {
        log('game status *inserted* successfully', name: 'insertGameStatus');
        return true;
      }
    }
    // game status already exists
    else {
      final int id =
          await isar.writeTxn(() => isar.gameStatus.put(alreadyExists.copy(
                isDay: isDay,
                wholeGameTimePassed: wholeGameTimePassed,
                timeLeft: timeLeft,
                nightCode: nightCode,
              )));
      if (id != 0) {
        log('game status *updated* successfully', name: 'insertGameStatus');
        return true;
      }
    }
    return false;
  }

  /// delete all game status
  Future<bool> clearGameStatus() async {
    final gameStatus = await isar.gameStatus.where(distinct: true).findAll();
    if (gameStatus.isNotEmpty) {
      isar.writeTxn(() => isar.gameStatus.clear());
      log('game status deleted successfully', name: 'deleteGameStatus');
      return true;
    }
    log('game status clearing failed', name: 'deleteGameStatus');
    return false;
  }

  /// delete all nights
  Future<bool> clearNights() async {
    // is there any night in the database?
    final nights = await isar.nights.where(distinct: true).findAll();
    if (nights.isNotEmpty) {
      isar.writeTxn(() => isar.nights.clear());
      log('nights deleted successfully', name: 'deleteNights');
      return true;
    }
    log('nights clearing failed', name: 'deleteNights');
    return false;
  }

// delete all data
  Future<bool> clearAll() async {
    try {
      await isar.writeTxn(() {
        isar.nights.clear();
        isar.gameStatus.clear();
        isar.players.clear();
        log('all data deleted successfully', name: 'deleteAll');
        return Future.value();
      });
      return true;
    } catch (_) {
      log('all data clearing failed', name: 'deleteAll');
      return false;
    }
  }

  /// update game status
  // Future<bool> updateGameStatus({
  //   required int dayNumber,
  //   bool? isDay,
  //   int? wholeGameTimePassed,
  //   List<String>? timeLeft,
  //   int? nightCode,
  // }) =>
  //     isar.writeTxn(() async {
  //       final gameStatus = await isar.gameStatus
  //           .filter()
  //           .dayNumberEqualTo(dayNumber)
  //           .findFirst();
  //       if (gameStatus != null) {
  //         isar.gameStatus.put(gameStatus.copy(
  //           isDay: isDay,
  //           wholeGameTimePassed: wholeGameTimePassed,
  //           timeLeft: timeLeft,
  //           nightCode: nightCode,
  //         ));
  //         log('game status updated successfully', name: 'updateGameStatus');
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
