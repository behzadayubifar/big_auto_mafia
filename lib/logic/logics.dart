import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logics.g.dart';

@riverpod
leon(LeonRef ref, String playerName) async {
  final isar = await ref.watch(isarServiceProvider.future);
  final player = await isar.getPlayerByName(playerName);
  final bool isMafia = player!.type == RoleType.mafia;
  if (isMafia) {
    isar.updatePlayer(player.copy(
      isShot: true,
      heart: player.heart! - 1,
    ));
    if (player.shotCount == 2) {
      player.isReversible = false;
    }
  } else {
    player.isSaved = true;
  }
}
