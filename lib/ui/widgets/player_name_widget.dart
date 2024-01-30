import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/ui/ui_utils/calculate_text_layout_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayerNameWidget extends HookConsumerWidget {
  PlayerNameWidget(
      {required this.situation,
      Key? key,
      required playerName,
      required this.height})
      : _playerName = playerName, // 'بازیکن 1'
        super(key: key);

  final String _playerName;
  final double height;
  final String situation;

  // bool situationCriteria() {
  //   criter
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isar = ref.watch(isarServiceProvider.future);
    final _isPlayerSelected = useState(false);
    final criteria = switch (situation) {
      MyStrings.nightPage => !_isPlayerSelected.value,
      MyStrings.showRoles => !_isPlayerSelected.value,
      _ => false,
    };
    //
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
      autofocus: true,
      onLongPress: () async {
        final isar = await _isar;
        // if (_isPlayerSelected.value != true) {
        //   _isPlayerSelected.value = !_isPlayerSelected.value;
        //   await (await _isar).putGameStatus(
        //       dayNumber: -1, playersWhoSawTheirRole: [_playerName]);
        // }
        if (situation == MyStrings.showRoles) {
          if (_isPlayerSelected.value != true) {
            _isPlayerSelected.value = !_isPlayerSelected.value;
          }
          await isar.updatePlayer(
            playerName: _playerName,
            // nightDone: true,
            heart: 0,
          );
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
              criteria ? AppColors.tintsOfBlack[2] : AppColors.primaries[1],
              criteria ? AppColors.primaries[2] : AppColors.primaries[0]
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          boxShadow: [
            criteria
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
                      color: criteria
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
