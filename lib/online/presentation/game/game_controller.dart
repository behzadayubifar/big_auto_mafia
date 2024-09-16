import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/responses/errors.dart';
import '../../data/models/responses/game.dart';
import '../../domain/game/game_repository.dart';

part 'game_controller.g.dart';

@riverpod
class GameController extends _$GameController {
  @override
  FutureOr<Either<ErrorResp, GameResp>> build() {
    return right(GameResp.empty());
  }

  // start game
  Future<Either<ErrorResp, GameResp>> startGame({
    required String userId,
    required String roomId,
  }) async {
    state = const AsyncLoading();
    final gameRepo = ref.read(gameRepositoryProvider);
    Either<ErrorResp, GameResp> result = Right(GameResp.empty());
    state = await AsyncValue.guard(() async {
      result = await gameRepo.startGame(userId: userId, roomId: roomId);
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
