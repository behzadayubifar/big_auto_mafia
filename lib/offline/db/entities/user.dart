import 'package:isar/isar.dart';

import '../fast_hash.dart';

part 'user.g.dart';

@embedded
class PlayerOnline {
  String? roomId;
  String? role;
  String? side;
  int? heart;

  PlayerOnline({
    this.roomId,
    this.role,
    this.side,
    this.heart,
  });

  factory PlayerOnline.fromJson(Map<String, dynamic> json) {
    return PlayerOnline(
      roomId: json['room_id'],
      role: json['role'],
      side: json['side'],
      heart: json['heart'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'room_id': roomId,
      'role': role,
      'side': side,
      'heart': heart,
    };
  }

  @override
  String toString() {
    return 'PlayerOnline{roomId: $roomId, role: $role, side: $side, heart: $heart}';
  }
}

@Collection()
class User {
  String? id;

  Id get isarId => fastHash(id!);

  String? username;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  int? coins;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isAdmin;
  PlayerOnline? playerOnline;
// -------------------------------------

  User copy({
    String? id,
    String? username,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    int? coins,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isAdmin,
    PlayerOnline? playerOnline,
  }) =>
      User()
        ..id = id ?? this.id
        ..username = username ?? this.username
        ..email = email ?? this.email
        ..password = password ?? this.password
        ..firstName = firstName ?? this.firstName
        ..lastName = lastName ?? this.lastName
        ..coins = coins ?? this.coins
        ..createdAt = createdAt ?? this.createdAt
        ..updatedAt = updatedAt ?? this.updatedAt
        ..isAdmin = isAdmin ?? this.isAdmin
        ..playerOnline = playerOnline ?? this.playerOnline;

  static User fromJson(Map<String, dynamic> json) => User()
    ..id = json['id']
    ..username = json['user_name']
    ..email = json['email']
    ..password = json['password']
    ..firstName = json['first_name']
    ..lastName = json['last_name']
    ..coins = json['coins']
    ..createdAt = DateTime.parse(json['created_at'])
    ..updatedAt = DateTime.parse(json['updated_at'])
    ..isAdmin = json['is_admin'] == "true"
    ..playerOnline = json['player_online'] == null
        ? null
        : PlayerOnline.fromJson(json['player_online']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_name': username,
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
        'coins': coins,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'is_admin': isAdmin,
        'player_online': playerOnline?.toJson(),
      };

  // get full name
  String get fullName => "$firstName $lastName";
}

// method to get users with repeated full name
List<User> getUsersWithRepeatedFullName(List<User> users) {
  final repeatedNames = <User>[];
  final names = users.map((e) => e.fullName).toList();
  for (int i = 0; i < names.length; i++) {
    if (names.sublist(i + 1).contains(names[i])) {
      repeatedNames.add(users[i]);
    }
  }
  return repeatedNames;
}
