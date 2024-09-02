import 'dart:convert';

import 'package:auto_mafia/online/data/models/responses/rooms.dart';

import '../../../../offline/db/entities/user.dart';

class AppEvent {
  final type;
  final data;

  AppEvent({this.type, this.data});

  factory AppEvent.fromJson(String event) {
    final data = jsonDecode(event);
    switch (data['event_type']) {
      case "joined_room":
        // data example : {"event_type":"joined_room","data":["{\"user_name\" : \"fariba\", \"first_name\" : \"فاطمه\", \"last_name\" : \"جمشیدی\"}"]}
        final roomId = data['data']['room_id'];
        final user = UsersInRoom.fromJson(jsonDecode(data['data'][0]));
        return JoinRoomEvent(roomId: roomId, user: user);
      case "left_room":
        // data example : {"event_type":"left_room","data":["{\"user_name\" : \"fariba\", \"first_name\" : \"فاطمه\", \"last_name\" : \"جمشیدی\"}"]}
        final roomId = data['data']['room_id'];
        final user = UsersInRoom.fromJson(jsonDecode(data['data'][0]));
        return LeaveRoomEvent(roomId: roomId, user: user);
      default:
        return AppEvent();
    }
  }
}

class JoinRoomEvent extends AppEvent {
  final String roomId;
  final UsersInRoom user;

  JoinRoomEvent({
    required this.roomId,
    required this.user,
  });
}

class LeaveRoomEvent extends AppEvent {
  final String roomId;
  final UsersInRoom user;

  LeaveRoomEvent({
    required this.roomId,
    required this.user,
  });
}

class UserEvent {}
