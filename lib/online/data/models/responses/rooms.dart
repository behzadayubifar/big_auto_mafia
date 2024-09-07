import 'package:auto_mafia/offline/db/entities/room.dart';
import 'package:isar/isar.dart';

import '../../../../offline/db/entities/user.dart';

part 'rooms.g.dart';

/* 
type UsersInRoom map[uuid.UUID]struct {
	UserName string    `json:"user_name"`
	ID       uuid.UUID `json:"id"`
	FullName string    `json:"full_name"`
}
 */

@embedded
class UsersInRoom {
  String? userName;
  String? id;
  String? fullName;

  UsersInRoom({
    this.userName,
    this.id,
    this.fullName,
  });

  factory UsersInRoom.fromJson(Map<String, dynamic> json) {
    return UsersInRoom(
      userName: json['user_name'],
      id: json['id'],
      fullName: json['full_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_name': userName,
      'id': id,
      'full_name': fullName,
    };
  }

  @override
  String toString() {
    return 'UsersInRoom{userName: $userName, id: $id, fullName: $fullName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UsersInRoom &&
        other.userName == userName &&
        other.id == id &&
        other.fullName == fullName;
  }

  @override
  int get hashCode => userName.hashCode ^ id.hashCode ^ fullName.hashCode;
}

class RoomResp {
  List<Room> rooms;
  String msg;
  // users is a map of room id to list of users in that room
  Map<String, List<UsersInRoom>>? users;

  RoomResp({required this.rooms, required this.msg, this.users});

  factory RoomResp.fromJson(Map<String, dynamic> json) {
    return RoomResp(
      rooms: List<Room>.from((json['rooms'] as List<dynamic>).map(
        (x) => Room.fromJson(x),
      )),
      msg: json['msg'],
      users: json['users'] == null
          ? null
          : (json['users'] as Map<String, dynamic>).map(
              (key, value) => MapEntry(
                key,
                List<UsersInRoom>.from(
                  (value as List<dynamic>)
                      .map((user) => UsersInRoom.fromJson(user)),
                ),
              ),
            ),
    );
  }

  // empty room response
  factory RoomResp.empty() {
    return RoomResp(rooms: [], msg: '');
  }
}
