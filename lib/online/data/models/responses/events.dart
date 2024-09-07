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
        final roomId = (data['data'] as Map).keys.firstOrNull;
        final user = UsersInRoom.fromJson(data['data'][roomId][0]);
        return JoinRoomEvent(roomId: roomId, user: user);
      case "left_room":
        // data example : {"event_type":"left_room","data":["{\"user_name\" : \"fariba\", \"first_name\" : \"فاطمه\", \"last_name\" : \"جمشیدی\"}"]}
        final roomId = (data['data'] as Map).keys.firstOrNull;
        final user = UsersInRoom.fromJson(data['data'][roomId][0]);

        return LeftRoomEvent(roomId: roomId, user: user);
      default:
        return AppEvent();
    }
  }

  @override
  String toString() {
    return 'AppEvent{type: $type, data: $data}';
  }
}

class JoinRoomEvent extends AppEvent {
  final String roomId;
  final UsersInRoom user;
  final type = "joined_room";

  JoinRoomEvent({
    required this.roomId,
    required this.user,
  });

  @override
  String toString() {
    return 'JoinRoomEvent{roomId: $roomId, user: $user}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JoinRoomEvent &&
        other.roomId == roomId &&
        other.user == user;
  }

  @override
  int get hashCode => roomId.hashCode ^ user.hashCode;
}

class LeftRoomEvent extends AppEvent {
  final String roomId;
  final UsersInRoom user;
  final type = "left_room";

  LeftRoomEvent({
    required this.roomId,
    required this.user,
  });

  @override
  String toString() {
    return 'LeftRoomEvent{roomId: $roomId, user: $user}';
  }
}

class UserEvent {}
