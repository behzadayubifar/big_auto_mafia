/* type Vote struct {
	RoomID uuid.UUID `json:"room_id" db:"room_id" validate:"omitempty,uuid" errormsg:"room_id must be a valid UUID"`
	DayNum int       `json:"day_num" db:"day_num" validate:"required" errormsg:"day_num is required"`
	Voter  uuid.UUID `json:"voter" db:"voter"`
	Voted  uuid.UUID `json:"voted" db:"voted"`
	// Level --> Can be [1 : frist voting, 2 : court voting]
	Level int `json:"level" db:"level"`
} */

class Votes {
  String? roomId;
  int? dayNum;
  String? voter;
  String? voted;
  String? level;

  Votes({
    this.roomId,
    this.dayNum,
    this.voter,
    this.voted,
    this.level,
  });

  factory Votes.fromJson(Map<String, dynamic> json) {
    return Votes(
      roomId: json['room_id'],
      dayNum: json['day_num'],
      voter: json['voter'],
      voted: json['voted'],
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

  Votes.empty() {
    roomId = '';
    dayNum = 0;
    voter = '';
    voted = '';
    level = '';
  }

  @override
  String toString() {
    return 'Votes{roomId: $roomId, dayNum: $dayNum, voter: $voter, voted: $voted, level: $level}';
  }
}
