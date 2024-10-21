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

class VotesCollectionValue {
  final List<UsersInRoom> voters;
  final bool hasEnoughVotes;

  VotesCollectionValue({
    required this.voters,
    required this.hasEnoughVotes,
  });

  factory VotesCollectionValue.fromJson(Map<String, dynamic> json) {
    return VotesCollectionValue(
      voters: List<UsersInRoom>.from(
        (json['voters'] as List).map(
          (voter) => UsersInRoom.fromJson(voter),
        ),
      ),
      hasEnoughVotes: json['has_enough_votes'],
    );
  }
}

class VotesCollection {
  Map<UsersInRoom, VotesCollectionValue> collection;

  VotesCollection({
    required this.collection,
  });

  factory VotesCollection.fromJson(Map<String, dynamic> json) {
    return VotesCollection(
      collection: Map<UsersInRoom, VotesCollectionValue>.from(
        json.map(
          (key, value) => MapEntry(
            UsersInRoom.fromJson(jsonDecode(key)),
            VotesCollectionValue.fromJson(value),
          ),
        ),
      ),
    );
  }

  factory VotesCollection.empty() {
    return VotesCollection(
      collection: {},
    );
  }
}
