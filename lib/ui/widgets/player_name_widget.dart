import 'dart:developer';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/logics_utils.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:auto_mafia/ui/ui_utils/calculate_text_layout_size.dart';
import 'package:auto_mafia/utils/dev_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class PlayerNameWidget extends HookConsumerWidget {
  PlayerNameWidget({
    required this.nightContext,
    required this.situation,
    required this.playerName,
    required this.height,
  });

  // final key = UniqueKey();

  final String playerName;
  final double height;
  final String situation;
  final BuildContext nightContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isPlayerNotSelected = useState(true);

    final _textSize = calculateTextSize(
      text: playerName,
      style: Theme.of(nightContext).textTheme.headlineSmall!.copyWith(
            color: Colors.white,
            overflow: TextOverflow.fade,
          ),
      context: nightContext,
    );

    //
    return InkWell(
      // autofocus: true,
      onLongPress: () async {
        ref.read(loadingProvider.notifier).toggle();
        log('on long press', name: 'player_name_dart');
        ['situation in player_name_widget', situation].log();
        if (_isPlayerNotSelected.value == true) {
          _isPlayerNotSelected.value = false;
        }
        final isar = await ref.read(isarServiceProvider.future);

        final role = await isar
            .getPlayerByName(playerName)
            .then((player) => player!.roleName!);

        await Future.delayed(Duration(milliseconds: 700));

        switch (situation) {
          case MyStrings.showMyRole:
            // go to
            await ref.read(currentPlayersProvider.notifier).action(situation);

          // if (!nightContext.mounted) return;

          case MyStrings.showRoles:
            // go to show-roles
            final playersWhoSawTheirRole =
                (await isar.retrieveGameStatusN(n: 0))!
                    .playersWhoSawTheirRole
                    .toList();

            print(playersWhoSawTheirRole);

            playersWhoSawTheirRole.add(playerName);

            print(playersWhoSawTheirRole);

            await isar.putGameStatus(
              dayNumber: 0,
              playersWhoSawTheirRole: playersWhoSawTheirRole,
            );
            // if (!nightContext.mounted) return;
            // ref.read(loadingProvider.notifier).toggle();

            await ref
                .read(currentPlayersProvider.notifier)
                .action(situation, playerName);

            nightContext.pushReplacementNamed(
              'show-roles',
              pathParameters: {'role': role},
            );

          case MyStrings.nightPage:
            late final bool mafiaHasBullet;
            print('nightPage is in action now');
            final relatedRolePage = MyStrings.pageByRole(role);
            log('$relatedRolePage', name: 'relatedRolePage');
            // go to panel and customize the elements of
            // panel-page baesed on role
            // 1. role-specifics
            // 2. list-of-players due to current circumstances
            final isar = await ref.read(isarServiceProvider.future);
            final dayNumber = await isar.getDayNumber();
            final int tonight = await isar.getNightNumber();

            await isar.putGameStatus(
              dayNumber: dayNumber,
              situation: relatedRolePage,
            );

            await ref
                .read(currentPlayersProvider.notifier)
                .action(relatedRolePage, playerName);

            final bool isGodfatherIsAlive = await isar
                .retrievePlayer(
                  criteria: (player) =>
                      player.roleName == roleNames[RoleName.godfather],
                )
                .then((record) => record.players.isNotEmpty
                    ? record.players.first.isAlive
                    : false);

            print("tonight is $tonight");

            final hasMafiaBuyedTonight = await isar
                    .retrieveNightN(n: tonight)
                    .then((result) => result.match(
                        (json) => json
                            .filterWithKey((key, value) => key == 'saulChoice')
                            .values
                            .singleOrNull
                            ?.isNotEmpty,
                        (r) => null)) ??
                false;

            mafiaHasBullet = await isar.retrieveGameStatusN(n: dayNumber).then(
                    (gameStatus) => gameStatus!.remainedMafiasBullets! > 0) &&
                !hasMafiaBuyedTonight;

            final playersListForShootInAbsenceOfGodfather = await isar
                .retrievePlayer(
                  criteria: (player) => player.type != RoleType.mafia,
                )
                .then((record) => record.players);

            final int code = await isar.retrieveAssignedCodes().then(
                  (mapOfCodes) => mapOfCodes[playerName]!,
                );

            final isHandCuffed = await isar
                .getPlayerByName(playerName)
                .then((Player? player) => player!.handCuffed!);

            final isOneOfMafiaDead = await isar
                    .retrievePlayer(
                      isAlive: false,
                      criteria: (player) => player.type == RoleType.mafia,
                    )
                    .then((record) => record.count) >
                0;

            // final hasMafiaBuyedOnce = await isar
            //     .retrieveNightN(n: tonight)
            //     .then((result) => result.match(
            //         (json) => json
            //             .filterWithKey((key, value) => key == 'saulChoice')
            //             .values
            //             .singleOrNull
            //             ?.isNotEmpty,
            //         (r) => null));

            final hasMafiaBuyedOnce = await isar
                .retrieveGameStatusN(n: tonight)
                .then((status) => status!.hasMafiaBuyedOnce);

            final isReNight = await isar
                .retrieveGameStatusN(
                  n: tonight,
                )
                .then((status) => status!.isReNight);

            List<Player>? otherMafias;
            if (isMafia(role))
              otherMafias = await isar
                  .retrievePlayer(
                    criteria: (player) =>
                        player.type == RoleType.mafia &&
                        player.playerName != playerName,
                  )
                  .then((rec) => rec.players);

            final info = {
              'name': playerName,
              'role': role,
              'code': code.toString(),
              'isGodfatherAlive': isGodfatherIsAlive,
              'mafiaHasBullet': mafiaHasBullet,
              'otherMafias': otherMafias,
              'night': tonight,
              'playersListForShootInAbsenceOfGodfather':
                  playersListForShootInAbsenceOfGodfather,
              'isHandCuffed': isHandCuffed,
              'isOneOfMafiaDead': isOneOfMafiaDead,
              'hasMafiaBuyedOnce': hasMafiaBuyedOnce,
              'isRenight': isReNight,
            };

            print('from GoRouter: $info');

            // if (nightContext.mounted)

            nightContext.goNamed(
              'night_role_panel',
              extra: info,
            );
        }
        // _container.read(loadingProvider.notifier).toggle();
      },
      child: AnimatedContainer(
        height: height / 12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          gradient: LinearGradient(
            colors: [
              _isPlayerNotSelected.value
                  ? AppColors.tintsOfBlack[2]
                  : AppColors.primaries[1],
              _isPlayerNotSelected.value
                  ? AppColors.primaries[2]
                  : AppColors.primaries[0]
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          boxShadow: [
            _isPlayerNotSelected.value
                ? BoxShadow(
                    color: AppColors.primaries[1].withOpacity(0.8),
                    blurRadius: 8,
                    offset: Offset(0, 8),
                    spreadRadius: 1,
                  )
                : BoxShadow(
                    color: AppColors.tintsOfBlack[1].withOpacity(0.5),
                    blurRadius: 8,
                    offset: Offset(2, 4),
                  ),
          ],
        ),
        duration: Duration(milliseconds: 400),
        child: SizedBox(
          width: _textSize.width + 16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 16),

              // content of the widget
              Text(
                playerName,
                style: Theme.of(nightContext).textTheme.headlineSmall!.copyWith(
                      color: _isPlayerNotSelected.value
                          ? Colors.white
                          : AppColors.backGround.withOpacity(0.9),
                      overflow: TextOverflow.fade,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// class PlayerNameWidget extends StatefulHookConsumerWidget {
//   const PlayerNameWidget({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _PlayerNameWidgetState();
// }

// class _PlayerNameWidgetState extends ConsumerState<PlayerNameWidget> {
//   @override
//   Widget build(BuildnightContext nightContext) {
//     return Container();
//   }
// }
