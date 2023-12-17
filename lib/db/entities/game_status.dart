import 'package:isar/isar.dart';

part 'game_status.g.dart';

@Collection()
class GameStatus {
  Id? id;
  bool isNight = false;
  int night = 0;
  int timePassed = 16;

  // if this is null, it means that the list of players must be shown
  String? inComplete;
  int? code;
}
