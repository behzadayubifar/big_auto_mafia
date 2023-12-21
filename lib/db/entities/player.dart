import 'package:auto_mafia/models/role_datasets.dart';
import 'package:isar/isar.dart';

part 'player.g.dart';

@Collection()
class Player {
  Player();
  Id? id;
  String? playerName;
  String? roleName;
  String? description;
  @Enumerated(EnumType.ordinal32)
  RoleType? type;
  int? heart;
  int? code;
  bool isBlocked = false;
  bool handCuffed = false;
  bool isReversible = true;
  bool isSaved = false;
  bool isShot = false;
  bool disclosured = false;
  bool nightDone = false;
  // watson-specific
  bool isSavedOnce = false;
  // leon-specific
  int shotCount = 0;
  // kane-specific
  bool hasGussed = false;
  // konstantin-specific
  bool hasReturned = false;
  // nostradamous-specific
  @Enumerated(EnumType.ordinal32)
  RoleType? whichSideWillWin;
  // saul-specific
  bool? hasBuyed;

// use this method for creating a player in isar.services in a loop (that method which has loop in it will take a [*list<Map<String PlayerName, RoleName roleName>>*] and will create them in isar)
// name and assigned role will be passed to this method from ui and will be saved in isar
  factory Player.initializeBasedOnRole(Map<String, RoleName> map) {
    switch (map.values.first) {
      case RoleName.citizen:
        return Player()
          ..roleName = allRoles[RoleName.citizen]!.name
          ..description = allRoles[RoleName.citizen]!.description
          ..type = allRoles[RoleName.citizen]!.type
          ..heart = allRoles[RoleName.citizen]!.heart;
      case RoleName.godfather:
        return Player()
          ..roleName = allRoles[RoleName.godfather]!.name
          ..description = allRoles[RoleName.godfather]!.description
          ..type = allRoles[RoleName.godfather]!.type
          ..heart = allRoles[RoleName.godfather]!.heart;
      case RoleName.watson:
        return Player()
          ..roleName = allRoles[RoleName.watson]!.name
          ..description = allRoles[RoleName.watson]!.description
          ..type = allRoles[RoleName.watson]!.type
          ..heart = allRoles[RoleName.watson]!.heart;
      case RoleName.leon:
        return Player()
          ..roleName = allRoles[RoleName.leon]!.name
          ..description = allRoles[RoleName.leon]!.description
          ..type = allRoles[RoleName.leon]!.type
          ..heart = allRoles[RoleName.leon]!.heart;
      case RoleName.kane:
        return Player()
          ..roleName = allRoles[RoleName.kane]!.name
          ..description = allRoles[RoleName.kane]!.description
          ..type = allRoles[RoleName.kane]!.type
          ..heart = allRoles[RoleName.kane]!.heart;
      case RoleName.konstantin:
        return Player()
          ..roleName = allRoles[RoleName.konstantin]!.name
          ..description = allRoles[RoleName.konstantin]!.description
          ..type = allRoles[RoleName.konstantin]!.type
          ..heart = allRoles[RoleName.konstantin]!.heart;
      case RoleName.nostradamous:
        return Player()
          ..roleName = allRoles[RoleName.nostradamous]!.name
          ..description = allRoles[RoleName.nostradamous]!.description
          ..type = allRoles[RoleName.nostradamous]!.type
          ..heart = allRoles[RoleName.nostradamous]!.heart;
      case RoleName.saul:
        return Player()
          ..roleName = allRoles[RoleName.saul]!.name
          ..description = allRoles[RoleName.saul]!.description
          ..type = allRoles[RoleName.saul]!.type
          ..heart = allRoles[RoleName.saul]!.heart;
      case RoleName.matador:
        return Player()
          ..roleName = allRoles[RoleName.matador]!.name
          ..description = allRoles[RoleName.matador]!.description
          ..type = allRoles[RoleName.matador]!.type
          ..heart = allRoles[RoleName.matador]!.heart;
    }
  }
}
