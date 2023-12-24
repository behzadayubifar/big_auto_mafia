import 'package:auto_mafia/db/entities/game_status.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_service.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isarInstance(IsarInstanceRef ref) {
  return IsarService.openDB();
}

@riverpod
Future<IsarService> isarService(IsarServiceRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  return IsarService(isar);
}

// live data for alive players
@riverpod
Future<List<Player?>> alivePlayers(AlivePlayersRef ref) async {
  final isar = await ref.watch(isarServiceProvider.future);
  return isar.alivePlayers();
}

class IsarService {
  final Isar isar;
  static late List<Player> players;

  IsarService(this.isar);

  static Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          PlayerSchema,
          GameStatusSchema,
        ],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> initializePlayers(List<Map<String, RoleName>> players) async {
    isar.writeTxnSync(() => isar.players.putAllSync(
          players
              .map((player) => Player.initializeBasedOnRole(player))
              .toList(),
        ));
  }

  Future<List<Player>> getAllPlayers() async {
    return isar.players.where().findAll();
  }

  Future<Player?> getPlayerByName(String playerName) async {
    return isar.players.filter().playerNameEqualTo(playerName).findFirst();
  }

  Future<void> updatePlayer(Player player) async {
    isar.writeTxnSync(() => isar.players.putSync(player));
  }

  Future<void> updatePlayers(List<Player> players) async {
    isar.writeTxnSync(() => isar.players.putAllSync(players));
  }

  Future<void> deletePlayer(Player player) async {
    isar.writeTxnSync(() => isar.players.delete(player.id!));
  }

  Future<void> deletePlayers(List<Player> players) async {
    isar.writeTxnSync(
        () => isar.players.deleteAll(players.map((e) => e.id!).toList()));
  }

  Future<void> deleteAllPlayers() async {
    isar.writeTxnSync(() => isar.players.deleteAll(
          players.map((e) => e.id!).toList(),
        ));
  }

  Future<List<Player?>> alivePlayers() {
    return isar.players.filter().isAliveEqualTo(true).findAll();
  }

  Future<List<Player?>> deadPlayers() async {
    return isar.players.filter().isAliveEqualTo(false).findAll();
  }

  Future<int> alivePlayersCount() async {
    return isar.players.filter().isAliveEqualTo(true).count();
  }

  Future<int> deadPlayersCount() async {
    return isar.players.filter().isAliveEqualTo(false).count();
  }
}
