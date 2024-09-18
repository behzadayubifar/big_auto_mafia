import 'package:auto_mafia/offline/db/entities/user.dart';

class GameResp {
  String? msg;
  PlayerOnline? playerOnline;
  // int? numberOfReadyPlayers;

  GameResp({
    this.msg,
    this.playerOnline,
    // this.numberOfReadyPlayers,
  });

  factory GameResp.empty() {
    return GameResp(msg: '');
  }

  factory GameResp.fromJson(Map<String, dynamic> json) {
    return GameResp(
      msg: json['msg'] ?? '',
      playerOnline: json['player_online'] != null
          ? PlayerOnline.fromJson(json['player_online'])
          : null,
      // numberOfReadyPlayers: json['number_of_ready_players'],
    );
  }
}
