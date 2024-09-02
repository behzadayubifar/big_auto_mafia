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
    return getRooms(currentUserId!);
  }

  Future<List<Room?>> getRooms(String userId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        final isar = await ref.read(isarServiceProvider.future);
        final rooms = isar.retrieveUserRooms(userId);
        return rooms;
      },
    );
    return [];
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
        if (roomsResp.users != null) return roomsResp.rooms;

        // if the room couldn't be fetched from the server, we return the room from local db
        rooms = await getRoomById(id);
        return rooms;
      },
    );
    return rooms;
  }
}
