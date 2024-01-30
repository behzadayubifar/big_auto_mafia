import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/ui/common/title_widget.dart';
import 'package:auto_mafia/ui/widgets/player_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class NightPage extends ConsumerWidget {
  NightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    // watch players Who Has Not Done Their Night Job
    final players = ref.watch(alivePlayersProvider);
    // players.
    print('a');
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: switch (players) {
        AsyncData(:final value) => SafeArea(
            minimum: EdgeInsets.only(top: height / 15),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TiTleTile(title: MyStrings.rolesTitiel),
                  Spacer(),
                  SizedBox(
                    width: width / 1.5,
                    height: height / 1.64,
                    child: ListView.separated(
                      clipBehavior: Clip.antiAlias,
                      // shrinkWrap: true,
                      physics: RangeMaintainingScrollPhysics(),
                      itemCount: value.players.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            GestureDetector(
                              // refresh the data on long press
                              onLongPress: () {
                                ref.refresh(alivePlayersProvider);
                              },
                              child: PlayerNameWidget(
                                playerName: value.players[index].playerName,
                                height: height,
                                // situation: MyStrings.nightPage,
                                situation: MyStrings.showRoles,
                              ),
                            ),
                            SizedBox(
                              height: height / 64,
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: height / 48);
                      },
                    ),
                  ),
                  SizedBox(height: height / 6),
                ],
              ),
            ),
          ),
        // TODO: Handle this case.
        _ => LoadingAnimationWidget.hexagonDots(
            size: 100,
            color: AppColors.primaries[2],
          ),
      },
      /* playersProvider.when(
        data: (players) {
          if (!players.isEmpty) {
            return SafeArea(
              // maintainBottomViewPadding: true,
              minimum: EdgeInsets.only(top: height / 15),
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TiTleTile(title: MyStrings.rolesTitiel),
                    Spacer(),
                    SizedBox(
                      width: width / 1.5,
                      height: height / 1.64,
                      child: ListView.separated(
                        clipBehavior: Clip.antiAlias,
                        // shrinkWrap: true,
                        physics: RangeMaintainingScrollPhysics(),
                        itemCount: players.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              GestureDetector(
                                // refresh the data on long press
                                onLongPress: () {
                                  ref.refresh(alivePlayersProvider);
                                },
                                child: PlayerNameWidget(
                                  playerName: players[index].playerName,
                                  height: height,
                                  // situation: MyStrings.nightPage,
                                  situation: MyStrings.showRoles,
                                ),
                              ),
                              SizedBox(
                                height: height / 64,
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: height / 48);
                        },
                      ),
                    ),
                    SizedBox(height: height / 6),
                  ],
                ),
              ),
            );
          
          }
          return Container();
        },
        error: (error, stackTrace) {
          return Container();
        },
        loading: () => LoadingAnimationWidget.hexagonDots(
          size: 100,
          color: AppColors.primaries[2],
        ),
      ), */
    );
  }
}
