import 'dart:developer';

import 'package:auto_mafia/online/data/models/responses/errors.dart';
import 'package:auto_mafia/online/data/models/responses/situations.dart';
import 'package:auto_mafia/online/domain/situations/situations_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'situations_controller.g.dart';

@Riverpod(keepAlive: true)
class SituationsController extends _$SituationsController {
  @override
  FutureOr<Either<ErrorResp, SituationsResp>> build() {
    return right(SituationsResp());
  }

  Future<Either<ErrorResp, SituationsResp>> getSituation(String roomId) async {
    state = const AsyncLoading();
    final gameRepo = ref.read(situationsRepositoryProvider);
    Either<ErrorResp, SituationsResp> result = right(SituationsResp.empty());
    state = await AsyncValue.guard(() async {
      result = await gameRepo.getSituation(roomId);
      result.match(
        (l) {
          log('get game situation failed');
        },
        (r) {
          log('get game situation success');
        },
      );
      return result;
    });
    return result;
  }
}
