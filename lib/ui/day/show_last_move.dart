import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/entities/game_status.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/last_moves_logics.dart';
import 'package:auto_mafia/logic/logics.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/day/grid_list_of_players.dart';
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

  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController(
      initialScrollOffset: 0,
      keepScrollOffset: true,
    );
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
      body: PageFlipBuilder(
        frontBuilder: (context) {
          return GestureDetector(
            onTap: () {
              print('on tap');
              pageFlipKey.currentState!.flip();
            },
            child: Image.asset(
              MyAssets.getCardByLastMoveName(lastMoveName),
              width: width / 1.5,
            ),
          );
        },
        backBuilder: (context) {
          return Column(
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

              // button
              MyButton(
                  title: titleOfButton,
                  onPressed: () async {
                    switch (lastMoveName) {
                      case MyStrings.faceOff:
                        faceOff(
                          playerWithCardName: playerWithCardName,
                          otherPlayerName: selectedPlayers.value.first,
                        );
                        break;
                      case MyStrings.handCuff:
                        handCuff(playerName: selectedPlayers.value.first);
                        break;
                      case MyStrings.silenceOfSheep:
                        silenceOfSheep(playerName: selectedPlayers.value.first);
                        break;
                      case MyStrings.roleReveal:
                        identityReveal(playerName: selectedPlayers.value.first);
                        break;
                      case MyStrings.beautifulMind:
                        beautifulMind(
                            guessedToBeNostradamous:
                                selectedPlayers.value.first);
                        break;
                      default:
                        print('no last move');
                    }
                    await god(isGettingDay: true);
                    context.goNamed('night-page', extra: Info.night);
                  }),
            ],
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
