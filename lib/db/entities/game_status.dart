import 'dart:developer';

import 'package:isar/isar.dart';

part 'game_status.g.dart';

@Collection()
class GameStatus {
  Id? id;
  bool isDay = true;
  int dayNumber = 0;
  int? wholeGameTimePassed = 0;
  // this must change in two times :
  //    1. At the start of night, it must be set to (initial value)
  //    2. when some player is going to do his/her job and entering the
  //      - role panel, it must be set to (initial value)
  //    3. when the player has done his/her job, it must be set to 0
  // structure : [String playerName, String timeLeft]
  List<String>? timeLeft = ['', '0'];

  // if this is null && isNight == true it means that the list of players must be shown

  int? nightCode = -1;

  // if konstantin choose someone to come back,
  // this will be set to that player's name

  // a method for copying GameStatus from a Future<GameStatus>

  @override
  String toString() => """"New GameStatus is:"
            "isDay: $isDay"
            "dayNumber: $dayNumber"
            "wholeGameTimePassed: $wholeGameTimePassed"
            "timeLeft: $timeLeft"
            "nightCode: $nightCode""";

  GameStatus copy({
    bool? isDay,
    int? dayNumber,
    int? wholeGameTimePassed,
    List<String>? timeLeft,
    int? nightCode,
  }) {
    final newStatus = GameStatus()
      ..isDay = isDay ?? this.isDay
      ..dayNumber = dayNumber ?? this.dayNumber
      ..wholeGameTimePassed = wholeGameTimePassed ?? this.wholeGameTimePassed
      ..timeLeft = timeLeft ?? this.timeLeft
      ..nightCode = nightCode ?? this.nightCode;
    //
    log('newStatus: ${newStatus.toString()}');
    //
    return newStatus;
  }
}

@Collection()
class Night {
  Id? id;
  int nightNumber = 0;
  List<String>? playersWaitingForDoingTheirNightJob;

  //
  // String? inComplete;
  int? nightCode;
  bool isNight = false;
  String? playerNameWhoIsComingBack;

  // mafia : {shoot: true, person: "behzad"}
  String mafiasShot = "";
  // godfahter : {shootOrSlaughter: "slaughter", person: "ali"}
  String godfatherChoice = "";
  // leon : {shoot: true, person: "hadi"}
  String leonChoice = '';
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

// TODO: this didn't work correctly
  // Night copy({
  //   int? nightNumber,
  //   List<String>? playersWaitingForDoingTheirNightJob,
  //   int? timeLeft,
  //   String? inComplete,
  //   int? nightCode,
  //   bool? isNight,
  //   String? playerNameWhoIsComingBack,
  //   String? mafiasShot,
  //   String? godfatherChoice,
  //   String? leonChoice,
  //   String? kaneChoice,
  //   String? konstantinChoice,
  //   String? watsonChoice,
  //   String? matadorChoice,
  //   String? saulChoice,
  // }) =>
  //     Night()
  //       ..id = id
  //       ..nightNumber = nightNumber ?? this.nightNumber
  //       ..playersWaitingForDoingTheirNightJob =
  //           playersWaitingForDoingTheirNightJob ??
  //               this.playersWaitingForDoingTheirNightJob
  //       ..nightCode = nightCode ?? this.nightCode
  //       ..isNight = isNight ?? this.isNight
  //       ..playerNameWhoIsComingBack =
  //           playerNameWhoIsComingBack ?? this.playerNameWhoIsComingBack
  //       ..mafiasShot = mafiasShot ?? this.mafiasShot
  //       ..godfatherChoice = godfatherChoice ?? this.godfatherChoice
  //       ..leonChoice = leonChoice ?? this.leonChoice
  //       ..kaneChoice = kaneChoice ?? this.kaneChoice
  //       ..konstantinChoice = konstantinChoice ?? this.konstantinChoice
  //       ..watsonChoice = watsonChoice ?? this.watsonChoice
  //       ..matadorChoice = matadorChoice ?? this.matadorChoice
  //       ..saulChoice = saulChoice ?? this.saulChoice;

  @override
  String toString() => """"New Night is:"
            "nightNumber: $nightNumber"
            "playersWaitingForDoingTheirNightJob: $playersWaitingForDoingTheirNightJob"
            "nightCode: $nightCode"
            "isNight: $isNight"
            "playerNameWhoIsComingBack: $playerNameWhoIsComingBack"
            "mafiasShot: $mafiasShot"
            "godfatherChoice: $godfatherChoice"
            "leonChoice: $leonChoice"
            "kaneChoice: $kaneChoice"
            "konstantinChoice: $konstantinChoice"
            "watsonChoice: $watsonChoice"
            "matadorChoice: $matadorChoice"
            "saulChoice: $saulChoice""";
}
