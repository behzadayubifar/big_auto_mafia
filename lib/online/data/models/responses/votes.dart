import '../../../../offline/db/entities/vote.dart';

class VoteResp {
  Map<String, List<String>>? collection;
  final Map<String, int>? enoughVoted;
  Vote? vote;
  String? msg;

  VoteResp({
    this.collection,
    this.enoughVoted,
    this.vote,
    this.msg,
  });

  factory VoteResp.fromJson(Map<String, dynamic> json) {
    return VoteResp(
      collection: json['collection'] != null
          ? Map<String, List<String>>.from(
              (json['collection'] as Map<String, dynamic>).map(
                (key, value) => MapEntry(key, List<String>.from(value as List)),
              ),
            )
          : null,
      enoughVoted: json['enough_voted'] != null
          ? Map<String, int>.from(json['enough_voted'])
          : null,
      vote: json['vote'] != null ? Vote.fromJson(json['vote']) : null,
      msg: json['msg'],
    );
  }

  factory VoteResp.empty() => VoteResp();

  @override
  String toString() =>
      'VoteResp{collection: $collection, enoughVoted: $enoughVoted, vote: $vote, msg: $msg}';
}
