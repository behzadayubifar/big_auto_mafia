import 'package:auto_mafia/db/entities/game_status.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;
  static late List<Player> players;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
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

  Future<List<Player>> getPlayers() async {
    final isar = await db;
    players = await isar.players.where().findAll();
    return players;
  }

  Future<void> savePlayer(Player player) async {
    final isar = await db;
    await isar.writeTxnSync(() => isar.players.putSync(player));
  }

  Future<void> savePlayers(List<Player> players) async {
    final isar = await db;
    await isar.writeTxnSync(() => isar.players.putAllSync(players));
  }

  Future<void> initializePlayers(List<Map<String, RoleName>> players) async {
    final isar = await db;
    await isar.writeTxnSync(() => isar.players.putAllSync(
          players
              .map((player) => Player.initializeBasedOnRole(player))
              .toList(),
        ));
  }

  Future<void> deletePlayer(Player player) async {
    final isar = await db;
    await isar.writeTxnSync(() => isar.players.delete(player.id!));
  }

  Future<void> deletePlayers(List<Player> players) async {
    final isar = await db;
    await isar.writeTxnSync(
        () => isar.players.deleteAll(players.map((e) => e.id!).toList()));
  }

  Future<void> deleteAllPlayers() async {
    final isar = await db;
    await isar.writeTxnSync(() => isar.players.deleteAll(
          players.map((e) => e.id!).toList(),
        ));
  }
}
