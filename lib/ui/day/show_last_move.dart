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
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:auto_mafia/ui/day/grid_list_of_players.dart';
import 'package:auto_mafia/ui/day/list_of_players_for_last_moves.dart';
import 'package:auto_mafia/ui/dialogs/last_move_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:go_router/go_router.dart';

class ShowLastMove extends StatefulHookConsumerWidget {
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
  ConsumerState<ShowLastMove> createState() => _ShowLastMoveState();
}

class _ShowLastMoveState extends ConsumerState<ShowLastMove> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(loadingProvider.notifier).end();
    });
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController(
      initialScrollOffset: 0,
      keepScrollOffset: true,
    );
    //
    final beautifulMindForNostradamous =
        widget.lastMoveName == MyStrings.beautifulMind &&
            widget.playerWithCardRoleName == MyStrings.nostradamous;
    //
    final titleOfButton = switch (widget.lastMoveName) {
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
                widget.pageFlipKeyb1.currentState?.flip();
              },
              child: Image.asset(
                MyAssets.getCardByLastMoveName(widget.lastMoveName),
                width: width,
              ),
            ),
          );
        },
        backBuilder: (_) {
          return widget.lastMoveName == MyStrings.roleReveal
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${widget.playerWithCardName}، ${widget.playerWithCardRoleName} بود',
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
                            playerName: widget.playerWithCardName,
                            disclosured: true,
                            heart: 0,
                          );

                          await god(isGettingDay: false);

                          context.goNamed('night', extra: await Info.night());
                        },
                      ),
                    ],
                  ),
                )
              : beautifulMindForNostradamous
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${widget.playerWithCardName} و در بازی می‌ماند نوستراداموس است',
                          ),
                          SizedBox(height: height / 32),
                          MyButton(
                            title: 'بریم شب بعد',
                            onPressed: () async {
                              final isar =
                                  await ref.read(isarServiceProvider.future);
                              await isar.updatePlayer(
                                playerName: widget.playerWithCardName,
                                disclosured: true,
                                heart: 1,
                              );
                              await god(isGettingDay: false);
                              context.goNamed('night',
                                  extra: await Info.night());
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
                            widget.playerWithCardRoleName,
                            widget.lastMoveName,
                            widget.lastMoveName == MyStrings.silenceOfSheep
                                ? true
                                : false,
                          ),
                          SizedBox(height: height / 16),
                          // button
                          MyButton(
                            title: titleOfButton,
                            onPressed: () => showLastMoveDialog(
                              context: context,
                              lastMoveName: widget.lastMoveName,
                              playerWithCardName: widget.playerWithCardName,
                              playerWithCardRoleName:
                                  widget.playerWithCardRoleName,
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
}
