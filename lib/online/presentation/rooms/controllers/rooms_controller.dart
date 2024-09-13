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
import '../../users/controller/accounts_controller.dart';
import 'active_room.dart';

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
    required List<String> roles,
  }) async {
    state = const AsyncLoading();
    final roomsRepo = ref.read(roomsRepositoryProvider);
    state = await AsyncValue.guard(
      () async {
        final createRoomResult = await roomsRepo.createRoom(
          name: name,
          numberOfPlayers: numberOfPlayers,
          password: password,
          roles: roles,
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
              usersInfo: r.users != null ? r.users![r.rooms[0].id!] : null,
              roles: roles,
            );
            await ref
                .read(activeRoomsProvider.notifier)
                .getRoomById(r.rooms[0].id!);
            ref.read(routerProvider).pushNamed(
                  'waiting-room',
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
          // Save current room to shared prefs
          await SharedPrefs.setModel<Room>('currentRoom', r.rooms[0]);

          // Insert Room to local db
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
            roles: r.rooms[0].roles,
          );
          // get room by id
          await ref
              .read(activeRoomsProvider.notifier)
              .getRoomById(r.rooms[0].id!);
          // go to waiting room
          // Sse

          //
          ref.read(routerProvider).pushNamed(
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
          ref.read(routerProvider).goNamed('panel');
          //
          log('leave room success');
          SharedPrefs.remove('currentRoomID');
          final userID = SharedPrefs.userID!;
          final isar = await ref.read(isarServiceProvider.future);
          await isar.deleteRoom(r.rooms[0].id!);

          //
          // get account from server
          await ref
              .read(accountsControllerProvider.notifier)
              .getAccountFromServer(userID);
          // get all rooms from local db
          final currentUsersRoom =
              await ref.read(activeRoomsProvider.notifier).getRooms(userID);
          if (currentUsersRoom.isNotEmpty) {
            for (final room in currentUsersRoom) {
              await ref
                  .read(activeRoomsProvider.notifier)
                  .refreshRoomById(room!.id!);
            }
          } else {
            log('rooms must be none');
          }
        },
      );
      return leaveRoomResult;
    });
  }

  // get room
  Future<Either<ErrorResp, RoomResp>> getRoombyId(String roomId) async {
    state = const AsyncLoading();
    final roomsRepo = ref.read(roomsRepositoryProvider);
    Either<ErrorResp, RoomResp> roomResult = right(RoomResp.empty());
    state = await AsyncValue.guard(() async {
      roomResult = await roomsRepo.getRoomById(roomId);
      log('roomResult: $roomResult');
      roomResult.match(
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
            usersInfo: r.users![r.rooms[0].id!],
            roles: r.rooms[0].roles,
          );
          // ref.read(routerProvider).pushNamed('waiting', pathParameters: {
          //   'name': r.rooms[0].name!,
          // });
        },
      );
      return roomResult;
    });
    return roomResult;
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
