import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/db/entities/game_status.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/last_moves_logics.dart';
import 'package:auto_mafia/logic/logics.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/day/grid_list_of_players.dart';
import 'package:auto_mafia/ui/dialogs/last_move_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:go_router/go_router.dart';

class ShowLastMove extends HookConsumerWidget {
  ShowLastMove({
    super.key,
    required this.lastMoveName,
    required this.playerWithCardName,
    required this.playerWithCardRoleName,
  });

  final String lastMoveName;
  final String playerWithCardName;
  final String playerWithCardRoleName;

  final pageFlipKeyb1 = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController(
      initialScrollOffset: 0,
      keepScrollOffset: true,
    );
    //
    final beautifulMindForNostradamous =
        lastMoveName == MyStrings.beautifulMind &&
            playerWithCardRoleName == MyStrings.nostradamous;
    //
    final titleOfButton = switch (lastMoveName) {
      MyStrings.faceOff => 'تعویض نقش',
      MyStrings.beautifulMind => 'نوستراداموس است',
      MyStrings.silenceOfSheep => 'اهدای سکوت',
      MyStrings.roleReveal => 'اعلام نقش',
      MyStrings.handCuff => 'دستبند بده',
      _ => 'اشتباه',
    };
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //
    final asyncAlivePlayers = ref.watch(currentPlayersProvider);
    //
    final selectedPlayers = useState(<String>[]);
    //
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: PageFlipBuilder(
        frontBuilder: (_) {
          return Center(
            child: GestureDetector(
              onTap: () {
                print('on tap');
                pageFlipKeyb1.currentState?.flip();
              },
              child: Image.asset(
                MyAssets.getCardByLastMoveName(lastMoveName),
                width: width,
              ),
            ),
          );
        },
        backBuilder: (_) {
          return lastMoveName == MyStrings.roleReveal
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$playerWithCardName، $playerWithCardRoleName بود',
                        style: MyTextStyles.bodyLarge
                            .copyWith(color: AppColors.lighterGrey),
                      ),
                      SizedBox(height: height / 32),
                      MyButton(
                        title: 'بریم شب بعد',
                        onPressed: () async {
                          final isar =
                              await ref.read(isarServiceProvider.future);

                          await isar.updatePlayer(
                            playerName: playerWithCardName,
                            disclosured: true,
                            heart: 0,
                          );

                          await god(isGettingDay: false);

                          context.goNamed('night', extra: Info.night);
                        },
                      ),
                    ],
                  ),
                )
              : beautifulMindForNostradamous
                  ? Center(
                      child: Column(
                        children: [
                          Text(
                            '$playerWithCardName و در بازی می‌ماند نوستراداموس است',
                          ),
                          SizedBox(height: height / 32),
                          MyButton(
                            title: 'بریم شب بعد',
                            onPressed: () async {
                              final isar =
                                  await ref.read(isarServiceProvider.future);
                              await isar.updatePlayer(
                                playerName: playerWithCardName,
                                disclosured: true,
                                heart: 1,
                              );
                              await god(isGettingDay: false);
                              context.goNamed('night', extra: Info.night);
                            },
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // list of players
                          listOfPlayersForLastMoves(
                            asyncAlivePlayers,
                            height,
                            width,
                            selectedPlayers,
                            scrollController,
                            playerWithCardRoleName,
                          ),
                          SizedBox(height: height / 16),
                          // button
                          MyButton(
                            title: titleOfButton,
                            onPressed: () => showLastMoveDialog(
                              context: context,
                              lastMoveName: lastMoveName,
                              playerWithCardName: playerWithCardName,
                              playerWithCardRoleName: playerWithCardRoleName,
                              selectedPlayers: selectedPlayers.value,
                            ),
                          ),
                        ],
                      ),
                    );
        },
      ),
    );
  }

  Widget listOfPlayersForLastMoves(
    AsyncValue<List<Player>> asyncAlivePlayers,
    double height,
    double width,
    ValueNotifier<List<String>> selectedPlayers,
    ScrollController scrollController,
    String playerWithCardRoleName,
  ) {
    Widget widget = SizedBox();
    switch (lastMoveName) {
      case MyStrings.faceOff:
      case MyStrings.handCuff:
      case MyStrings.silenceOfSheep:
      case MyStrings.beautifulMind:
        widget = GridOfPlayers(
          asyncAlivePlayers: asyncAlivePlayers,
          height: height,
          width: width,
          selectedPlayers: selectedPlayers,
          scrollController: scrollController,
          axix: Axis.vertical,
        );
        break;
      case MyStrings.roleReveal:
        widget = Center(
          child: Text(
            'نقش شما: $playerWithCardRoleName',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
        break;
    }
    return widget;
  }
}
