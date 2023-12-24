import 'package:isar/isar.dart';

part 'game_status.g.dart';

@Collection()
class GameStatus {
  Id? id;
  bool isNight = false;
  int night = 0;
  int timePassed = 16;

  // if this is null && isNight == true it means that the list of players must be shown

  String? inComplete;
  int? nightCode;
  // if konstantin choose someone to come back,
  // this will be set to that player's name
}

@Collection()
class Night {
  Id? id;
  int nightNumber = 0;
  List<String>? playersWaitingForDoingTheirNightJob;
  int timePassed = 16;
  //
  String? inComplete;
  int? nightCode;
  bool isNight = false;
  String? playerNameWhoIsComingBack;
}
