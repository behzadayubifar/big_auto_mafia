import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/errors.dart';
import '../../data/models/rooms.dart';
import '../../data/endpoints.dart';
import '../../service/dio_provider.dart';

part 'rooms_repository.g.dart';

class RoomsRepository {
  final Dio dio;

  RoomsRepository({required this.dio});

  Future<dynamic> createRoom({
    required String name,
    required int numberOfPlayers,
    required String password,
  }) async {
    final response = await dio.post(Endpoints.createRoom,
        data: jsonEncode({
          'name': name,
          'number_of_players': numberOfPlayers,
          'password': password,
        }),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    if (response.statusCode == 201) {
      log('Room created successfully', name: "createRoom");
      log('response :' + response.data.toString(), name: "createRoom");
      return RoomResp.fromJson(response.data);
    } else {
      log('Failed to create room');
      return ErrorResp.fromJson(response.data);
    }
  }

  Future<dynamic> joinRoom(
      {required String roomId, required String password}) async {
    final response = await dio.post(
      Endpoints.joinRoom + roomId + '/join',
    );
    if (response.statusCode == 200) {
      log('Room joined successfully', name: "joinRoom");
      log('response :' + response.data.toString(), name: "joinRoom");
      return RoomResp.fromJson(response.data);
    } else {
      log('Failed to join room');
      return ErrorResp.fromJson(response.data);
    }
  }

  Future<dynamic> leaveRoom(String roomId) async {
    final response = await dio.post(
      Endpoints.leaveRoom + roomId + '/leave',
    );
    if (response.statusCode == 200) {
      log('Room left successfully', name: "leaveRoom");
      log('response :' + response.data.toString(), name: "leaveRoom");
      return RoomResp.fromJson(response.data);
    } else {
      log('Failed to leave room');
      return ErrorResp.fromJson(response.data);
    }
  }

  Future<dynamic> getRoomById(String roomId) async {
    final response = await dio.get(
      Endpoints.getRoom + roomId,
    );
    if (response.statusCode == 200) {
      log('Room fetched successfully', name: "getRoomById");
      log('response :' + response.data.toString(), name: "getRoomById");
      return RoomResp.fromJson(response.data);
    } else {
      log('Failed to fetch room');
      return ErrorResp.fromJson(response.data);
    }
  }

  Future<dynamic> updateRoomStatus(String roomId, String status) async {
    final response = await dio.patch(
      Endpoints.updateRoomStatus + roomId + "/$status",
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
