import 'package:auto_mafia/online/data/endpoints.dart';
import 'package:auto_mafia/online/data/models/responses/errors.dart';
import 'package:auto_mafia/online/data/models/responses/game.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../offline/db/entities/user.dart';
import '../../../offline/db/shared_prefs/shared_prefs.dart';
import '../../service/dio_provider.dart';

part 'game_repository.g.dart';

class GameRepository {
  final Dio dio;

  GameRepository({required this.dio});

  Future<Either<ErrorResp, GameResp>> getPlayerById({
    required String userId,
    required String roomId,
  }) async {
    final response = await dio.get(
      Endpoints.getPlayerById(roomId),
      options: Options(
        headers: {
          'Authorization': SharedPrefs.getString("token"),
        },
      ),
    );
    if (response.statusCode == 200) {
      return Right(GameResp.fromJson(response.data));
    } else {
      return Left(ErrorResp.fromJson(response.data));
    }
  }

  Future<Either<ErrorResp, GameResp>> ready({
    required String userId,
    required String roomId,
    required String nextPhase,
  }) async {
    final response = await dio.post(
      Endpoints.rediness(roomId),
      queryParameters: {"next_phase": nextPhase},
      options: Options(
        headers: {
          'Authorization': SharedPrefs.getString("token"),
        },
      ),
    );
    if (response.statusCode == 200) {
      return Right(GameResp.fromJson(response.data));
    } else {
      return Left(ErrorResp.fromJson(response.data));
    }
  }

  Future<Either<ErrorResp, GameResp>> getGameSituation(String roomId) async {
    final response = await dio.get(
      Endpoints.getGameSituation(roomId),
      options: Options(
        headers: {
          'Authorization': SharedPrefs.getString("token"),
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
