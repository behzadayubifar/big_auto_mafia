import 'package:auto_mafia/db/entities/game_status.dart';
import 'package:auto_mafia/db/entities/player.dart';
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
    return isar.players.where().findAll();
  }

  Future<void> savePlayer(Player player) async {
    final isar = await db;
    await isar.writeTxnSync(() => isar.players.putSync(player));
  }
}
