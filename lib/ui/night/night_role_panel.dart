import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/night_choices_logics.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';

import 'package:auto_mafia/ui/night/control_panel.dart';
import 'package:auto_mafia/ui/night/list_of_night_players_widget.dart';
import 'package:auto_mafia/ui/night/roles_names_list_widget.dart';

import 'package:auto_mafia/ui/ui_utils/get_criteria_for_night_role_panel.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class NightRolePanel extends HookConsumerWidget {
  NightRolePanel({
    required this.role,
    required this.name,
    required this.code,
    required this.isHandCuffed,
    this.isGodfatherAlive,
    this.playersListForShootInAbsenceOfGodfather,
    this.mafiaHasBullet,
    this.isOneOfMafiaDead,
    this.hasMafiaBuyedOnce,
    this.night,
    Key? key,
  }) : super(key: key);

  final String role;
  final String name;
  final String code;
  final bool? isGodfatherAlive;
  final List<Player>? playersListForShootInAbsenceOfGodfather;
  final bool? mafiaHasBullet;
  final bool isHandCuffed;
  final int? night;
  final bool? isOneOfMafiaDead;
  final bool? hasMafiaBuyedOnce;

  final CountDownController timerController = CountDownController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    bool? saulCanBuy = false;
    if (isOneOfMafiaDead != null && hasMafiaBuyedOnce != null) {
      saulCanBuy =
          role == MyStrings.saul && isOneOfMafiaDead! && !hasMafiaBuyedOnce!;
    }
    //
    // print(night);
    final _height = MediaQuery.sizeOf(context).height;
    final _width = MediaQuery.sizeOf(context).width;
    //
    final choice = useState('');
    final nostradamousChoices = useState(<String>[]);
    final shootOrSlaughter =
        useState((role == MyStrings.godfather && isHandCuffed) ? 'shoot' : '');
    final guessedRole = useState('');

    final mafiaShotInabsenceOfGodfather = useState('');
    //
    final String image = Info.imageByRole(role);
    //
    final scrollControllerForListOfPlayers = useScrollController(
      initialScrollOffset: 0,
      keepScrollOffset: true,
    );
    final scrollControllerForShootInPlaceOfGodfather = useScrollController(
      initialScrollOffset: 0,
      keepScrollOffset: true,
    );
    final scrollControllerForSlaughter = useScrollController(
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
    // final criteria = ref.watch(buttonCriteriaControllerProvider);
    //
    Future<void> putChoiceLocally({required String newChoice}) async {
      final int numberOfPlayers = await ref
          .read(isarServiceProvider.future)
          .then((isar) => isar.retrievePlayer().then((record) => record.count));
      //
      if (role == MyStrings.nostradamous) {
        final maxOfChoices = numberOfPlayers ~/ 3;
        if (nostradamousChoices.value.contains(newChoice)) {
          print('contained');

          nostradamousChoices.value = nostradamousChoices.value
              .where((element) => element != newChoice)
              .toList();
        } else if (nostradamousChoices.value.length >= maxOfChoices) {
          // remove last element and add new one
          nostradamousChoices.value.removeLast();
          nostradamousChoices.value = [...nostradamousChoices.value, newChoice];
        } else {
          nostradamousChoices.value = [...nostradamousChoices.value, newChoice];
        }

        print('nostradamousChoices: ${nostradamousChoices.value}');
      } else {
        if (choice.value == newChoice) {
          choice.value = '';
        } else {
          choice.value = newChoice;
        }
      }
    }

    //
    void putShootInPlaceOfGodfatherLocally({required String newChoice}) {
      if (mafiaShotInabsenceOfGodfather.value == newChoice) {
        mafiaShotInabsenceOfGodfather.value = '';
      } else {
        mafiaShotInabsenceOfGodfather.value = newChoice;
      }
    }

    //
    final finisher = () async {
      timerController.pause();
      print('finisher');
      print('choice : ${choice.value}');
      // it works BUT must be a more handle on loding states
      await buttonLogicExecuter(
        context: context,
        currentPlayerName: name,
        currentPlayerRole: role,
        night: await nightFuture,
        selectedPlayer: choice.value,
        nostradamousChoices: nostradamousChoices.value,
        shootOrSlaughter: shootOrSlaughter.value,
        guessedRole: guessedRole.value,
        mafiaShotInabsenceOfGodfather: mafiaShotInabsenceOfGodfather.value,
      );

      // for saul - Have mafia done buying ?-
      final isar = await ref.read(isarServiceProvider.future);
      final String? saulChoice = await isar
          .retrieveNightN(n: await nightFuture)
          .then(((result) => result.match(
              (json) => json
                  .filterWithKey((key, value) => key == 'saulChoice')
                  .values
                  .singleOrNull,
              (_) => null)));
      //
      Map<String, String?> info = {'saulChoice': saulChoice}
        ..addAll(Info.night);
      //

      await ref
          .read(currentPlayersProvider.notifier)
          .action(MyStrings.nightPage);

      if (!(role == MyStrings.nostradamous &&
          night == 0 &&
          nostradamousChoices.value.isNotEmpty))
        context.goNamed(
          'night',
          extra: info,
        );
    };
    //
    return PopScope(
      canPop: false,
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
                        height: _height / 32,
                      ),

                      Image.asset(
                        MyAssets.dashedLine,
                        width: _width / 3.2,
                        fit: BoxFit.cover,
                      ),

                      SizedBox(
                        height: _height / 32,
                      ),

//code
                      Text(
                        'کد  ' + code,
                        style: MyTextStyles.bodyMD,
                      ),

                      SizedBox(
                        height: _height / 20,
                      ),

                      Text(
                        name,
                        style: MyTextStyles.rolePanel,
                      ),

                      SizedBox(
                        height: _height / 48,
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

              // control panel
              Positioned(
                top: _height / 2.8,
                // right: _width / 3.2,
                child: ControlPanel(
                  width: _width,
                  height: _height,
                  finisher: finisher,
                  timerController: timerController,
                ),
              ),

              // shoot or slaughter
              if (role == MyStrings.godfather &&
                  shootOrSlaughter.value == '' &&
                  night != 0)
                Positioned(
                  bottom: _height / 4.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyButton(
                        title: 'شلیک',
                        onPressed: () => shootOrSlaughter.value = 'shoot',
                      ),
                      MyButton(
                        title: 'سلاخی',
                        onPressed: () => shootOrSlaughter.value = 'slaughter',
                      ),
                    ],
                  ),
                ),

              Positioned(
                top: shootOrSlaughter.value == '' ? _height / 2 : _height / 2.1,
                child: SizedBox(
                  height: _height / 1.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if ((role != MyStrings.godfather &&
                              role != MyStrings.saul) ||
                          (shootOrSlaughter.value != '' &&
                              role != MyStrings.saul) ||
                          saulCanBuy)
                        asyncPlayers.when(
                          data: (playersList) => playersList.isEmpty
                              ? SizedBox()
                              : ListOfNightPlayersWidget(
                                  height: _height,
                                  scrollController:
                                      scrollControllerForListOfPlayers,
                                  width: _width,
                                  choice: choice,
                                  nostradamousChoices:
                                      nostradamousChoices.value,
                                  role: role,
                                  nightFuture: nightFuture,
                                  putChoiceLocally: putChoiceLocally,
                                  playersList: playersList,
                                ),
                          loading: () => Center(child: defaultLoading),
                          error: (error, stackTrace) => Text(
                            'Error: $error',
                            // style: MyTextStyles.error,
                          ),
                        ),

                      // show names for other mafias when godfather is dead and must check mafiaShot is empty
                      if (isGodfatherAlive == false &&
                          mafiaHasBullet == true &&
                          (role == MyStrings.matador ||
                              role == MyStrings.saul ||
                              role == MyStrings.mafia))
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // SizedBox(height: _height / 24),

                            ListOfNightPlayersWidget(
                              purpose: MyStrings.shootInPlaceOfGodfather,
                              nostradamousChoices: [],
                              height: _height,
                              scrollController:
                                  scrollControllerForShootInPlaceOfGodfather,
                              width: _width,
                              choice: mafiaShotInabsenceOfGodfather,
                              role: role,
                              nightFuture: nightFuture,
                              putChoiceLocally:
                                  putShootInPlaceOfGodfatherLocally,
                              playersList:
                                  playersListForShootInAbsenceOfGodfather!,
                            ),
                          ],
                        ),
                      // show role names
                      if (shootOrSlaughter.value == 'slaughter')
                        RoleNamesList(
                          width: _width,
                          height: _height,
                          scrollController: scrollControllerForSlaughter,
                          guessedRole: guessedRole,
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
