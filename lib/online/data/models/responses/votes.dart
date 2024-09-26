import '../../../../offline/db/entities/vote.dart';

class VoteResp {
  Map<String, List<String>>? votes;
  Vote? vote;
  String? msg;

  VoteResp({this.votes, this.vote, this.msg});

  factory VoteResp.fromJson(Map<String, dynamic> json) {
    return VoteResp(
      votes: json['votes'] != null
          ? Map<String, List<String>>.from(json['votes'])
          : null,
      vote: json['vote'] != null ? Vote.fromJson(json['vote']) : null,
      msg: json['msg'],
    );
  }

  factory VoteResp.empty() => VoteResp();

  @override
  String toString() => 'VoteResp{votes: $votes, vote: $vote, msg: $msg}';
}
