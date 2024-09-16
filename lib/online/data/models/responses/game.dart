class GameResp {
  String msg;
  // int? numberOfReadyPlayers;

  GameResp({
    required this.msg,
    // this.numberOfReadyPlayers,
  });

  factory GameResp.empty() {
    return GameResp(msg: '');
  }

  factory GameResp.fromJson(Map<String, dynamic> json) {
    return GameResp(
      msg: json['msg'],
      // numberOfReadyPlayers: json['number_of_ready_players'],
    );
  }
}
