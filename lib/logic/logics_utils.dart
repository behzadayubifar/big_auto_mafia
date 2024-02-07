import 'dart:developer' show log;
import 'dart:math' show Random;

import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/models/role_datasets.dart';
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
Map<String, int> assignRandomCode(Iterable<String> playerNames) {
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
  late final String? winner;
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
    if (mafiaPlayersCount == 0) {
      winner = 'citizens';
    } else if (citizenPlayersCount == 0) {
      winner = 'mafias';
    } else if (mafiaPlayersCount >= otherThanMafiaPlayersCount) {
      winner = 'mafias';
    } else {
      winner = 'citizens';
    }

    log('winner: $winner', name: 'determineWinner');
    isar.putGameStatus(dayNumber: dayNumber, isFinished: true, winner: winner);
  }

  if (alivePlayersCount == 3)
    isar.putGameStatus(isChaos: true, dayNumber: dayNumber);

  return null;
}

// a method to determine the number of mafia & citizen players
// from a given list of players
Future<(int mafia, int citizen)> determineMafiaAndCitizenCountFromList(
  List<String> playerNames,
) async {
  final isar = await _isar;
  //
  final mafiaPlayersCount = (await isar.retrievePlayer(
    criteria: (player) => player.type == RoleType.mafia,
  ))
      .count;
  //
  final citizenPlayersCount = (await isar.retrievePlayer(
    criteria: (player) => player.type == RoleType.citizen,
  ))
      .count;
  //
  log('mafiaPlayersCount: $mafiaPlayersCount',
      name: 'determineMafiaAndCitizenCountFromList');
  log('citizenPlayersCount: $citizenPlayersCount',
      name: 'determineMafiaAndCitizenCountFromList');
  //
  return (mafiaPlayersCount, citizenPlayersCount);
}
