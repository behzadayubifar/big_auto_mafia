import 'package:auto_mafia/online/service/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../offline/db/shared_prefs/shared_prefs.dart';
import '../../data/endpoints.dart';
import '../../data/models/responses/errors.dart';
import '../../data/models/responses/votes.dart';

part 'votes_repository.g.dart';

class VotesRepository {
  final Dio dio;

  VotesRepository({required this.dio});

  Future<Either<ErrorResp, VoteResp>> vote({
    required String roomId,
    required List<String> voted,
    required int dayNum,
  }) async {
    final response = await dio.post(
      Endpoints.vote,
      data: {
        'room_id': roomId,
        'day_num': dayNum,
        'voted': voted,
      },
      options: Options(
        headers: {
          'Authorization': {await SharedPrefs.getString('token')},
        },
      ),
    );
    if (response.statusCode == 201) {
      return Right(VoteResp.fromJson(response.data));
    } else {
      return Left(ErrorResp.fromJson(response.data));
    }
  }

  Future<Either<ErrorResp, VoteResp>> getVotes({
    required String roomId,
    required int dayNum,
    required int level,
  }) async {
    final response = await dio.get(
      Endpoints.getVotes(roomId, dayNum, level),
      options: Options(
        headers: {
          'Authorization': {await SharedPrefs.getString('token')},
        },
      ),
    );
    if (response.statusCode == 200) {
      return Right(VoteResp.fromJson(response.data));
    } else {
      return Left(ErrorResp.fromJson(response.data));
    }
  }
}

@riverpod
VotesRepository votesRepository(VotesRepositoryRef ref) {
  return VotesRepository(dio: ref.read(dioProvider));
}
