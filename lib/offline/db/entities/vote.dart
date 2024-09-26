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

typedef VotesCollection = Map<String, List<String>>;

// fromJson for VotesCollection
// VotesCollection? fromJsonVotesCollection(Map<String, dynamic>? json) {
//   if (json == null) return null;
//   return Map<String, List<String>>.from(json);
// }
