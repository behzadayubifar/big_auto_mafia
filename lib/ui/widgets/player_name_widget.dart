import 'dart:developer';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/ui/ui_utils/calculate_text_layout_size.dart';
import 'package:auto_mafia/utils/dev_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class PlayerNameWidget extends HookConsumerWidget {
  PlayerNameWidget(
      {required this.situation, required playerName, required this.height})
      : _playerName = playerName;

  // final key = UniqueKey();

  final String _playerName;
  final double height;
  final String situation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isPlayerNotSelected = useState(true);

    final _textSize = calculateTextSize(
      text: _playerName,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Colors.white,
            overflow: TextOverflow.fade,
          ),
      context: context,
    );

    //
    return InkWell(
      // autofocus: true,
      onLongPress: () async {
        log('on long press', name: 'player_name_widget.dart');
        ['situation in player_name_widget', situation].log();
        if (_isPlayerNotSelected.value == true) {
          _isPlayerNotSelected.value = false;
        }
        final isar = await ref.read(isarServiceProvider.future);
        final playersWhoSawTheirRole = (await isar.retrieveGameStatusN(n: 0))!
            .playersWhoSawTheirRole
            ?.toList();
        final role = await isar
            .getPlayerByName(_playerName)
            .then((player) => player!.roleName!);

        await Future.delayed(Duration(milliseconds: 700));

        switch (situation) {
          case MyStrings.showMyRole:
            //p
            return await ref
                .read(currentPlayersProvider.notifier)
                .action(situation);

          case MyStrings.showRoles:
            playersWhoSawTheirRole!.add(_playerName);
            await isar.putGameStatus(
                dayNumber: 0, playersWhoSawTheirRole: playersWhoSawTheirRole);
            context.pushNamed('show-roles', pathParameters: {'role': role});
            return await ref
                .read(currentPlayersProvider.notifier)
                .action(situation, _playerName);
        }
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
              SizedBox(height: 16),
              Text(
                _playerName,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
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