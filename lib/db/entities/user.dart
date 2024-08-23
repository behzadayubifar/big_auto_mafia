import 'package:isar/isar.dart';

part 'user.g.dart';

@Collection()
class User {
  User();
  Id? id;
  String? username;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
}
