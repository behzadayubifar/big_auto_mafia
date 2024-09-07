import 'package:auto_mafia/online/data/models/responses/rooms.dart';
import 'package:isar/isar.dart';

import 'fast_hash.dart';

part 'room.g.dart';

@Collection()
class Room {
  String? id;

  Id get isarId => fastHash(id!);

  String? name;
  int? numberOfPlayers;
  String? password;
  String? status;
  List<String>? players;
  List<UsersInRoom>? usersInfo;
  List<String>? roles;
  DateTime? createdAt;
  DateTime? updatedAt;

// -------------------------------------

  Room copy({
    String? id,
    String? name,
    int? numberOfPlayers,
    String? password,
    String? status,
    List<String>? players,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<UsersInRoom>? usersInfo,
    List<String>? roles,
  }) =>
      Room()
        ..id = id
        ..name = name
        ..numberOfPlayers = numberOfPlayers
        ..password = password
        ..status = status
        ..players = players
        ..createdAt = createdAt
        ..updatedAt = updatedAt
        ..usersInfo = usersInfo
        ..roles = roles;

  static Room fromJson(Map<String, dynamic> json) => Room()
    ..id = json['id']
    ..name = json['name']
    ..numberOfPlayers = json['number_of_players']
    ..password = json['password']
    ..status = json['status']
    ..players = List<String>.from(json['players'])
    ..createdAt = DateTime.parse(json['created_at'])
    ..updatedAt = DateTime.parse(json['updated_at'])
    ..roles = List<String>.from(json['roles'])
    ..usersInfo = json['users'] == null
        ? null
        : List<UsersInRoom>.from(
            json['users'].map(
              (x) => UsersInRoom.fromJson(x),
            ),
          );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'number_of_players': numberOfPlayers,
        'password': password,
        'status': status,
        'players': players,
        'created_at': createdAt.toString(),
        'updated_at': updatedAt.toString(),
        'roles': roles,
        'users': usersInfo == null
            ? null
            : List<dynamic>.from(
                usersInfo!.map(
                  (x) => x.toJson(),
                ),
              ),
        // usersInfo!.map((x) => x.toJson()).toList()
      };
}
