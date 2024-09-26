import 'dart:convert';
import 'dart:developer';

import 'package:auto_mafia/online/data/models/responses/rooms.dart';

import '../../../../offline/db/entities/user.dart';
import '../../../../offline/db/entities/vote.dart';

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
        return JoinedRoom.JoinRoom(roomId: roomId, user: user);
      case "left_room":
        // data example : {"event_type":"left_room","data":["{\"user_name\" : \"fariba\", \"first_name\" : \"فاطمه\", \"last_name\" : \"جمشیدی\"}"]}
        final roomId = (data['data'] as Map).keys.firstOrNull;
        final user = UsersInRoom.fromJson(data['data'][roomId][0]);
        return LeftRoom(roomId: roomId, user: user);
      case "room_full":
        // data example : {"event_type":"room_full","data":["{\"room_id\" : \"1\", \"users\" : [{\"user_name\" : \"fariba\", \"first_name\" : \"فاطمه\", \"last_name\" : \"جمشیدی\"}]}"]}
        final roomId = (data['data'] as Map).keys.firstOrNull;
        final users = (data['data'][roomId] as List)
            .map((e) => UsersInRoom.fromJson(e))
            .toList();
        return RoomFull(roomId: roomId, users: users);
      case "game_started":
        // example : {"event_type":"game_started","data": {"player_id": "1", "room_id": "124", "role": "leon", "side": "citizen", "heart": 1}}
        log("game_started event data: ${data['data']}");
        final player = PlayerOnline.fromJson(data['data']);
        final playerId = data['data']['player_id'];
        return GameStarted(player: player, playerId: playerId);
      case "player_added_to_waiting_queue":
        // example : {"event_type":"player_added_to_waiting_queue","data":1,"created_at":1726544502}
        log("player_added_to_waiting_queue event data: ${data['data']}");
        final numberOfWaiters = data['data'];
        return PlayerAddedToWaitingQueue(numberOfWaiters: numberOfWaiters);
      case "voting_finished":
        // example : {"event_type":"voting_finished","data": {"votes": [{"voter": "1", "voted": "2", "level": 1}]}}
        log("voting_finished event data: ${data['data']}");
        return VotingFinished();
      case "votes_processed":
        // example : {"event_type":"votes_processed","data": {"enough_voted": {"1": 2, "2": 1}}}
        log("votes_processed event data: ${data['data']}");
        //TODO:_TypeError (type 'List<dynamic>' is not a subtype of type 'List<String>' in type cast)
        final collection = Map<String, List<String>>.from(
          (data['data']['collection'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, List<String>.from(value as List)),
          ),
        );
        return VotesProcessed(collection: collection);

      default:
        return AppEvent();
    }
  }

  @override
  String toString() {
    return 'AppEvent{type: $type, data: $data}';
  }
}

class JoinedRoom extends AppEvent {
  final String roomId;
  final UsersInRoom user;
  final type = "joined_room";

  JoinedRoom.JoinRoom({
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

    return other is JoinedRoom && other.roomId == roomId && other.user == user;
  }

  @override
  int get hashCode => roomId.hashCode ^ user.hashCode;
}

class LeftRoom extends AppEvent {
  final String roomId;
  final UsersInRoom user;
  final type = "left_room";

  LeftRoom({
    required this.roomId,
    required this.user,
  });

  @override
  String toString() {
    return 'LeftRoomEvent{roomId: $roomId, user: $user}';
  }
}

class RoomFull extends AppEvent {
  final String roomId;
  final List<UsersInRoom> users;
  final type = "room_full";

  RoomFull({
    required this.roomId,
    required this.users,
  });

  @override
  String toString() {
    return 'RoomFullEvent{roomId: $roomId, users: $users}';
  }
}

class GameStarted extends AppEvent {
  final PlayerOnline player;
  final String playerId;
  final type = "game_started";

  GameStarted({
    required this.player,
    required this.playerId,
  });

  @override
  String toString() {
    return 'GameStarted{player: $player} with id: $playerId';
  }
}

class PlayerAddedToWaitingQueue extends AppEvent {
  final int numberOfWaiters;
  final type = "player_added_to_waiting_queue";

  PlayerAddedToWaitingQueue({
    required this.numberOfWaiters,
  });

  @override
  String toString() {
    return '$numberOfWaiters are waiting ...';
  }
}

class VotingFinished extends AppEvent {
  final type = "voting_finished";

  VotingFinished();

  @override
  String toString() {
    return 'VotingFinished';
  }
}

class VotesProcessed extends AppEvent {
  final Map<String, List<String?>> collection;
  final type = "votes_processed";

  VotesProcessed({
    required this.collection,
  });

  @override
  String toString() {
    return 'VotesProcessed{collection: $collection}';
  }
}

class NightStarted extends AppEvent {
  final type = "night_started";

  NightStarted();

  @override
  String toString() {
    return 'NightStarted';
  }
}
