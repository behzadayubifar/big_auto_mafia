/* 


type RoomResponse struct {
	Rooms []Room `json:"rooms"`
	Msg   string `json:"msg"`
}

 */

import '../../../../offline/db/entities/user.dart';

class UserResp {
  List<User> users;
  String token;
  String msg;

  UserResp({required this.users, required this.token, required this.msg});

  factory UserResp.fromJson(Map<String, dynamic> json) {
    return UserResp(
      users: List<User>.from(
          (json['users'] as List<dynamic>).map((x) => User.fromJson(x))),
      token: json['token'],
      msg: json['msg'],
    );
  }
}
