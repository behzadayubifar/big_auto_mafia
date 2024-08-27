import 'dart:developer' show log;
import 'dart:math' show Random;

import 'package:auto_mafia/offline/constants/my_strings.dart';
import 'package:auto_mafia/offline/db/entities/player.dart';
import 'package:auto_mafia/offline/db/isar_service.dart';
import 'package:auto_mafia/offline/models/last_moves_dataset.dart';
import 'package:auto_mafia/offline/models/role_datasets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

ProviderContainer _createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );
  return container;
}

final _container = _createContainer();
final Future<IsarService> _isar = _container.read(isarServiceProvider.future);

// a method for generating a unique code and not equal for each player
Set<int> _generateUniqueCode(int max) {
  final random = Random();
  final Set<int> codeSet = {};
  while (codeSet.length < max) {
    codeSet.add(random.nextInt(max) + 1);
  }
  log('codeSet: $codeSet', name: 'generateUniqueCode');
  return codeSet;
}

// a method for assigning random codes to players
Map<String, int> assignRandomCode(List<String> playerNames) {
  final codeSet = _generateUniqueCode(playerNames.length);
  final Map<String, int> codeMap = {};
  for (int i = 0; i < playerNames.length; i++) {
    codeMap[playerNames.elementAt(i)] = codeSet.elementAt(i);
  }
  log('codeMap: $codeMap', name: 'assignRandomCode');
  return codeMap;
}

// a method for assigning random roles to players which firs
// shuffles the role_names and also shuffles the player_names
// and then assigns the roles to players
/// retrun a map of {player_name : role_name}
Map<String, String> assignRandomRole(
    List<String> playerNames, List<String> roleNames) {
  final shuffledPlayerNames = playerNames..shuffle();
  final shuffledRoleNames = roleNames..shuffle();
  final Map<String, String> rolesJson = {};
  for (int i = 0; i < playerNames.length; i++) {
    rolesJson[shuffledPlayerNames[i]] = shuffledRoleNames[i];
  }
  log('rolesJson: $rolesJson', name: 'assignRandomRole');
  return rolesJson;
}

// a method to determine the number of mafia players from db
Future<int> getPlayersCountCountBasedOnType({required RoleType type}) async {
  final isar = await _isar;
  final sideCounts = (await isar.retrievePlayer(
    criteria: (player) => player.type == type,
  ))
      .count;
  log('sideCounts: $sideCounts', name: 'getPlayersCountCountBasedOnType');
  return sideCounts;
}

// a method to determine is the game is over or not
// use this after showing the result widget and before showing the next day (it may be [VICOTRY] or [CHAOS])
/// call this method right after (god method is called and RESULT WIDGET was shown)
Future<String?> determineWinner({required int dayNumber}) async {
  final isar = await _isar;
  String? winner;
  final alivePlayersCount = (await isar.retrievePlayer()).count;
  final mafiaPlayersCount = await getPlayersCountCountBasedOnType(
    type: RoleType.mafia,
  );
  final citizenPlayersCount = await getPlayersCountCountBasedOnType(
    type: RoleType.citizen,
  );
  final otherThanMafiaPlayersCount = alivePlayersCount - mafiaPlayersCount;

  final isGameOver = (alivePlayersCount == 0) ||
      (mafiaPlayersCount == 0) ||
      (citizenPlayersCount == 0) ||
      (mafiaPlayersCount >= otherThanMafiaPlayersCount);
  log('isGameOver: $isGameOver', name: 'isGameOver');

  if (isGameOver) {
    if (citizenPlayersCount == 0 ||
        (mafiaPlayersCount >= otherThanMafiaPlayersCount)) {
      winner = 'مافیا ها';
    } else {
      winner = 'شهروندان';
    }

    log('winner: $winner', name: 'determineWinner');
    await isar.putGameStatus(
        dayNumber: dayNumber, isFinished: true, winner: winner);
  }

/*   if (alivePlayersCount == 3)
    await isar.putGameStatus(isChaos: true, dayNumber: dayNumber);
 */
  return winner;
}

// a method to determine the number of mafia & citizen players
// from a given list of players
Future<({int citizen, int independent, int mafiaPlayersCount})>
    determineMafiaAndCitizenCountFromList({
  required List<String> playerNames,
  bool? isGodfatherCountedForMafia,
}) async {
  final isar = await _isar;
  //
  print('mio2 : $playerNames');
  //
  int citizenPlayersCount = (await isar.retrievePlayer(
    isAlive: isGodfatherCountedForMafia! ? false : true,
    criteria: (player) {
      // print("${player.playerName} : ${player.type == RoleType.citizen}");
      return player.type == RoleType.citizen &&
          playerNames.contains(player.playerName!);
    },
  ))
      .count;

  print('object : $citizenPlayersCount');
  //
  final mafiaPlayersCount = (await isar.retrievePlayer(
    isAlive: isGodfatherCountedForMafia ? false : true,
    criteria: (player) {
      if (player.roleName == roleNames[RoleName.godfather] &&
          playerNames.contains(player.playerName!)) {
        if (isGodfatherCountedForMafia == false) {
          citizenPlayersCount++;
          return false;
        }

        return (isGodfatherCountedForMafia);
      } else {
        return player.type == RoleType.mafia &&
            playerNames.contains(player.playerName!);
      }
    },
  ))
      .count;
  //

  final independentPlayersCount = (await isar.retrievePlayer(
    isAlive: isGodfatherCountedForMafia ? false : true,
    criteria: (player) =>
        player.type == RoleType.independent &&
        playerNames.contains(player.playerName!),
  ))
      .count;
  //
  log('mafiaPlayersCount: $mafiaPlayersCount',
      name: 'determineMafiaAndCitizenCountFromList');
  log('mafiaPlayersCount: $mafiaPlayersCount',
      name: 'determineMafiaAndCitizenCountFromList');
  log('citizenPlayersCount: $citizenPlayersCount',
      name: 'determineMafiaAndCitizenCountFromList');
  //
  final result = (
    mafiaPlayersCount: mafiaPlayersCount,
    citizen: citizenPlayersCount,
    independent: independentPlayersCount
  );
  return result;
}

// a method to assign a last move (which is not in usedLastMoves in collection of gameStatus) to a player
Future<String?> getARandomLastMove() async {
  final isar = await _isar;
  final dayNumber = await isar.getDayNumber();
  final usedLastMoves =
      (await isar.retrieveGameStatusN(n: dayNumber))!.usedLastMoves!;

  final List<String?> shuffledRemainedLastMoves = allLastMoves.keys
      .where((element) => !usedLastMoves.contains(element))
      .toList()
    ..shuffle();
  final randomLastMove = shuffledRemainedLastMoves.firstOrNull;
  log('randomLastMove: $randomLastMove', name: 'getARandomLastMove');
  return randomLastMove;
  // return MyStrings.handCuff;
}

// a method which gets a list of players and returns randomly one of them
String getARandomPlayer(List<String> playerNames) {
  final shuffledPlayerNames = playerNames..shuffle();
  final randomPlayer = shuffledPlayerNames.first;
  log('randomPlayer: $randomPlayer', name: 'getARandomPlayer');
  return randomPlayer;
}

extension PlayersListConversion on Iterable<Player> {
  List<String> mapToNames() => map(
        (Player player) => player.playerName!,
      ).toList();
}

Future<String> winnerOfChaos(List<String> handShakenPlayers) async {
  final isar = await _container.read(isarServiceProvider.future);
  final dayNumber = await isar.getDayNumber();
  String winner = '';
  final rolesTypeOfThem = await isar
      .retrievePlayer(
        criteria: (player) => handShakenPlayers.contains(player.playerName!),
      )
      .then((rec) => rec.players.map((e) => e.type).toList());
  if (rolesTypeOfThem.contains(
    RoleType.mafia,
  )) {
    winner = 'mafias';
  } else {
    winner = 'citizens';
  }
  await isar.putGameStatus(
    dayNumber: dayNumber,
    isFinished: true,
    winner: winner,
  );
  return winner;
}

bool isMafia(String roleName) =>
    roleName == MyStrings.mafia ||
    roleName == MyStrings.saul ||
    roleName == MyStrings.godfather ||
    roleName == MyStrings.matador;

List<String> getRandomPlayersNamesFromList(
  List<String> playerNames,
  int count,
) {
  final shuffledPlayerNames = playerNames..shuffle();
  final randomPlayerNames = shuffledPlayerNames.sublist(0, count);
  log('randomPlayerNames: $randomPlayerNames',
      name: 'getRandomPlayersNamesFromList');
  return randomPlayerNames;
}
