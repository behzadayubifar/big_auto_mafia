import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../offline/db/isar_service.dart';
import '../../../data/models/responses/rooms.dart';
import '../../../../routes/routes.dart';
import '../../../domain/rooms/rooms_repository.dart';

part 'rooms_controller.g.dart';

@riverpod
class RoomsController extends _$RoomsController {
  @override
  FutureOr<dynamic> build() {}

  // create room
  Future<void> createRoom({
    required String name,
    required int numberOfPlayers,
    required String password,
  }) async {
    state = const AsyncLoading();
    final roomsRepo = ref.read(roomsRepositoryProvider);
    state = await AsyncValue.guard(
      () async {
        final createRoomResult = await roomsRepo.createRoom(
          name: name,
          numberOfPlayers: numberOfPlayers,
          password: password,
        );
        if (createRoomResult is RoomResp) {
          log('create room success');
          final isar = await ref.read(isarServiceProvider.future);
          await isar.putRoom(
            id: createRoomResult.rooms[0].id,
            name: name,
            numberOfPlayers: numberOfPlayers,
            password: password,
            status: createRoomResult.rooms[0].status,
            players: createRoomResult.rooms[0].players,
            createdAt: createRoomResult.rooms[0].createdAt,
            updatedAt: createRoomResult.rooms[0].updatedAt,
          );
          ref.read(routerProvider).goNamed(
                'waiting-room',
                // pathParameters: {'name': createRoomResult.rooms[0].name!},
              );
        } else {
          log('create room failed');
        }
        return createRoomResult;
      },
    );
  }

  // join room
  Future<void> joinRoom(String roomId, String password) async {
    state = const AsyncLoading();
    final roomsRepo = ref.read(roomsRepositoryProvider);
    state = await AsyncValue.guard(() async {
      final joinRoomResult = await roomsRepo.joinRoom(
        roomId: roomId,
        password: password,
      );
      if (joinRoomResult is RoomResp) {
        log('join room success');
        final isar = await ref.read(isarServiceProvider.future);
        await isar.putRoom(
          id: joinRoomResult.rooms[0].id,
          name: joinRoomResult.rooms[0].name,
          numberOfPlayers: joinRoomResult.rooms[0].numberOfPlayers,
          // TODO; Save Hashed Password Loaclly?
          password: password,
          status: joinRoomResult.rooms[0].status,
          players: joinRoomResult.rooms[0].players,
          createdAt: joinRoomResult.rooms[0].createdAt,
          updatedAt: joinRoomResult.rooms[0].updatedAt,
        );
        ref.read(routerProvider).goNamed('room', pathParameters: {
          'name': joinRoomResult.rooms[0].name!,
        });
      }
    });
  }

  // leave room
  Future<void> leaveRoom(String roomId) async {
    state = const AsyncLoading();
    final roomsRepo = ref.read(roomsRepositoryProvider);
    state = await AsyncValue.guard(() async {
      final leaveRoomResult = await roomsRepo.leaveRoom(roomId);
      if (leaveRoomResult is RoomResp) {
        log('leave room success');
        final isar = await ref.read(isarServiceProvider.future);
        await isar.deleteRoom(leaveRoomResult.rooms[0].id!);
        ref.read(routerProvider).goNamed('panel');
      }
    });
  }
}

@Riverpod(keepAlive: true)
class SelectedRoles extends _$SelectedRoles {
  @override
  List<String> build() {
    return [];
  }

  void add(String role) {
    state = [...state, role];
  }

  void remove(String role, {bool removeAll = false}) {
    // remove one of the roles it can be more than one if is remove one of them
    if (removeAll) {
      state = [...state]..removeWhere((element) => element == role);
    } else {
      final i = state.indexOf(role);
      if (i != -1) {
        state = [...state]..removeAt(i);
      }
    }
  }
}
