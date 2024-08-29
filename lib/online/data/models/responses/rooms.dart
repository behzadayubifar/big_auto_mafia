import 'package:auto_mafia/offline/db/entities/room.dart';

class RoomResp {
  List<Room> rooms;
  String msg;

  RoomResp({required this.rooms, required this.msg});

  factory RoomResp.fromJson(Map<String, dynamic> json) {
    return RoomResp(
      rooms: List<Room>.from(
          (json['rooms'] as List<dynamic>).map((x) => Room.fromJson(x))),
      msg: json['msg'],
    );
  }

  // empty room response
  factory RoomResp.empty() {
    return RoomResp(rooms: [], msg: '');
  }
}
