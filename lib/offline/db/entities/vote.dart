import 'dart:convert';

import '../../../online/data/models/responses/rooms.dart';

class Vote {
  String? roomId;
  int? dayNum;
  String? voter;
  List<String>? voted;
  int? level;

  Vote({
    this.roomId,
    this.dayNum,
    this.voter,
    this.voted,
    this.level,
  });

  factory Vote.fromJson(Map<String, dynamic> json) {
    return Vote(
      roomId: json['room_id'],
      dayNum: json['day_num'],
      voter: json['voter'],
      voted: json['voted'] != null ? List<String>.from(json['voted']) : null,
      level: json['level'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'room_id': roomId,
      'day_num': dayNum,
      'voter': voter,
      'voted': voted,
      'level': level,
    };
  }

  Vote.empty() {
    roomId = '';
    dayNum = 0;
    voter = '';
    voted = [];
    level = 0;
  }

  @override
  String toString() {
    return 'Vote{roomId: $roomId, dayNum: $dayNum, voter: $voter, voted: $voted, level: $level}';
  }
}

/* 
type VotesCollection map[rooms.UsersInRoom]struct {
	Voters         []rooms.UsersInRoom `json:"voters"`
	HasEnoughVotes bool                `json:"has_enough_votes"`
}
 */
class VotesCollection {
  Map<UsersInRoom, List<UsersInRoom>> collection;
  bool? hasEnoughVotes;

  VotesCollection({
    required this.collection,
    this.hasEnoughVotes,
  });

  factory VotesCollection.fromJson(Map<String, dynamic> json) {
    return VotesCollection(
      hasEnoughVotes: json['has_enough_votes'],
      collection: Map<UsersInRoom, List<UsersInRoom>>.from(
        json.map(
          (key, value) {
            final voted = UsersInRoom.fromJson(jsonDecode(key));
            final voters = List<UsersInRoom>.from(
              (value['voters'] as List).map(
                (voter) => UsersInRoom.fromJson(voter),
              ),
            );
            return MapEntry(voted, voters);
          },
        ),
      ),
    );
  }

  factory VotesCollection.empty() {
    return VotesCollection(
      collection: {},
      hasEnoughVotes: false,
    );
  }
}
