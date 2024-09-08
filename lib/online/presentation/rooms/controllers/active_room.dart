import 'dart:developer';

import 'package:auto_mafia/offline/db/shared_prefs/shared_prefs.dart';
import 'package:auto_mafia/online/presentation/rooms/controllers/rooms_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../offline/db/entities/room.dart';
import '../../../../offline/db/isar_service.dart';

part 'active_room.g.dart';

@riverpod
class ActiveRooms extends _$ActiveRooms {
  @override
  Future<List<Room?>> build() async {
    final currentUserId = await SharedPrefs.userID;
    log('build active rooms');
    return getRooms(currentUserId!);
  }

  Future<List<Room?>> getRooms(String userId) async {
    final isar = await ref.read(isarServiceProvider.future);
    final rooms = await isar.retrieveUserRooms(userId);
    state = AsyncValue.data(rooms);
    return rooms;
  }

  // fetch rooms from local db
  Future<List<Room?>> getRoomById(String id) async {
    state = const AsyncLoading();
    List<Room?> rooms = [];
    state = await AsyncValue.guard(
      () async {
        final isar = await ref.read(isarServiceProvider.future);
        final r = await isar.retrieveRoomByID(id);
        if (r != null) rooms.add(r);
        return rooms;
      },
    );
    return [];
  }

  // fetch room from server
  Future<List<Room?>> refreshRoomById(String id) async {
    state = const AsyncLoading();
    List<Room?> rooms = [];
    state = await AsyncValue.guard(
      () async {
        // server
        // TODO: Later we must return the room from like these methods in rooms_controller.dart and ...
        // TODO: So we won't need to call the local methods -- DONE

        // TODO: We can use isolates to run the server & local methods in parallel to save time
        final roomsResp =
            await ref.read(roomsControllerProvider.notifier).getRoombyId(id);
        roomsResp.match(
          (l) async {
            // if the room couldn't be fetched from the server, we return the room from local db
            switch (l.statusCode) {
              case 404:
                log('room not found');
                // so we remove the room from the local db
                ref.read(isarServiceProvider.future).then(
                  (isar) async {
                    await isar.deleteRoom(id);
                  },
                );
                break;
              default:
                log('failed to fetch room');
                rooms = await getRoomById(id);
                break;
            }
          },
          (r) async {
            log('room found');
            if (r.users != null) {
              rooms = r.rooms;
              rooms[0]!.usersInfo = r.users![id];
              return rooms;
            }
            // update the room in local db
            rooms = await updateRoom(r.rooms[0]);
          },
        );
        return rooms;
      },
    );
    return rooms;
  }

  // update room in local db
  Future<List<Room?>> updateRoom(Room room) async {
    final isar = await ref.read(isarServiceProvider.future);
    await isar.putRoom(
      id: room.id!,
      name: room.name!,
      createdAt: room.createdAt!,
      updatedAt: room.updatedAt!,
      numberOfPlayers: room.numberOfPlayers!,
      password: room.password!,
      players: room.players!,
      status: room.status!,
      usersInfo: room.usersInfo!,
      roles: room.roles!,
    );
    return getRooms(await SharedPrefs.userID!);
  }
}
