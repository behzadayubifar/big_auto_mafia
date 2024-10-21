import 'package:isar/isar.dart';

import '../fast_hash.dart';

part 'situation.g.dart';

@Collection()
class Situation {
  String? roomId;

  Id get isarId => fastHash(roomId!);

  bool? isDay = true;
  int? dayNumber = 0;
  String? situation = '';
  String? winnerSide = '';
  List<String?>? usedLastMoves = [];
  int? remainedEnquiry = 2;
  String? lastDead = '';

  static Situation fromJson(Map<String, dynamic> json) => Situation()
    ..roomId = json['room_id']
    ..isDay = json['is_day']
    ..dayNumber = json['day_num']
    ..situation = json['situation']
    ..winnerSide = json['winner_side']
    ..usedLastMoves = json['used_last_moves'] != null
        ? List<String?>.from(json['used_last_moves'])
        : null
    ..remainedEnquiry = json['remained_enquiry']
    ..lastDead = json['last_dead'];

  Map<String, dynamic> toJson() => {
        'room_id': roomId,
        'is_day': isDay,
        'day_number': dayNumber,
        'situation': situation,
        'winner_side': winnerSide,
        'used_last_moves': usedLastMoves,
        'remained_enquiry': remainedEnquiry,
        'last_dead': lastDead,
      };

  Situation copy({
    String? roomId,
    bool? isDay,
    int? dayNumber,
    String? situation,
    String? winnerSide,
    List<String?>? usedLastMoves,
    int? remainedEnquiry,
    String? lastDead,
  }) =>
      Situation()
        ..roomId = roomId ?? this.roomId
        ..isDay = isDay ?? this.isDay
        ..dayNumber = dayNumber ?? this.dayNumber
        ..situation = situation ?? this.situation
        ..winnerSide = winnerSide ?? this.winnerSide
        ..usedLastMoves = usedLastMoves ?? this.usedLastMoves
        ..remainedEnquiry = remainedEnquiry ?? this.remainedEnquiry
        ..lastDead = lastDead ?? this.lastDead;

  @override
  String toString() {
    return 'Situation{isDay: $isDay, dayNumber: $dayNumber, situation: $situation, winnerSide: $winnerSide, usedLastMoves: $usedLastMoves, remainedEnquiry: $remainedEnquiry, lastDead: $lastDead}';
  }
}

// Situations ----------------------------------------------------

class Situations {
  Situations._();
// CREATE TYPE status AS ENUM ('day', 'night', 'renight', 'night_result', 'vote', 'vote_result', 'court');
  static const String day = 'day';
  static const String night = 'night';
  static const String renight = 'renight';
  static const String nightResult = 'night_result';
  static const String vote = 'vote';
  static const String voteResult = 'vote_result';
  static const String court = 'court';
}
