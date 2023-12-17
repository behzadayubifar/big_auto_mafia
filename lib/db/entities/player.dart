import 'package:auto_mafia/models/role.dart';
import 'package:isar/isar.dart';

part 'player.g.dart';

@Collection()
class Player {
  Id? id;
  String? name;
  // later we will add images for each player
  // role is var because of face-off
  Role? role;
  bool nightDone = false;
}
