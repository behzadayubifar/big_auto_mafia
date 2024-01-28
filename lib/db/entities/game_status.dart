import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

part 'game_status.g.dart';

@Collection()
class GameStatus {
  Id? id;
  bool isDay = true;
  int dayNumber = 0;
  int? wholeGameTimePassed = 0;
  // TODO: handle this in UI *******************
  // this must change in two times :
  // (initial_value) = ['playerName', '$initialTime']
  //    1. At the start of night, it must be set to
  //    2. when some player is going to do his/her job and entering the
  //      - role panel, it must be set to initial_value
  //    3. when the player has done his/her job, it must be set to ['', '0']
  // structure : [String playerName, String timeLeft]
  List<String>? timeLeft = ['', '0'];

  // if this is null && isNight == true it means that the list of players must be shown

  int? nightCode = -1;
  bool? isFinished = false;
  String? winner;

  bool? isChaos = false;

  // if konstantin choose someone to come back,
  // this will be set to that player's name

  // a method for copying GameStatus from a Future<GameStatus>

  @override
  String toString() => """"New GameStatus is:"
            "isDay: $isDay"
            "dayNumber: $dayNumber"
            "wholeGameTimePassed: $wholeGameTimePassed"
            "timeLeft: $timeLeft"
            "nightCode: $nightCode"
            "isFinished: $isFinished"
            "winner: $winner"
            "isChaos: $isChaos"
            """;

  GameStatus copy({
    bool? isDay,
    int? dayNumber,
    int? wholeGameTimePassed,
    List<String>? timeLeft,
    int? nightCode,
    bool? isFinished,
    String? winner,
    bool? isChaos,
  }) {
    final newStatus = GameStatus()
      ..id = id
      ..isDay = isDay ?? this.isDay
      ..dayNumber = dayNumber ?? this.dayNumber
      ..wholeGameTimePassed = wholeGameTimePassed ?? this.wholeGameTimePassed
      ..timeLeft = timeLeft ?? this.timeLeft
      ..nightCode = nightCode ?? this.nightCode
      ..isFinished = isFinished ?? this.isFinished
      ..winner = winner ?? this.winner
      ..isChaos = isChaos ?? this.isChaos;
    //
    log('newStatus: ${newStatus.toString()} with id: ${newStatus.id}',
        name: 'game_status');
    //
    return newStatus;
  }

  // implement custom eaquality for GameStatus
  @override
  bool operator ==(covariant GameStatus other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          dayNumber == other.dayNumber &&
          isDay == other.isDay &&
          wholeGameTimePassed == other.wholeGameTimePassed &&
          listEquals(timeLeft, other.timeLeft) &&
          nightCode == other.nightCode &&
          isFinished == other.isFinished &&
          winner == other.winner &&
          isChaos == other.isChaos;

  @override
  int get hashCode => Object.hash(
        runtimeType,
        dayNumber,
        isDay,
        wholeGameTimePassed,
        timeLeft,
        nightCode,
        isFinished,
        winner,
        isChaos,
      );
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

  // black list

  // mafia : {shoot: true, person: "behzad"}
  String mafiasShot = "";
  // godfahter : {shootOrSlaughter: "slaughter", person: "ali"}
  String godfatherChoice = "";
  // godfahter : the role for chosen player by godfather to be slaughtered
  String theRoleGuessedByGodfather = "";
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
  // night of last blockage
  String nightOfBlockage = "";
  // saul : {person: "behzad"}
  String saulChoice = "";

  Night copy({
    int? nightNumber,
    List<String>? playersWaitingForDoingTheirNightJob,
    int? nightCode,
    bool? isNight,
    String? playerNameWhoIsComingBack,
    String? mafiasShot,
    String? godfatherChoice,
    String? theRoleGuessedByGodfather,
    String? leonChoice,
    String? kaneChoice,
    String? konstantinChoice,
    String? watsonChoice,
    String? matadorChoice,
    String? nightOfBlockage,
    String? saulChoice,
  }) =>
      Night()
        ..id = id
        ..nightNumber = nightNumber ?? this.nightNumber
        ..playersWaitingForDoingTheirNightJob =
            playersWaitingForDoingTheirNightJob ??
                this.playersWaitingForDoingTheirNightJob
        ..nightCode = nightCode ?? this.nightCode
        ..isNight = isNight ?? this.isNight
        ..playerNameWhoIsComingBack =
            playerNameWhoIsComingBack ?? this.playerNameWhoIsComingBack
        ..mafiasShot = mafiasShot ?? this.mafiasShot
        ..godfatherChoice = godfatherChoice ?? this.godfatherChoice
        ..theRoleGuessedByGodfather =
            theRoleGuessedByGodfather ?? this.theRoleGuessedByGodfather
        ..leonChoice = leonChoice ?? this.leonChoice
        ..kaneChoice = kaneChoice ?? this.kaneChoice
        ..konstantinChoice = konstantinChoice ?? this.konstantinChoice
        ..watsonChoice = watsonChoice ?? this.watsonChoice
        ..matadorChoice = matadorChoice ?? this.matadorChoice
        ..nightOfBlockage = nightOfBlockage ?? this.nightOfBlockage
        ..saulChoice = saulChoice ?? this.saulChoice;

  @override
  String toString() => """"New Night is:"
            "nightNumber: $nightNumber"
            "playersWaitingForDoingTheirNightJob: $playersWaitingForDoingTheirNightJob"
            "nightCode: $nightCode"
            "isNight: $isNight"
            "playerNameWhoIsComingBack: $playerNameWhoIsComingBack"
            "mafiasShot: $mafiasShot"
            "godfatherChoice: $godfatherChoice"
            "theRoleGuessedByGodfather": "$theRoleGuessedByGodfather"
            "leonChoice: $leonChoice"
            "kaneChoice: $kaneChoice"
            "konstantinChoice: $konstantinChoice"
            "watsonChoice: $watsonChoice"
            "matadorChoice: $matadorChoice"
            "nightOfBlockage: $nightOfBlockage"
            "saulChoice: $saulChoice""";
}
