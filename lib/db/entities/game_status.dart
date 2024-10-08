import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

part 'game_status.g.dart';

// first read this from GameStatus collection
// then update the initial route based on the status of the game
List<String> statusOfGameList = [
  'notStarted',
  'day',
  'night',
  'chaos',
  'rolePanel',
  'nightResults',
  'showRoles',
  'started',
  'finished',
];

@Collection()
class GameStatus {
  Id? id;

  bool isDay = true;
  int dayNumber = 0;
  int? wholeGameTimePassed = 0;
  String? situation = '';
  // this must change in two times :
  // (initial_value) = ['playerName', '$initialTime']
  //    1. At the start of night, it must be set to
  //    2. when some player is going to do his/her job and entering the
  //      - role panel, it must be set to initial_value
  //    3. when the player has done his/her job, it must be set to ['', '0']
  // structure : [String playerName, String timeLeft]
  List<String>? timeLeft = ['', '0'];

  // who saw their role
  List<String> playersWhoSawTheirRole = [];

  // status of game
  String? statusOfGame = '';

  // if this is null && isNight == true it means that the list of players must be shown

  int? nightCode = -1;
  bool? isFinished;
  String? winner = '';

  bool? isChaos = false;

// mafia shoot
  int? remainedMafiasBullets = 1;

  // last moves
  List<String?>? usedLastMoves = [];

  // raemained chances for night-enquiry
  int? remainedChancesForNightEnquiry = 2;

  // re-night is run
  bool? isReNight = false;

  bool? hasMafiaBuyedOnce = false;

  // if konstantin choose someone to come back,
  // this will be set to that player's name

  // a method for copying GameStatus from a Future<GameStatus>

  @override
  String toString() => """"New GameStatus is:"
            "isDay: $isDay"
            "statusOfGame: $statusOfGame"
            "playersWhoSawTheirRole: $playersWhoSawTheirRole"
            "dayNumber: $dayNumber"
            "wholeGameTimePassed: $wholeGameTimePassed"
            "timeLeft: $timeLeft"
            "nightCode: $nightCode"
            "isFinished: $isFinished"
            "winner: $winner"
            "situation: $situation"
            "isChaos: $isChaos"
            "remainedMafiasBullets: $remainedMafiasBullets"
            "hasMafiaBuyedOnce: $hasMafiaBuyedOnce"
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
    String? statusOfGame,
    String? situation,
    List<String>? playersWhoSawTheirRole,
    int? remainedMafiasBullets,
    List<String?>? usedLastMoves,
    int? remainedChancesForNightEnquiry,
    bool? isReNight,
    bool? hasMafiaBuyedOnce,
  }) {
    final newStatus = GameStatus()
      ..id = id
      ..statusOfGame = statusOfGame ?? this.statusOfGame
      ..isDay = isDay ?? this.isDay
      ..dayNumber = dayNumber ?? this.dayNumber
      ..wholeGameTimePassed = wholeGameTimePassed ?? this.wholeGameTimePassed
      ..playersWhoSawTheirRole = [
        ...?playersWhoSawTheirRole,
      ]
      ..timeLeft = timeLeft ?? this.timeLeft
      ..nightCode = nightCode ?? this.nightCode
      ..isFinished = isFinished ?? this.isFinished
      ..winner = winner ?? this.winner
      ..situation = situation ?? this.situation
      ..remainedMafiasBullets =
          remainedMafiasBullets ?? this.remainedMafiasBullets
      ..usedLastMoves = usedLastMoves ?? this.usedLastMoves
      ..remainedChancesForNightEnquiry =
          remainedChancesForNightEnquiry ?? this.remainedChancesForNightEnquiry
      ..isReNight = isReNight ?? this.isReNight
      ..isChaos = isChaos ?? this.isChaos
      ..hasMafiaBuyedOnce = hasMafiaBuyedOnce ?? this.hasMafiaBuyedOnce;

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
          situation == other.situation &&
          remainedMafiasBullets == other.remainedMafiasBullets &&
          listEquals(usedLastMoves, other.usedLastMoves) &&
          remainedChancesForNightEnquiry ==
              other.remainedChancesForNightEnquiry &&
          isChaos == other.isChaos &&
          hasMafiaBuyedOnce == other.hasMafiaBuyedOnce;

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
        situation,
        isChaos,
        remainedMafiasBullets,
        usedLastMoves,
        remainedChancesForNightEnquiry,
        hasMafiaBuyedOnce,
      );
}

@Collection()
class Night {
  Id? id;
  int nightNumber = 0;
  List<String>? playersWaitingForDoingTheirNightJob;

  //
  // // String? inComplete;

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
  // night of right choice of kane
  String nightOfRightChoiceOfKane = "";
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
  // nostradamous : [person1, person2, person3]
  List<String> nostradamousChoices = [];

  Night copy({
    int? nightNumber,
    List<String>? playersWaitingForDoingTheirNightJob,
    bool? isNight,
    String? playerNameWhoIsComingBack,
    String? mafiasShot,
    String? godfatherChoice,
    String? theRoleGuessedByGodfather,
    String? leonChoice,
    String? kaneChoice,
    String? kane,
    String? nightOfRightChoiceOfKane,
    String? watsonChoice,
    String? matadorChoice,
    String? nightOfBlockage,
    String? konstantinChoice,
    String? saulChoice,
    List<String>? nostradamousChoices,
  }) =>
      Night()
        ..id = id
        ..nightNumber = nightNumber ?? this.nightNumber
        ..playersWaitingForDoingTheirNightJob =
            playersWaitingForDoingTheirNightJob ??
                this.playersWaitingForDoingTheirNightJob
        ..isNight = isNight ?? this.isNight
        ..playerNameWhoIsComingBack =
            playerNameWhoIsComingBack ?? this.playerNameWhoIsComingBack
        ..mafiasShot = mafiasShot ?? this.mafiasShot
        ..godfatherChoice = godfatherChoice ?? this.godfatherChoice
        ..theRoleGuessedByGodfather =
            theRoleGuessedByGodfather ?? this.theRoleGuessedByGodfather
        ..leonChoice = leonChoice ?? this.leonChoice
        ..kaneChoice = kaneChoice ?? this.kaneChoice
        ..nightOfRightChoiceOfKane =
            nightOfRightChoiceOfKane ?? this.nightOfRightChoiceOfKane
        ..konstantinChoice = konstantinChoice ?? this.konstantinChoice
        ..watsonChoice = watsonChoice ?? this.watsonChoice
        ..matadorChoice = matadorChoice ?? this.matadorChoice
        ..nightOfBlockage = nightOfBlockage ?? this.nightOfBlockage
        ..nostradamousChoices = nostradamousChoices ?? this.nostradamousChoices
        ..saulChoice = saulChoice ?? this.saulChoice;

  @override
  String toString() => """"New Night is:"
            "nightNumber: $nightNumber"
            "playersWaitingForDoingTheirNightJob: $playersWaitingForDoingTheirNightJob"
            
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
            "nostradamousChoices: $nostradamousChoices"
            "nightOfRightChoiceOfKane: $nightOfRightChoiceOfKane"
            "saulChoice: $saulChoice""";
}
