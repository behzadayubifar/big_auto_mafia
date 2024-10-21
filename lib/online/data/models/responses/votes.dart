import 'package:auto_mafia/online/data/models/responses/rooms.dart';

import '../../../../offline/db/entities/vote.dart';

class VoteResp {
  VotesCollection? collection;
  Vote? vote;
  String? msg;

  VoteResp({
    this.collection,
    this.vote,
    this.msg,
  });

  factory VoteResp.fromJson(Map<String, dynamic> json) {
    return VoteResp(
      collection: json['votes'] != null
          ? VotesCollection.fromJson(json['votes'])
          : null,
      vote: json['vote'] != null ? Vote.fromJson(json['vote']) : null,
      msg: json['msg'],
    );
  }

  factory VoteResp.empty() => VoteResp();

  @override
  String toString() =>
      'VoteResp{collection: $collection, vote: $vote, msg: $msg}';
}
