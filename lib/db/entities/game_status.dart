import 'package:isar/isar.dart';

part 'game_status.g.dart';

@Collection()
class GameStatus {
  Id? id;
  bool isDay = true;
  int dayNumber = 0;
  int timePassed = 16;

  // if this is null && isNight == true it means that the list of players must be shown

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

  // mafia : {shoot: true, person: "behzad"}
  String mafiasShot = "";
  // godfahter : {shootOrSlaughter: "slaughter", person: "ali"}
  String godfatherChoice = "";
  // leon : {shoot: true, person: "hadi"}
  String leonChoice = "";
  // kane : {guess: true, person: "behzad"}
  String kaneChoice = "";
  // konstantin : {return: true, person: "behzad"}
  String konstantinChoice = "";
  // watson : {person: "behzad"}
  String watsonChoice = "";
  // matador : {person: "behzad"}
  String matadorChoice = "";
  // saul : {person: "behzad"}
  String saulChoice = "";

  Night copy({
    int? nightNumber,
    List<String>? playersWaitingForDoingTheirNightJob,
    int? timePassed,
    String? inComplete,
    int? nightCode,
    bool? isNight,
    String? playerNameWhoIsComingBack,
    String? mafiasShot,
    String? godfatherChoice,
    String? leonChoice,
    String? kaneChoice,
    String? konstantinChoice,
    String? watsonChoice,
    String? matadorChoice,
    String? saulChoice,
  }) {
    return Night()
      ..id = id
      ..nightNumber = nightNumber ?? this.nightNumber
      ..playersWaitingForDoingTheirNightJob =
          playersWaitingForDoingTheirNightJob ??
              this.playersWaitingForDoingTheirNightJob
      ..timePassed = timePassed ?? this.timePassed
      ..inComplete = inComplete ?? this.inComplete
      ..nightCode = nightCode ?? this.nightCode
      ..isNight = isNight ?? this.isNight
      ..playerNameWhoIsComingBack =
          playerNameWhoIsComingBack ?? this.playerNameWhoIsComingBack
      ..mafiasShot = mafiasShot ?? this.mafiasShot
      ..godfatherChoice = godfatherChoice ?? this.godfatherChoice
      ..leonChoice = leonChoice ?? this.leonChoice
      ..kaneChoice = kaneChoice ?? this.kaneChoice
      ..konstantinChoice = konstantinChoice ?? this.konstantinChoice
      ..watsonChoice = watsonChoice ?? this.watsonChoice
      ..matadorChoice = matadorChoice ?? this.matadorChoice
      ..saulChoice = saulChoice ?? this.saulChoice;
  }
}
