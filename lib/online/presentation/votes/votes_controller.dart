import 'dart:async';
import 'dart:developer';

import 'package:auto_mafia/offline/db/shared_prefs/shared_prefs.dart';
import 'package:auto_mafia/online/data/models/responses/errors.dart';
import 'package:auto_mafia/online/data/models/responses/votes.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../offline/db/entities/room.dart';
import '../../../offline/db/isar_service.dart';
import '../../domain/votes/votes_repository.dart';

part 'votes_controller.g.dart';

@riverpod
class VotesController extends _$VotesController {
  @override
  FutureOr<Either<ErrorResp, VoteResp>> build() {
    return right(VoteResp(msg: "mio"));
  }

  Future<Either<ErrorResp, VoteResp>> vote({
    required List<String> voted,
  }) async {
    state = const AsyncLoading();
    final currentRoom = SharedPrefs.getModel("currentRoom", Room.fromJson);
    final isar = await ref.read(isarServiceProvider.future);
    final situation = await isar.retrieveSituation(currentRoom!.id!);
    Either<ErrorResp, VoteResp> voteResult = right(VoteResp.empty());
    final votesRepo = ref.read(votesRepositoryProvider);
    state = await AsyncValue.guard(
      () async {
        voteResult = await votesRepo.vote(
          roomId: currentRoom.id!,
          voted: voted,
          dayNum: situation!.dayNumber!,
        );

        voteResult.match(
          (l) {
            log('vote failed');
          },
          (r) {
            log('vote success');
          },
        );
        return voteResult;
      },
    );
    return voteResult;
  }

  Future<Either<ErrorResp, VoteResp>> getVotes({
    required int level,
  }) async {
    final link = ref.keepAlive();
    Timer? timer;
    // final cancelToken = CancelToken();
    ref.onDispose(() {
      timer?.cancel();
      link.close();
    });

    ref.onCancel(() {
      timer = Timer(
        const Duration(seconds: 30),
        () {
          link.close();
        },
      );
    });

    ref.onResume(() {
      timer?.cancel();
    });

    Either<ErrorResp, VoteResp> votesResult = right(VoteResp.empty());
    state = await AsyncValue.guard(
      () async {
        //
        final currentRoom = SharedPrefs.getModel("currentRoom", Room.fromJson);
        final isar = await ref.read(isarServiceProvider.future);
        final situation = await isar.retrieveSituation(currentRoom!.id!);
        final votesRepo = ref.read(votesRepositoryProvider);
        //
        votesResult = await votesRepo.getVotes(
          roomId: currentRoom.id!,
          dayNum: situation!.dayNumber!,
          level: level,
        );

        await votesResult.match(
          (l) {
            log('get votes failed');
          },
          (r) async {
            log('get votes success');
            //
          },
        );
        print('votesResult: $votesResult');

        return votesResult;
      },
    );
    return votesResult;
  }
}
