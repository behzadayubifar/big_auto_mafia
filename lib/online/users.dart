import 'dart:convert';
import 'dart:developer';

import 'package:auto_mafia/db/shared_prefs/shared_prefs.dart';
import 'package:auto_mafia/online/endpoints.dart';
import 'package:dio/dio.dart';

// Future<void> login(String userName, String password) async {
//   final dio = Dio();
//   final response = await dio.post(

//   );
// }

Future<bool> register({
  required String userName,
  required String email,
  required String password,
  required String firstName,
  required String lastName,
}) async {
  final dio = Dio();
  final response = await dio.post(Endpoints.register,
      data: jsonEncode({
        'user_name': userName,
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
      }),
      options: Options(
        contentType: Headers.jsonContentType,
      ));

  if (response.statusCode == 201) {
    final token = response.data['token'];
    await SharedPrefs.setString('token', token);
    log('User registered successfully with token: $token');
    return true;
  } else {
    log('Failed to register user');
    return false;
  }
}
