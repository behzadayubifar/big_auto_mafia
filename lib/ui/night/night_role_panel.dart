import 'dart:developer';

import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/night_choices_logics.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/common/timers/night_timer.dart';
import 'package:auto_mafia/ui/statements/nostradamous_overlay.dart';
import 'package:auto_mafia/ui/ui_utils/get_criteria_for_night_role_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class NightRolePanel extends HookConsumerWidget {
  NightRolePanel({required this.role, required this.name, Key? key})
      : super(key: key);

  final String role;
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _height = MediaQuery.sizeOf(context).height;
    final _width = MediaQuery.sizeOf(context).width;
    //
    final choice = useState('');
    final nostradamousChoices = useState(<String>[]);
    //
    final String image = Info.imageByRole(role);
    //
    final scrollController = useScrollController(
      initialScrollOffset: 0,
      keepScrollOffset: true,
    );
    //
    //
    final nightFuture = ref
        .watch(isarServiceProvider.future)
        .then((isar) => isar.getNightNumber());
    //
    final asyncPlayers = ref.watch(currentPlayersProvider);
    //
    final criteria = ref.watch(buttonCriteriaControllerProvider);
    //
    final putChoiceLocally = (String newChoice) async {
      print('hop hoop');
      final int numberOfPlayers = await ref
          .read(isarServiceProvider.future)
          .then((isar) => isar.retrievePlayer().then((record) => record.count));
      if (role == MyStrings.nostradamous) {
        final maxOfChoices = numberOfPlayers ~/ 3;
        if (nostradamousChoices.value.length < maxOfChoices) {
          nostradamousChoices.value.add(newChoice);
        } else {
          nostradamousChoices.value.removeAt(0);
          nostradamousChoices.value.add(newChoice);
        }
      } else {
        if (choice.value == newChoice) {
          choice.value = '';
        } else {
          choice.value = newChoice;
        }
      }
    };
    //
    final finisher = () async {
      // it works BUT must be a more handle on loding states
      await buttonLogicExecuter(
        currentPlayerName: name,
        currentPlayerRole: role,
        night: await nightFuture,
        selectedPlayer: choice.value,
      );
      if (await nightFuture != 0 || role != MyStrings.nostradamous) {
        context.pop();
        print(choice.value);
        // below must be after the buttonLogicExecuter (certainly!!!)
        await ref
            .read(currentPlayersProvider.notifier)
            .action(MyStrings.nightPage);
      }
    };
    //
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // background
              Image.asset(
                MyAssets.nightBg,
                width: _width,
                fit: BoxFit.cover,
              ),

              // moon
              Positioned(
                top: _height / 14,
                left: _width / 5.3,
                child: Image.asset(
                  MyAssets.moon,
                  width: _width / 1.4,
                  fit: BoxFit.cover,
                ),
              ),

              // texts --->
              Positioned(
                top: _height / 7,
                left: _width / 4.5,
                child: SizedBox(
                  width: _width / 1.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // a dashed line for separating
                      Text(
                        role,
                        style: MyTextStyles.rolePanel,
                      ),

                      SizedBox(
                        height: _height / 24,
                      ),

                      Image.asset(
                        MyAssets.dashedLine,
                        width: _width / 3.2,
                        fit: BoxFit.cover,
                      ),

                      SizedBox(
                        height: _height / 16,
                      ),

                      Text(
                        name,
                        style: MyTextStyles.rolePanel,
                      ),

                      SizedBox(
                        height: _height / 32,
                      ),

                      // role-of-selectedPlayer
                      Image.asset(
                        image,
                        width: _width / 4.2,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
              // <--- texts

              // list-of-players
              Positioned(
                top: _height / 2.8,
                // right: _width / 3.2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // timer && buttons (for finishing earlier than the time was set)
                    ControlPanel(
                        width: _width, height: _height, finisher: finisher),
                    // people
                    asyncPlayers.when(
                      data: (playersList) => playersList.isEmpty
                          ? SizedBox()
                          : SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: SizedBox(
                                width: _width / 1.5,
                                height: _height / 1.5,
                                child: SafeArea(
                                  minimum: EdgeInsets.only(top: _height / 15),
                                  child: Scrollbar(
                                    controller: scrollController,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            width: _width / 2,
                                            height: _height / 1.64,
                                            child: ListView.separated(
                                              controller: scrollController,
                                              cacheExtent: _height / 1.64,
                                              restorationId: 'night-page',
                                              clipBehavior: Clip.antiAlias,
                                              itemCount: playersList.length,
                                              itemBuilder: (context, index) {
                                                final selectedPlayer =
                                                    playersList[index];
                                                return MyButton(
                                                  title: selectedPlayer
                                                      .playerName!,
                                                  player: selectedPlayer,
                                                  selected: selectedPlayer
                                                          .playerName ==
                                                      choice.value,
                                                  place: MyStrings.nightPlayer,

                                                  // criteria: ,
                                                  onDoubleTap: role !=
                                                          MyStrings.godfather
                                                      ? null
                                                      : () async =>
                                                          putGodfatherChoice(
                                                            night:
                                                                await nightFuture,
                                                            name: selectedPlayer
                                                                .playerName!,
                                                            guessedRole:
                                                                selectedPlayer
                                                                    .roleName!,
                                                          ),
                                                  // onLongPress: putChoiceLocally,
                                                  onPressed: () =>
                                                      putChoiceLocally(
                                                          selectedPlayer
                                                              .playerName!),
                                                  /* () => choice.value =
                                                selectedPlayer.playerName!, */
                                                );
                                              },
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return SizedBox(
                                                    height: _height / 56);
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: _height / 8),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      loading: () => Center(child: defaultLoading),
                      error: (error, stackTrace) => Text(
                        'Error: $error',
                        // style: MyTextStyles.error,
                      ),
                    ),
                  ],
                ),
              ),

              // timer && buttons (for finishing earlier than the time was set)
            ],
          ),
        ),
      ),
    );
  }
}

class ControlPanel extends StatelessWidget {
  const ControlPanel({
    super.key,
    required double width,
    required double height,
    required this.finisher,
  })  : _width = width,
        _height = height;

  final double _width;
  final double _height;
  final Future<Null> Function() finisher;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NightTimer(
          width: _width / 4.8,
          height: _height / 4.8,
          onComplete: finisher,
        ),
        MyButton(
          title: MyStrings.finish,
          onLongPress: finisher,
        ),
        SizedBox(height: _height / 8),
      ],
    );
  }
}
