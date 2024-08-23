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

// -------------------------------------

  User copy({
    String? id,
    String? username,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
  }) =>
      User()
        ..id = id
        ..username = username
        ..email = email
        ..password = password
        ..firstName = firstName
        ..lastName = lastName;
}
