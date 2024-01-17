import 'package:auto_mafia/models/role_datasets.dart';
import 'package:isar/isar.dart';

part 'player.g.dart';

@Collection()
class Player {
  Player();
  Id? id;
  // night filed that is equal to the night number that is in night collection
  String? playerName;
  String? roleName;
  String? description;
  @Enumerated(EnumType.ordinal32)
  RoleType? type;
  int? heart;
  int? code;
  // default = null |
  // true = isBlocked and night code must set to this player's code |
  // whenever the game is going to night, this player's isBlocked will be set
  // to false if it was true
  // or to null if it was false
  // now protocol for matadar: if a player is chosen by matador, his/her isBlocked will be set to true
  // and if isBlocked is false, it means that the player was chosen by matador last night
  // and if isBlocked is null, it means that the player was not chosen by matador last night and can be chosen again
  bool? isBlocked;
  bool? handCuffed;
  bool? isReversible = true;
  bool? isSaved = false;
  bool? disclosured = false;
  // going to day : set to false -for all players-
  bool? nightDone = false;
  // watson-specific
  bool isSavedOnce = false;
  // leon-specific & mafia-specific
  int shotCount = 0;
  // kane-specific
  bool hasGuessed = false;
  // konstantin-specific
  bool hasReturned = false;
  // nostradamous-specific
  @Enumerated(EnumType.ordinal32)
  RoleType? whichSideWillWin;
  // saul-specific
  bool? hasBuyed;
  //
  bool? hasBeenSlaughtered;

  // a method for copying a player
  Player copy({
    String? playerName,
    String? roleName,
    String? description,
    RoleType? type,
    int? heart,
    int? code,
    bool? isBlocked,
    bool? handCuffed,
    bool? isReversible,
    bool? isSaved,
    bool? disclosured,
    bool? nightDone,
    bool? isSavedOnce,
    int? shotCount,
    bool? hasGuessed,
    bool? hasReturned,
    RoleType? whichSideWillWin,
    bool? hasBuyed,
    bool? hasBeenSlaughtered,
  }) {
    // return the same instance of player but with new values
    return this
      ..playerName = playerName ?? this.playerName
      ..roleName = roleName ?? this.roleName
      ..description = description ?? this.description
      ..type = type ?? this.type
      ..heart = heart ?? this.heart
      ..code = code ?? this.code
      ..isBlocked = isBlocked ?? this.isBlocked
      ..handCuffed = handCuffed ?? this.handCuffed
      ..isReversible = isReversible ?? this.isReversible
      ..isSaved = isSaved ?? this.isSaved
      ..disclosured = disclosured ?? this.disclosured
      ..nightDone = nightDone ?? this.nightDone
      ..isSavedOnce = isSavedOnce ?? this.isSavedOnce
      ..shotCount = shotCount ?? this.shotCount
      ..hasGuessed = hasGuessed ?? this.hasGuessed
      ..hasReturned = hasReturned ?? this.hasReturned
      ..whichSideWillWin = whichSideWillWin ?? this.whichSideWillWin
      ..hasBuyed = hasBuyed ?? this.hasBuyed
      ..hasBeenSlaughtered = hasBeenSlaughtered ?? this.hasBeenSlaughtered;
  }

// use this method for creating a player in isar.services in a loop (that method which has loop in it will take a [*list<Map<String PlayerName, RoleName roleName>>*] and will create them in isar)
// name and assigned role will be passed to this method from ui and will be saved in isar
  factory Player.initializeBasedOnRole(Map<String, String> map) {
    switch (map.values.single) {
      case 'citizen':
        return Player()
          ..playerName = map.keys.single
          ..roleName = allRoles[RoleName.citizen]!["roleName"]
          ..description = allRoles[RoleName.citizen]!["description"]
          ..type = allRoles[RoleName.citizen]!["type"]
          ..heart = allRoles[RoleName.citizen]!["heart"];
      case 'godfather':
        return Player()
          ..playerName = map.keys.single
          ..roleName = allRoles[RoleName.godfather]!['roleName']
          ..description = allRoles[RoleName.godfather]!['description']
          ..type = allRoles[RoleName.godfather]!['type']
          ..heart = allRoles[RoleName.godfather]!['heart'];
      case 'watson':
        return Player()
          ..playerName = map.keys.single
          ..roleName = allRoles[RoleName.watson]!['roleName']
          ..description = allRoles[RoleName.watson]!['description']
          ..type = allRoles[RoleName.watson]!['type']
          ..heart = allRoles[RoleName.watson]!['heart'];
      case 'leon':
        return Player()
          ..playerName = map.keys.single
          ..roleName = allRoles[RoleName.leon]!['roleName']
          ..description = allRoles[RoleName.leon]!['description']
          ..type = allRoles[RoleName.leon]!['type']
          ..heart = allRoles[RoleName.leon]!['heart'];
      case 'kane':
        return Player()
          ..playerName = map.keys.single
          ..roleName = allRoles[RoleName.kane]!['roleName']
          ..description = allRoles[RoleName.kane]!['description']
          ..type = allRoles[RoleName.kane]!['type']
          ..heart = allRoles[RoleName.kane]!['heart'];
      case 'konstantin':
        return Player()
          ..playerName = map.keys.single
          ..roleName = allRoles[RoleName.konstantin]!['roleName']
          ..description = allRoles[RoleName.konstantin]!['description']
          ..type = allRoles[RoleName.konstantin]!['type']
          ..heart = allRoles[RoleName.konstantin]!['heart'];
      case 'nostradamous':
        return Player()
          ..playerName = map.keys.single
          ..roleName = allRoles[RoleName.nostradamous]!['roleName']
          ..description = allRoles[RoleName.nostradamous]!['description']
          ..type = allRoles[RoleName.nostradamous]!['type']
          ..heart = allRoles[RoleName.nostradamous]!['heart'];
      case 'saul':
        return Player()
          ..playerName = map.keys.single
          ..roleName = allRoles[RoleName.saul]!['roleName']
          ..description = allRoles[RoleName.saul]!['description']
          ..type = allRoles[RoleName.saul]!['type']
          ..heart = allRoles[RoleName.saul]!['heart'];
      case 'matador':
        return Player()
          ..playerName = map.keys.single
          ..roleName = allRoles[RoleName.matador]!['roleName']
          ..description = allRoles[RoleName.matador]!['description']
          ..type = allRoles[RoleName.matador]!['type']
          ..heart = allRoles[RoleName.matador]!['heart'];

      default:
        return Player();
    }
  }

  // override toString method for Player

  String playerToString(bool brief) {
    if (brief) {
      return "PlayerName: $playerName, RoleName: $roleName, Type: $type, Heart: $heart";
    }
    return "playerName: $playerName \nroleName: $roleName \ndescription: $description \ntype: $type \nheart: $heart \ncode: $code \nisBlocked: $isBlocked \nhandCuffed: $handCuffed \nisReversible: $isReversible \nisSaved: $isSaved \ndisclosured: $disclosured \nnightDone: $nightDone \nisSavedOnce: $isSavedOnce \nshotCount: $shotCount \nhasGussed: $hasGuessed \nhasReturned: $hasReturned \nwhichSideWillWin: $whichSideWillWin \nhasBuyed: $hasBuyed \nhasBeenSlaughtered: $hasBeenSlaughtered";
  }

  // a getter for checking alive players (whose hearts are not 0)
  bool get isAlive => heart != 0;

  // a getter for retrieving dead players (whose hearts are 0)
  bool get isDead => heart == 0;

  // for finding sides & roles of players ------------------------------------

  // a getter for checking if a player is a citizen
  bool get isInCitizenSide => type == RoleType.citizen;

  // a getter for checking if a player is a mafia
  bool get isInMafiaSide => type == RoleType.mafia;

  // a getter for checking if a player is not a mafia
  bool get isNotInMafiaSide => type != RoleType.mafia;

  // a getter for checking if a player is a watson
  bool get isWatson => roleName == roleNames[RoleName.watson]!;

  // a getter for checking if a player is a leon
  bool get isLeon => roleName == allRoles[RoleName.leon]!['roleName'];

  // a getter for checking if a player is a kane
  bool get isKane => roleName == allRoles[RoleName.kane]!['roleName'];

  // a getter for checking if a player is a konstantin
  bool get isKonstantin =>
      roleName == allRoles[RoleName.konstantin]!['roleName'];

  // a getter for checking if a player is a nostradamous
  bool get isNostradamous =>
      roleName == allRoles[RoleName.nostradamous]!['roleName'];

  // a getter for checking if a player is a citizen
  bool get isCitizen => type == RoleType.citizen;

  // a getter for checking if a player is a saul
  bool get isSaul => roleName == allRoles[RoleName.saul]!['roleName'];

  // a getter for checking if a player is a matador
  bool get isMatador => roleName == allRoles[RoleName.matador]!['roleName'];

  // a getter for checking if a player is a godfather
  bool get isGodfather => roleName == allRoles[RoleName.godfather]!['roleName'];

  // a getter for checking if a player is slaughtered
  bool get isSlaughtered => hasBeenSlaughtered == true;

  // **************************************************************************** ------------------------------------
}
