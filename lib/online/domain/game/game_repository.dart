import 'package:auto_mafia/online/data/endpoints.dart';
import 'package:auto_mafia/online/data/models/responses/errors.dart';
import 'package:auto_mafia/online/data/models/responses/game.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../offline/db/shared_prefs/shared_prefs.dart';
import '../../service/dio_provider.dart';

part 'game_repository.g.dart';

class GameRepository {
  final Dio dio;

  GameRepository({required this.dio});

  Future<Either<ErrorResp, GameResp>> startGame({
    required String userId,
    required String roomId,
  }) async {
    final response = await dio.post(
      Endpoints.rediness(roomId),
      queryParameters: {"next_phase": "game_start"},
      options: Options(
        headers: {
          'Authorization': SharedPrefs.userID,
        },
      ),
    );
    if (response.statusCode == 200) {
      return Right(GameResp.fromJson(response.data));
    } else {
      return Left(ErrorResp.fromJson(response.data));
    }
  }
}

@riverpod
GameRepository gameRepository(GameRepositoryRef ref) {
  return GameRepository(dio: ref.read(dioProvider));
}
