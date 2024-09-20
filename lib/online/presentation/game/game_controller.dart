import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../offline/db/entities/room.dart';
import '../../../offline/db/entities/user.dart';
import '../../../offline/db/shared_prefs/shared_prefs.dart';
import '../../data/models/responses/errors.dart';
import '../../data/models/responses/game.dart';
import '../../domain/game/game_repository.dart';

part 'game_controller.g.dart';

@Riverpod(keepAlive: true)
class GameController extends _$GameController {
  @override
  FutureOr<Either<ErrorResp, GameResp>> build() {
    // final userId = SharedPrefs.userID;
    // final roomId = SharedPrefs.getModel('currentRoom', Room.fromJson)!.id;
    // if (userId != null && roomId != null) {
    //   return getPlayerById(userId: userId, roomId: roomId);
    // }
    return right(GameResp.empty());
  }

  Future<Either<ErrorResp, GameResp>> getPlayerById({
    required String userId,
    required String roomId,
  }) async {
    state = const AsyncLoading();
    final gameRepo = ref.read(gameRepositoryProvider);
    Either<ErrorResp, GameResp> result = right(GameResp.empty());
    state = await AsyncValue.guard(() async {
      result = await gameRepo.getPlayerById(
        userId: userId,
        roomId: roomId,
      );
      result.match(
        (l) {
          log('get player failed');
        },
        (r) {
          log('get player success');
        },
      );
      return result;
    });
    return result;
  }

  // start game
  Future<Either<ErrorResp, GameResp>> ready({
    required String userId,
    required String roomId,
    required String nextPhase,
  }) async {
    state = const AsyncLoading();
    final gameRepo = ref.read(gameRepositoryProvider);
    Either<ErrorResp, GameResp> result = Right(GameResp.empty());
    state = await AsyncValue.guard(() async {
      result = await gameRepo.ready(
        userId: userId,
        roomId: roomId,
        nextPhase: nextPhase,
      );
      result.match(
        (l) {
          log('start game failed');
        },
        (r) {
          log('start game success');
        },
      );
      return result;
    });
    return result;
  }
}
