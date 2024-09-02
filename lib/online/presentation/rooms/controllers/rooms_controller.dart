import 'dart:developer';

import 'package:auto_mafia/offline/db/shared_prefs/shared_prefs.dart';
import 'package:auto_mafia/online/events/sse.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../offline/db/entities/room.dart';
import '../../../../offline/db/isar_service.dart';
import '../../../data/models/responses/errors.dart';
import '../../../data/models/responses/rooms.dart';
import '../../../../routes/routes.dart';
import '../../../domain/rooms/rooms_repository.dart';

part 'rooms_controller.g.dart';

@riverpod
class RoomsController extends _$RoomsController {
  @override
  FutureOr<Either<ErrorResp, RoomResp>> build() {
    return right(RoomResp(rooms: [], msg: ''));
  }

  // get room

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

        createRoomResult.match(
          (l) {
            log('create room failed');
          },
          (r) async {
            log('create room success');
            await SharedPrefs.setModel<Room>('currentRoom', r.rooms[0]);
            final isar = await ref.read(isarServiceProvider.future);
            await isar.putRoom(
              id: r.rooms[0].id,
              name: name,
              numberOfPlayers: numberOfPlayers,
              password: password,
              status: r.rooms[0].status,
              players: r.rooms[0].players,
              createdAt: r.rooms[0].createdAt,
              updatedAt: r.rooms[0].updatedAt,
              usersInfo: r.users![r.rooms[0].id!],
            );
            ref.read(routerProvider).goNamed(
                  'waiting-room',
                  extra: createRoomResult
                      .getRight()
                      .getOrElse(() => RoomResp.empty())
                      .users!
                      .values
                      .toList()[0],
                );
          },
        );
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
      joinRoomResult.match(
        (l) {
          log('join room failed');
        },
        (r) async {
          log('join room success');
          await SharedPrefs.setModel<Room>('currentRoom', r.rooms[0]);
          final isar = await ref.read(isarServiceProvider.future);
          await isar.putRoom(
            id: r.rooms[0].id,
            name: r.rooms[0].name,
            numberOfPlayers: r.rooms[0].numberOfPlayers,
            // TODO; Save Hashed Password Loaclly?
            password: password,
            status: r.rooms[0].status,
            players: r.rooms[0].players,
            createdAt: r.rooms[0].createdAt,
            updatedAt: r.rooms[0].updatedAt,
            usersInfo: r.users![r.rooms[0].id!],
          );
          ref.read(routerProvider).goNamed(
                'waiting-room',
                extra: joinRoomResult
                    .getRight()
                    .getOrElse(() => RoomResp.empty())
                    .users!
                    .values
                    .toList()[0],
              );
        },
      );
      return joinRoomResult;
    });
  }

  // leave room
  Future<void> leaveRoom(String roomId) async {
    state = const AsyncLoading();
    final roomsRepo = ref.read(roomsRepositoryProvider);
    state = await AsyncValue.guard(() async {
      final leaveRoomResult = await roomsRepo.leaveRoom(roomId);
      leaveRoomResult.match(
        (l) {
          log('leave room failed');
        },
        (r) async {
          log('leave room success');
          SharedPrefs.remove('currentRoomID');
          final isar = await ref.read(isarServiceProvider.future);
          await isar.deleteRoom(r.rooms[0].id!);
          ref.read(routerProvider).goNamed('panel');
        },
      );
      return leaveRoomResult;
    });
  }

  // get room
  Future<void> getRoombyId(String roomId) async {
    state = const AsyncLoading();
    final roomsRepo = ref.read(roomsRepositoryProvider);
    state = await AsyncValue.guard(() async {
      final getRoomResult = await roomsRepo.getRoomById(roomId);
      getRoomResult.match(
        (l) {
          log('get room failed');
        },
        (r) async {
          log('get room success');
          final isar = await ref.read(isarServiceProvider.future);
          await isar.putRoom(
            id: r.rooms[0].id,
            name: r.rooms[0].name,
            numberOfPlayers: r.rooms[0].numberOfPlayers,
            password: r.rooms[0].password,
            status: r.rooms[0].status,
            players: r.rooms[0].players,
            createdAt: r.rooms[0].createdAt,
            updatedAt: r.rooms[0].updatedAt,
          );
          ref.read(routerProvider).goNamed('room', pathParameters: {
            'name': r.rooms[0].name!,
          });
        },
      );
      return getRoomResult;
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
