import 'package:auto_mafia/offline/db/entities/situation.dart';
import 'package:auto_mafia/offline/db/entities/user.dart';

class GameResp {
  String? msg;
  PlayerOnline? playerOnline;
  Situation? situation;
  // int? numberOfReadyPlayers;

  GameResp({
    this.msg,
    this.playerOnline,
    this.situation,
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
      situation: json['situation'] != null
          ? Situation.fromJson(json['situation'])
          : null,
      // numberOfReadyPlayers: json['number_of_ready_players'],
    );
  }
}
