import 'package:isar/isar.dart';

import 'fast_hash.dart';

part 'user.g.dart';

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
  }) =>
      User()
        ..id = id
        ..username = username
        ..email = email
        ..password = password
        ..firstName = firstName
        ..lastName = lastName
        ..coins = coins
        ..createdAt = createdAt
        ..updatedAt = updatedAt
        ..isAdmin = isAdmin;

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
    ..isAdmin = json['is_admin'] == "true";

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
