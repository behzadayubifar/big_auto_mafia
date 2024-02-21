import 'dart:developer';
import 'dart:io';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/utils/dev_log.dart';
import 'package:path_provider/path_provider.dart';

import 'package:auto_mafia/db/entities/game_status.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_service.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isarInstance(IsarInstanceRef ref) {
  return IsarService.openDB();
}

@Riverpod(keepAlive: true)
Future<IsarService> isarService(IsarServiceRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  return IsarService(isar);
}

@riverpod
Future<({int count, List<Player> players})> alivePlayers(AlivePlayersRef ref) {
  return ref
      .watch(isarServiceProvider.future)
      .then((value) => value.retrievePlayer(isAlive: true));
}

@riverpod
Future<({int count, List<Player> players})> deadPlayers(
    DeadPlayersRef ref) async {
  final isar = await ref.watch(isarServiceProvider.future);
  return await isar.retrievePlayer(isAlive: false);
}

@riverpod
Future<Either<Map<String, String>, bool>> nightJson(NightJsonRef ref) async {
  final isar = await ref.watch(isarServiceProvider.future);
  final night = await isar.getNightNumber();
  print('night: $night');
  return isar.retrieveNightN(n: night);
}

// a provider for showing current players (based on some criterias / situations)
@riverpod
class CurrentPlayers extends _$CurrentPlayers {
  @override
  FutureOr<List<Player>> build() async {
    state = const AsyncValue.loading();
    log('here in build', name: 'CurrentPlayers');
    // final isar = await ref.watch(isarServiceProvider.future);
    // final players = await isar.retrievePlayer(isAlive: true);
    // await Future.delayed(Duration(seconds: 2));
    // return players.players;
    return Future.sync(() async {
      final isar = await ref.watch(isarServiceProvider.future);
      final situation = MyStrings
          .showRoles; /* await isar
          .retrieveGameStatusN(n: await isar.getDayNumber())
          .then((status) => status?.situation); */
      // Set the state to loading
      state = const AsyncValue.loading();
      await Future.delayed(Duration(seconds: 1));
      // Retrieve the players baesed on the situation
      final y = await AsyncValue.guard(
        () async {
          switch (situation) {
            // situations that need all the alive players
            case MyStrings.nightPage:
            case MyStrings.showRoles:
            case MyStrings.dayPage:
              return await isar
                  .retrievePlayer(isAlive: true)
                  .then((record) => record.players);

            case MyStrings.leonPage:
              return await isar
                  .retrievePlayer(
                    criteria: (player) => player.roleName != MyStrings.leon,
                  )
                  .then((record) => record.players);

            case MyStrings.kanePage:
              return await isar
                  .retrievePlayer(
                    criteria: (player) => player.roleName != MyStrings.kane,
                  )
                  .then((record) => record.players);

            case MyStrings.godfatherPage:
            case MyStrings.saulPage:
              return await isar
                  .retrievePlayer(
                    criteria: (player) => player.type != RoleType.mafia,
                  )
                  .then((record) => record.players);

            case MyStrings.matadorPage:
              final lastNight = await isar.getNightNumber();
              final lastNightOfBlockage =
                  await isar.retrieveNightN(n: lastNight).then(
                        (value) => value.match(
                            (l) => l['nightOfBlockage']!, (r) => 'not found'),
                      );
              final matadorChoice =
                  await isar.retrieveNightN(n: lastNight).then(
                        (value) => value.match(
                            (l) => l['matadorChoice']!, (r) => 'not found'),
                      );
              return await isar.retrievePlayer(
                criteria: (player) {
                  final c1 = player.type != RoleType.mafia;
                  final c2 = matadorChoice == player.playerName &&
                      lastNightOfBlockage == lastNight;
                  return c1 && !c2;
                },
              ).then((record) => record.players);

            case MyStrings.konstantinPage:
              return await isar
                  .retrievePlayer(
                      isAlive: false,
                      criteria: (player) =>
                          player.disclosured != true &&
                          player.isReversible == true)
                  .then((value) => value.players);

            case MyStrings.nightDoneJob:
              return [Player()..playerName = 'default'];

            default:
              return [Player()..playerName = 'default'];
          }
        },
      );
      return y.asData!.value;
      // return [Player()..playerName = 'default'];
    });
  }

  //

  Future<List<Player>?> action(String situation, [String? playerName]) async {
    state = const AsyncValue.loading();
    final isar = await ref.watch(isarServiceProvider.future);
    final tonight = await isar.getNightNumber();
    final playersWhoSawTheirRole = await isar
        .retrieveGameStatusN(n: 0)
        .then((status) => status?.playersWhoSawTheirRole);
    //
    final Player? konstantin = await isar.getPlayerByRole(RoleName.konstantin);
    final Player? kane = await isar.getPlayerByRole(RoleName.kane);
    final Player? leon = await isar.getPlayerByRole(RoleName.leon);
    final Player? mafia = await isar.getPlayerByRole(RoleName.mafia);
    final Player? godfather = await isar.getPlayerByRole(RoleName.godfather);
    final Player? matador = await isar.getPlayerByRole(RoleName.matador);
    final Player? watson = await isar.getPlayerByRole(RoleName.watson);
    final Player? saul = await isar.getPlayerByRole(RoleName.saul);

    //
    // Set the state to loading
    await Future.delayed(Duration(milliseconds: 400));
    List<Player>? extraList = [];
    state = await AsyncValue.guard(
      () async {
        log('here in action');

        if (situation != MyStrings.predictPage) {
          switch (situation) {
            case MyStrings.nightPage:
              final players = await isar
                  .retrievePlayer(
                    criteria: (player) => player.nightDone == false,
                  )
                  .then((value) => value.players);
              return players;

            case MyStrings.showRoles:
              return await isar
                  .retrievePlayer(
                    criteria: (player) =>
                        !playersWhoSawTheirRole!.contains(player.playerName),
                  )
                  .then((value) => value.players);

            case MyStrings.showMyRole:
              return await isar.retrievePlayer().then((value) {
                final player = value.players.firstWhere(
                  (player) => player.playerName == playerName,
                  orElse: () => Player(),
                );
                return [player];
              });

// --- role-panels

            case MyStrings.leonPage:
              if (tonight != 0 &&
                  leon?.handCuffed != true &&
                  leon!.shotCount < 2)
                return await isar
                    .retrievePlayer(
                      criteria: (player) => player.roleName != MyStrings.leon,
                    )
                    .then((record) => record.players);
              return [];

            case MyStrings.kanePage:
              if (tonight != 0 &&
                  kane?.hasGuessed != true &&
                  kane?.handCuffed != true)
                return await isar
                    .retrievePlayer(
                      criteria: (player) => player.roleName != MyStrings.kane,
                    )
                    .then((record) => record.players);
              return [];

            case MyStrings.godfatherPage:
            case MyStrings.mafiaPage:
            case MyStrings.saulPage:
              if (tonight == 0 ||
                  (situation == MyStrings.saulPage &&
                      saul?.handCuffed == true) ||
                  (situation == MyStrings.godfatherPage &&
                      godfather?.handCuffed == true) ||
                  (situation == MyStrings.mafiaPage &&
                      mafia?.handCuffed == true)) return [];

              if (tonight != 0) {
                extraList = await isar
                    .retrievePlayer(
                      criteria: (player) => player.type != RoleType.mafia,
                    )
                    .then((record) => record.players);
                return Future.value(extraList);
              }

              // NEVER REACHED
              print('________________NEVER REACHED_________________');
              return [];

            case MyStrings.matadorPage:
              if (tonight != 0 && matador?.handCuffed != true) {
                final lastNight = await isar.getNightNumber();

                extraList = await isar
                    .retrievePlayer(
                      criteria: (player) => player.type != RoleType.mafia,
                    )
                    .then((record) => record.players);

                final lastNightOfBlockage =
                    await isar.retrieveNightN(n: lastNight).then(
                          (value) => value.match(
                              (l) => l['nightOfBlockage']!, (r) => 'not found'),
                        );
                final matadorChoice =
                    await isar.retrieveNightN(n: lastNight).then(
                          (value) => value.match(
                              (l) => l['matadorChoice']!, (r) => 'not found'),
                        );
                return await isar.retrievePlayer(
                  criteria: (player) {
                    final c1 = player.type != RoleType.mafia;
                    final c2 = player.playerName == matadorChoice &&
                        lastNightOfBlockage == lastNight;
                    return c1 && !c2;
                  },
                ).then((record) => record.players);
              }
              return [];

            case MyStrings.konstantinPage:
              if (tonight != 0 &&
                  konstantin?.hasReturned != true &&
                  konstantin?.handCuffed != true)
                return await isar
                    .retrievePlayer(
                      isAlive: false,
                      criteria: (player) =>
                          player.disclosured != true &&
                          player.isReversible == true,
                    )
                    .then((value) => value.players);
              return [];

            case MyStrings.watsonPage:
              if (tonight != 0 && watson?.handCuffed != true)
                return await isar.retrievePlayer(
                  criteria: (player) {
                    // watson
                    if (player.roleName == MyStrings.watson) {
                      final isNotSavedOnce = !player.isSavedOnce;
                      final c1 = isNotSavedOnce;
                      return c1;
                    }
                    // other players
                    return true;
                  },
                ).then((value) => value.players);
              return [];

            case MyStrings.citizenPage:
              return [];

            case MyStrings.nightDoneJob:
              return [];

            case MyStrings.dayPage:
              print("dayPage --action");
              return await isar.retrievePlayer().then(
                    (value) => value.players,
                  );

            default:
              return [];
          }
        } else {
          // for Nosradamous
          if (situation == MyStrings.predictPage) {
            return await isar.retrievePlayer(
              criteria: (player) {
                if (tonight == 0)
                  return player.roleName != MyStrings.nostradamous;
                return false;
              },
            ).then((value) => value.players);
          } else {
            return [];
          }
        }
      },
    );
    if (extraList != null) return extraList;
  }
}

class IsarService {
  final Isar isar;

  IsarService(this.isar);

  static Future<Isar> openDB() async {
    //ToDo: change the directory to the app directory
    // final dir = await getApplicationDocumentsDirectory();
    // a hardcoded diractory in the root of the device
    // final dir = await Directory('E:/test_directory').create(recursive: true);

    final dir = await getApplicationDocumentsDirectory();
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
    //first of all clear db
    final isCleared = await clearAll();
    await putGameStatus(dayNumber: 0);

    log('isCleared: $isCleared');
    // now init with new records
    await isar.writeTxn(() async => await isar.players.putAll(
          players
              .map(
                (player) => Player.initializeBasedOnRole(player),
              )
              .toList(),
        ));

    // ToDo: remove this part
    // jsut for testing
    final List<Player?> insertedPlayers = (await retrievePlayer()).players;
    if (insertedPlayers.isNotEmpty) {
      for (var player in insertedPlayers) {
        log(player!.playerToString(true), name: 'inserted Players');
      }
    }
  }

  /// output: {roleName: playerName}
  Future<Map<String, String>> playersRolesMap({
    List<String>? playersNames,
  }) async {
    var result = <String, String>{};
    List<Player> players = [];
    if (playersNames != null) {
      for (String playerName in playersNames) {
        final Player? player = await getPlayerByName(playerName);
        if (player != null) {
          players.add(player);
        }
      }
    } else {
      players = await isar.players.where(distinct: true).findAll();
    }
    if (players.isNotEmpty) {
      for (var player in players) {
        result[player.roleName!] = player.playerName!;
      }
    }
    return result;
  }

  Future<Player?> getPlayerByName(String playerName) async =>
      await isar.players.filter().playerNameEqualTo(playerName).findFirst();

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
    int? code,
    RoleType? side,
    bool? silenced,
    String? roleName,
  }) =>
      isar.writeTxn(() async {
        var playerToUpdate = await isar.players
            .filter()
            .playerNameEqualTo(playerName)
            .findFirst();
        if (playerToUpdate != null) {
          print('playerToUpdate: ${playerToUpdate.playerName}');
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
            code: code,
            silenced: silenced,
            whichSideWillWin: side,
            roleName: roleName,
          );
          await isar.players.put(playerToUpdate);
          log('player updated successfully',
              name: 'updatePlayer ${playerName}');
          return true;
        }
        log('player not found', name: 'updatePlayer ${playerName}');
        return false;
      });

// I doubt this works

  Future<List<bool>> updatePlayers(List<Player> players) async {
    final Map<String, bool> result = {};
    result.addEntries(
        players.map((player) => MapEntry(player.playerName!, false)));
    for (var player in players) {
      final bool isUpdated = await updatePlayer(
        playerName: player.playerName!,
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

  // Golden method to retrieve desired player(s)
  Future<({int count, List<Player> players})> retrievePlayer({
    bool isAlive = true,
    bool Function(Player player)? criteria,
  }) async {
    final List<Player> players = await isar.players
        .filter()
        .isAliveEqualTo(isAlive)
        .findAll()
        .then((player) {
      return player
          .where(criteria ?? (_) => true)
          .where((player) => isAlive ? player.heart! > 0 : player.heart == 0)
          .toList();
    });
    final int count = players.length;
    final result = (count: count, players: players);
    return result;
  }

// night choices

  /// alwasys use this only before
  Future<bool> putNight({
    required int night,
    String? mafiasShot,
    String? godfatherChoice,
    String? theRoleGuessedByGodfather,
    String? leonChoice,
    String? kaneChoice,
    String? konstantinChoice,
    String? watsonChoice,
    String? matadorChoice,
    String? nightOfBlockage,
    String? nightOfRightChoiceOfKane,
    List<String>? nostradamousChoices,
    String? saulChoice,
  }) =>
      isar.writeTxn(() async {
        var tonightChoices =
            await isar.nights.filter().nightNumberEqualTo(night).findFirst();
        log('tonightChoices: ${tonightChoices?.toString() ?? 'tonightChoices is null'}',
            name: 'putNightChoices');
        if (tonightChoices != null) {
          await isar.nights.put(tonightChoices.copy(
            mafiasShot: mafiasShot,
            godfatherChoice: godfatherChoice,
            theRoleGuessedByGodfather: theRoleGuessedByGodfather,
            leonChoice: leonChoice,
            kaneChoice: kaneChoice,
            konstantinChoice: konstantinChoice,
            watsonChoice: watsonChoice,
            matadorChoice: matadorChoice,
            nightOfBlockage: nightOfBlockage,
            nostradamousChoices: nostradamousChoices,
            nightOfRightChoiceOfKane: nightOfRightChoiceOfKane,
            saulChoice: saulChoice,
          ));
          log('tonightChoices updated successfully', name: 'putNightChoices');
          return true;
        } else {
          final nightChoices = Night()
            ..nightNumber = night
            ..mafiasShot = mafiasShot ?? ''
            ..godfatherChoice = godfatherChoice ?? ''
            ..theRoleGuessedByGodfather = theRoleGuessedByGodfather ?? ''
            ..leonChoice = leonChoice ?? ''
            ..kaneChoice = kaneChoice ?? ''
            ..nightOfRightChoiceOfKane = nightOfRightChoiceOfKane ?? ''
            ..konstantinChoice = konstantinChoice ?? ''
            ..watsonChoice = watsonChoice ?? ''
            ..matadorChoice = matadorChoice ?? ''
            ..nightOfBlockage = nightOfBlockage ?? ''
            ..nostradamousChoices = nostradamousChoices ?? []
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

  Future<Either<Map<String, String>, bool>> retrieveNightN({
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
          "nightOfBlockage": nightChoices.nightOfBlockage,
          "saulChoice": nightChoices.saulChoice,
          "theRoleGuessedByGodfather": nightChoices.theRoleGuessedByGodfather,
          "nightOfRightChoiceOfKane": nightChoices.nightOfRightChoiceOfKane,
        }));
  }

  Future<GameStatus?> retrieveGameStatusN({
    required int n,
  }) async {
    final gameStatus =
        await isar.gameStatus.filter().dayNumberEqualTo(n).findFirst();

    if (gameStatus != null) {
      log('game status found : ${gameStatus.toString()}',
          name: 'retrieveGameStatusN');
      return gameStatus;
    }
    log('game status not found', name: 'retrieveGameStatusN');
    return null;
  }

  /// get night number
  Future<int> getNightNumber() async {
    final nightLists = await isar.nights.where(distinct: true).findAll();
    if (nightLists.isNotEmpty) {
      final nightNumber = nightLists.last.nightNumber;
      log('night number is $nightNumber', name: 'getNightNumber');
      return nightNumber;
    }
    log('night number is 0', name: 'getNightNumber for the first time');
    return -1;
  }

  // /// update night code
  // updateNightCode(int nightCode) =>
  //     isar.writeTxnSync(() => isar.nights.put(Night()..nightCode = nightCode));

  // /// get night code
  // Future<int?> getNightCode() async {
  //   final code = isar.nights.where(distinct: true).findAllSync().last.nightCode;
  //   log('night code is $code', name: 'getNightCode');
  //   return code;
  // }

  /// get day number
  Future<int> getDayNumber() async {
    final gameStatus = await isar.gameStatus.where(distinct: true).findFirst();
    if (gameStatus != null) {
      final dayNumber = gameStatus.dayNumber;
      log('day number is $dayNumber', name: 'getDayNumber');
      return dayNumber;
    }
    log('day number is 0', name: 'getDayNumber for the first time');
    return 0;
  }

  /// implementaion of the game status must be somehow that it's always single
  Future<bool> putGameStatus({
    required int dayNumber,
    bool? isDay = false,
    int? wholeGameTimePassed,
    List<String>? timeLeft,
    int? nightCode,
    bool? isFinished,
    String? winner,
    bool? isChaos,
    String? statusOfGame,
    String? situation,
    List<String>? playersWhoSawTheirRole,
    int? remainedMafiasBullets,
    int? remainedChancesForNightEnquiry,
    List<String?>? usedLastMoves,
  }) async {
    // the only game status for all the game
    final alreadyExists = await isar.gameStatus.where().findFirst();
    log('alreadyExists: ${alreadyExists.toString()}', name: 'insertGameStatus');

    // inserting new status
    if (alreadyExists == null) {
      final gameStatus = GameStatus();
      final newGameStatus = gameStatus.copy(
        isDay: isDay,
        statusOfGame: statusOfGame,
        dayNumber: dayNumber,
        wholeGameTimePassed: wholeGameTimePassed,
        playersWhoSawTheirRole: playersWhoSawTheirRole,
        timeLeft: timeLeft,
        nightCode: nightCode,
        isFinished: isFinished,
        winner: winner,
        isChaos: isChaos,
        situation: situation,
        remainedMafiasBullets: remainedMafiasBullets,
        usedLastMoves: usedLastMoves,
        remainedChancesForNightEnquiry: remainedChancesForNightEnquiry,
      );

      await isar.writeTxn(() => isar.gameStatus.put(newGameStatus));
      return true;
    }
    // game status already exists
    else {
      await isar.writeTxn(() => isar.gameStatus.put(alreadyExists.copy(
            dayNumber: dayNumber,
            isDay: isDay,
            wholeGameTimePassed: wholeGameTimePassed,
            timeLeft: timeLeft,
            nightCode: nightCode,
            isFinished: isFinished,
            winner: winner,
            isChaos: isChaos,
            statusOfGame: statusOfGame,
            situation: situation,
            playersWhoSawTheirRole: playersWhoSawTheirRole,
            remainedMafiasBullets: remainedMafiasBullets,
            usedLastMoves: usedLastMoves,
            remainedChancesForNightEnquiry: remainedChancesForNightEnquiry,
          )));

      log('game status *updated* successfully', name: 'insertGameStatus');
      return true;
    }
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

  // a method for kicking out a player from the game -> his/her heart must be 0
  Future<bool> kickOutPlayer(String playerName) {
    return updatePlayer(playerName: playerName, heart: 0);
  }

// {name : code}
  Future<Map<String, int>> retrieveAssignedCodes() async {
    final players = await isar.players.where(distinct: true).findAll();
    final Map<String, int> result = {};
    for (var player in players) {
      result[player.playerName!] = player.code!;
    }
    return result;
  }
}
// how to manage which player has done his/her night job
// and which one has not?
// and how to differntiate between` timeLeft` and `nightDone`?
// | [timeLeft] in Night table |
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
