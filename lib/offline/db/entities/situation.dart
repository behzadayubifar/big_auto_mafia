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

  static Situation fromJson(Map<String, dynamic> json) => Situation()
    ..roomId = json['room_id']
    ..isDay = json['is_day']
    ..dayNumber = json['day_num']
    ..situation = json['situation']['String']
    ..winnerSide = json['winner_side']['String']
    ..usedLastMoves = json['used_last_moves'] != null
        ? List<String?>.from(json['used_last_moves'])
        : null
    ..remainedEnquiry = json['remained_enquiry'];

  Map<String, dynamic> toJson() => {
        'room_id': roomId,
        'is_day': isDay,
        'day_number': dayNumber,
        'situation': situation,
        'winner_side': winnerSide,
        'used_last_moves': usedLastMoves,
        'remained_enquiry': remainedEnquiry,
      };

  Situation copy({
    String? roomId,
    bool? isDay,
    int? dayNumber,
    String? situation,
    String? winnerSide,
    List<String?>? usedLastMoves,
    int? remainedEnquiry,
  }) =>
      Situation()
        ..roomId = roomId ?? this.roomId
        ..isDay = isDay ?? this.isDay
        ..dayNumber = dayNumber ?? this.dayNumber
        ..situation = situation ?? this.situation
        ..winnerSide = winnerSide ?? this.winnerSide
        ..usedLastMoves = usedLastMoves ?? this.usedLastMoves
        ..remainedEnquiry = remainedEnquiry ?? this.remainedEnquiry;

  @override
  String toString() {
    return 'Situation{isDay: $isDay, dayNumber: $dayNumber, situation: $situation, winnerSide: $winnerSide, usedLastMoves: $usedLastMoves, remainedEnquiry: $remainedEnquiry}';
  }
}
