import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/logics.dart';
import 'package:auto_mafia/logic/logics_utils.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:auto_mafia/ui/day/grid_list_of_players.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Day extends HookConsumerWidget {
  const Day({required this.dayNumber, super.key});

  final int dayNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    //
    final scrollController = useScrollController(
      initialScrollOffset: 0,
      keepScrollOffset: true,
    );

    //
    final asyncAlivePlayers = ref.watch(currentPlayersProvider);
    //
    late final String lastMove;
    //

    final isGettingNight = useState(false);
    final selectedPlayers = useState(<String>[]);

    return Scaffold(
      body: Stack(
        children: [
          // background
          Image.asset(
            MyAssets.dayBg,
            width: _width,
            fit: BoxFit.cover,
          ),
          // day number
          Positioned(
            child: Text.rich(
              TextSpan(
                text: 'روز',
                style: MyTextStyles.bodyMD,
                children: [
                  TextSpan(
                    text: ' $dayNumber',
                    style: MyTextStyles.displayMedium,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            top: _height / 3.6,
            right: _width / 2.5,
          ),

          // a list of alive players which are clickable
          Positioned(
            top: _height / 2.5,
            right: _width / 16,
            child: GridOfPlayers(
              asyncAlivePlayers: asyncAlivePlayers,
              height: _height,
              width: _width,
              selectedPlayers: selectedPlayers,
              scrollController: scrollController,
            ),
          ),

          // MyButton(title: 'قرعۀ مرگ')
          if (dayNumber != 0)
            Positioned(
              bottom: _height / 4,
              left: _width / 16,
              child: AnimatedOpacity(
                opacity: selectedPlayers.value.length <= 1 ? 0 : 1,
                duration: Duration(milliseconds: 400),
                child: MyButton(
                  title: 'قرعۀ مرگ',
                  onPressed: () {
                    selectedPlayers.value = [
                      getARandomPlayer(selectedPlayers.value)
                    ];
                  },
                ),
              ),
            ),

          // buttons for death and lastMove
          if (dayNumber != 0)
            AnimatedPositioned(
              bottom: _height / 4,
              right: selectedPlayers.value.length == 1
                  ? _width / 3.5
                  : _width / 20,
              duration: Duration(milliseconds: 400),
              child: AnimatedOpacity(
                opacity: selectedPlayers.value.isEmpty ? 0 : 1,
                duration: Duration(milliseconds: 400),
                child: MyButton(
                    title: 'حرکت آخر',
                    onPressed: () async {
                      final isar = await ref.read(isarServiceProvider.future);
                      lastMove = await getARandomLastMove();
                      final String playerWithCardName =
                          selectedPlayers.value[0];
                      final String playerWithCardRoleName = await ref
                          .read(isarServiceProvider.future)
                          .then((isar) => isar
                              .getPlayerByName(playerWithCardName)
                              .then((player) => player!.roleName!));

                      final usedLastMoves = await isar
                          .retrieveGameStatusN(n: dayNumber)
                          .then((status) => status?.usedLastMoves);

                      await isar.putGameStatus(
                          dayNumber: dayNumber,
                          usedLastMoves: [...?usedLastMoves, (lastMove)]);

                      await isar.updatePlayer(
                        playerName: playerWithCardName,
                        heart: 0,
                      );

                      await ref
                          .read(currentPlayersProvider.notifier)
                          .action(MyStrings.dayPage);

                      context.go(
                          '/last_move/$lastMove/$playerWithCardName/$playerWithCardRoleName');
                    }),
              ),
            ),

          // moon to night
          Positioned(
            bottom: _height / 64,
            left: _width / 2.7,
            child: GestureDetector(
              onLongPress: () async {
                isGettingNight.value = !isGettingNight.value;
                await Future.delayed(Duration(milliseconds: 600));

                // final isar = await ref.read(isarServiceProvider.future);

                await god(isGettingDay: false);
                await ref
                    .read(currentPlayersProvider.notifier)
                    .action(MyStrings.nightPage);

                context.goNamed('night', extra: await Info.night());
              },
              child: AnimatedContainer(
                child: Image.asset(MyAssets.excludeForMoonInDay),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(MyAssets.moonInDay),
                    alignment: Alignment.topCenter,
                    scale: .96,
                    colorFilter: ColorFilter.mode(
                      isGettingNight.value
                          ? AppColors.secondaries[3]
                          : Colors.transparent,
                      BlendMode.srcATop,
                    ),
                  ),
                ),
                duration: Duration(milliseconds: 400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
