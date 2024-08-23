import 'dart:convert';
import 'dart:developer';

import 'package:auto_mafia/db/entities/user.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/db/shared_prefs/shared_prefs.dart';
import 'package:auto_mafia/online/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _container = ProviderContainer();

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
    final isar = await _container.read(isarServiceProvider.future);
    await isar.putUser(
      id: response.data['id'],
      username: userName,
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
    await SharedPrefs.setString('token', token);
    log('User registered successfully with token: $token', name: "register");
    log('response :' + response.data.toString(), name: "register");
    return true;
  } else {
    log('Failed to register user');
    return false;
  }
}

Future<bool> login(String userName, String password) async {
  final dio = Dio();
  final response = await dio.post(Endpoints.login,
      data: jsonEncode({
        'user_name': userName,
        'password': password,
      }),
      options: Options(
        contentType: Headers.jsonContentType,
      ));

  if (response.statusCode == 200) {
    final token = response.data['token'];
    final isar = await _container.read(isarServiceProvider.future);
    await SharedPrefs.setString('token', token);
    log('User logged in successfully with token: $token', name: "login");
    log('response :' + response.data.toString(), name: "login");
    return true;
  } else {
    log('Failed to login user');
    return false;
  }
}
