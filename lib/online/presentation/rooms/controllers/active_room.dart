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

  Future<List<Room?>> refreshRoomsById(List<String> ids) async {
    state = const AsyncLoading();
    List<Room?> rooms = [];
    final roomsCtrl = ref.read(roomsControllerProvider.notifier);
    state = await AsyncValue.guard(
      () async {
        for (var id in ids) {
          final result = await roomsCtrl.getRoomById(id);
          result.match(
            (l) async {
              switch (l.statusCode) {
                case 404:
                  log('get room failed');
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
                final room = r.rooms;
                room[0].usersInfo = r.users![id];
                rooms.addAll(room);
              }

              // update the room in local db
              rooms = await updateRoom(r.rooms);
            },
          );
        }
        return rooms;
      },
    );
    return rooms;
  }

  // update room in local db
  Future<List<Room?>> updateRoom(List<Room> rooms) async {
    final isar = await ref.read(isarServiceProvider.future);
    for (var room in rooms) {
      await isar.putRoom(
        id: room.id,
        name: room.name,
        numberOfPlayers: room.numberOfPlayers,
        password: room.password,
        status: room.status,
        usersInfo: room.usersInfo,
        createdAt: room.createdAt,
        updatedAt: room.updatedAt,
      );
    }
    return getRooms(await SharedPrefs.userID!);
  }
  // current room
}
