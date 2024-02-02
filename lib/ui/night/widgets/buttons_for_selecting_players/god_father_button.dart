import 'dart:developer';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/utils/dev_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GodFatherButton extends HookConsumerWidget {
  GodFatherButton({
    required this.nightContext,
    required this.situation,
    required playerName,
    required this.height,
  }) : _playerName = playerName;

  final String _playerName;
  final double height;
  final String situation;
  final BuildContext nightContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isPlayerNotSelected = useState(true);

    return InkWell(
      // autofocus: true,
      onLongPress: () async {
        log('on long press', name: 'player_name_widget.dart');
        ['situation in godfather_button', situation].log();
        if (_isPlayerNotSelected.value == true) {
          _isPlayerNotSelected.value = false;
        }
        final isar = await ref.read(isarServiceProvider.future);

        final role = await isar
            .getPlayerByName(_playerName)
            .then((player) => player!.roleName!);

        await Future.delayed(Duration(milliseconds: 700));
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
          // width: _textSize.width + 16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16),

              // content of the widget

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
