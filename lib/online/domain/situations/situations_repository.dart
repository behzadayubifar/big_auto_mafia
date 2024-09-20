import 'package:auto_mafia/online/data/models/responses/situations.dart';
import 'package:auto_mafia/online/service/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../offline/db/shared_prefs/shared_prefs.dart';
import '../../data/endpoints.dart';
import '../../data/models/responses/errors.dart';

part 'situations_repository.g.dart';

class SituationsRepository {
  final Dio dio;

  SituationsRepository({required this.dio});

  Future<Either<ErrorResp, SituationsResp>> getSituation(String roomId) async {
    final response = await dio.get(
      Endpoints.getGameSituation(roomId),
      options: Options(
        headers: {
          'Authorization': SharedPrefs.getString("token"),
        },
      ),
    );
    if (response.statusCode == 200) {
      return Right(SituationsResp.fromJson(response.data));
    } else {
      return Left(ErrorResp.fromJson(response.data));
    }
  }
}

@riverpod
SituationsRepository situationsRepository(SituationsRepositoryRef ref) {
  return SituationsRepository(dio: ref.read(dioProvider));
}
