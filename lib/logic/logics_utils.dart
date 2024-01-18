import 'dart:developer' show log;
import 'dart:math' show Random;

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
