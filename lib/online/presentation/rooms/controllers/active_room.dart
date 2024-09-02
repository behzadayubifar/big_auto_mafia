import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../offline/db/entities/room.dart';
import '../../../../offline/db/isar_service.dart';

part 'active_room.g.dart';

@riverpod
class ActiveRooms extends _$ActiveRooms {
  @override
  Future<List<Room?>> build() async {
    return getRooms();
  }

  Future<List<Room?>> getRooms() async {
    final isar = await ref.read(isarServiceProvider.future);
    return isar.retrieveAllRooms();
  }
}
