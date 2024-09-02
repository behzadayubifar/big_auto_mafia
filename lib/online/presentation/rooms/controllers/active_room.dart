import 'package:auto_mafia/offline/db/shared_prefs/shared_prefs.dart';
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
    final isar = await ref.read(isarServiceProvider.future);
    final allRoomsWhichCurrentUserIsPresentAt = isar.retrieveUserRooms(userId);
    return allRoomsWhichCurrentUserIsPresentAt;
  }

  Future<Room?> getRoomById(String id) async {
    final isar = await ref.read(isarServiceProvider.future);
    final room = isar.retrieveRoomByID(id);
    return room;
  }

  // fetch room from server where
}
