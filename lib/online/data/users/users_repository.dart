import 'dart:convert';
import 'dart:developer';

import 'package:auto_mafia/db/shared_prefs/shared_prefs.dart';
import 'package:auto_mafia/models/online/errors.dart';
import 'package:auto_mafia/models/online/users.dart';
import 'package:auto_mafia/online/service/dio_provider.dart';
import 'package:auto_mafia/online/data/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../db/entities/user.dart';

part 'users_repository.g.dart';

class UsersRepository {
  final Dio dio;

  UsersRepository({required this.dio});

  Future<dynamic> register({
    required String userName,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final response = await dio.post(
      Endpoints.register,
      data: User()
          .copy(
            username: userName,
            email: email,
            password: password,
            firstName: firstName,
            lastName: lastName,
          )
          .toJson(),
    );

    if (response.statusCode == 201) {
      final token = response.data['token'];
      // await isar.putUser(
      //   id: response.data['id'],
      //   username: userName,
      //   email: email,
      //   password: password,
      //   firstName: firstName,
      //   lastName: lastName,
      // );
      await SharedPrefs.setString('token', token);
      log('User registered successfully with token: $token', name: "register");
      log('response :' + response.data.toString(), name: "register");
      SharedPrefs.setString('token', token);
      return UserResp.fromJson(response.data);
    } else {
      log('Failed to register user');
      return ErrorResp.fromJson(response.data);
    }
  }

  Future<dynamic> login(String userName, String password) async {
    final response = await dio.post(
      Endpoints.login,
      data: jsonEncode({
        'user_name': userName,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final token = response.data['token'];
      await SharedPrefs.setString('token', token);
      log('User logged in successfully with token: $token', name: "login");
      log('response :' + response.data.toString(), name: "login");
      SharedPrefs.setString('token', token);
      return UserResp.fromJson(response.data);
    } else {
      log('Failed to login user');
      return ErrorResp.fromJson(response.data);
    }
  }
}

@riverpod
UsersRepository usersRepository(UsersRepositoryRef ref) => UsersRepository(
      dio: ref.watch(dioProvider),
    );
