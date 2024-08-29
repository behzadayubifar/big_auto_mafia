import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../offline/db/shared_prefs/shared_prefs.dart';
import '../../data/models/responses/errors.dart';
import '../../data/models/responses/rooms.dart';
import '../../data/endpoints.dart';
import '../../service/dio_provider.dart';

part 'rooms_repository.g.dart';

class RoomsRepository {
  final Dio dio;

  RoomsRepository({required this.dio});

  Future<Either<ErrorResp, RoomResp>> createRoom({
    required String name,
    required int numberOfPlayers,
    required String password,
  }) async {
    final response = await dio.post(
      Endpoints.createRoom,
      data: jsonEncode({
        'name': name,
        'number_of_players': numberOfPlayers,
        'password': password,
      }),
      options: Options(
        headers: {
          'Authorization': {await SharedPrefs.getString('token')},
        },
      ),
    );
    if (response.statusCode == 201) {
      log('Room created successfully', name: "createRoom");
      log('response :' + response.data.toString(), name: "createRoom");
      return Right(RoomResp.fromJson(response.data));
    } else {
      log('Failed to create room');
      return Left(ErrorResp.fromJson(response.data));
    }
  }

  Future<Either<ErrorResp, RoomResp>> joinRoom(
      {required String roomId, required String password}) async {
    final response = await dio.post(
      Endpoints.joinRoom + roomId + '/join',
      options: Options(
        headers: {
          'Authorization': {await SharedPrefs.getString('token')},
        },
      ),
    );
    if (response.statusCode == 200) {
      log('Room joined successfully', name: "joinRoom");
      log('response :' + response.data.toString(), name: "joinRoom");
      return Right(RoomResp.fromJson(response.data));
    } else {
      log('Failed to join room');
      return Left(ErrorResp.fromJson(response.data));
    }
  }

  Future<Either<ErrorResp, RoomResp>> leaveRoom(String roomId) async {
    final response = await dio.post(
      Endpoints.leaveRoom + roomId + '/leave',
      options: Options(
        headers: {
          'Authorization': {await SharedPrefs.getString('token')},
        },
      ),
    );
    if (response.statusCode == 200) {
      log('Room left successfully', name: "leaveRoom");
      log('response :' + response.data.toString(), name: "leaveRoom");
      return Right(RoomResp.fromJson(response.data));
    } else {
      log('Failed to leave room');
      return Left(ErrorResp.fromJson(response.data));
    }
  }

  Future<Either<ErrorResp, RoomResp>> getRoomById(String roomId) async {
    final response = await dio.get(
      Endpoints.getRoom + roomId,
      options: Options(
        headers: {
          'Authorization': {await SharedPrefs.getString('token')},
        },
      ),
    );
    if (response.statusCode == 200) {
      log('Room fetched successfully', name: "getRoomById");
      log('response :' + response.data.toString(), name: "getRoomById");
      return Right(RoomResp.fromJson(response.data));
    } else {
      log('Failed to fetch room');
      return Left(ErrorResp.fromJson(response.data));
    }
  }

  Future<dynamic> updateRoomStatus(String roomId, String status) async {
    final response = await dio.patch(
      Endpoints.updateRoomStatus + roomId + "/$status",
      options: Options(
        headers: {
          'Authorization': {await SharedPrefs.getString('token')},
        },
      ),
    );
    if (response.statusCode == 200) {
      log('Room status updated successfully', name: "updateRoomStatus");
      log('response :' + response.data.toString(), name: "updateRoomStatus");
      return RoomResp.fromJson(response.data);
    } else {
      log('Failed to update room status');
      return ErrorResp.fromJson(response.data);
    }
  }

  Future<dynamic> manageRoom(
      String roomId, String action, List<String> playersIds) async {
    final response = await dio.post(
      Endpoints.manageRoom + roomId + "/?action=$action",
      data: jsonEncode({
        'players_ids': playersIds,
      }),
      options: Options(
        headers: {
          'Authorization': {await SharedPrefs.getString('token')},
        },
      ),
    );
    if (response.statusCode == 200) {
      log('Room managed successfully', name: "manageRoom");
      log('response :' + response.data.toString(), name: "manageRoom");
      return RoomResp.fromJson(response.data);
    } else {
      log('Failed to manage room');
      return ErrorResp.fromJson(response.data);
    }
  }
}

@riverpod
RoomsRepository roomsRepository(RoomsRepositoryRef ref) {
  return RoomsRepository(dio: ref.read(dioProvider));
}
