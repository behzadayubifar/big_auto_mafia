import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/logics_utils.dart';
import 'package:auto_mafia/logic/night_choices_logics.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';

import 'package:auto_mafia/ui/night/control_panel.dart';
import 'package:auto_mafia/ui/night/list_of_night_players_widget.dart';
import 'package:auto_mafia/ui/night/roles_names_list_widget.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class NightRolePanel extends StatefulHookConsumerWidget {
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
    this.otherMafias,
    this.night,
    this.isRenight,
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
  final bool? isRenight;
  final List<Player>? otherMafias;

  final CountDownController timerController = CountDownController();

  @override
  ConsumerState<NightRolePanel> createState() => _NightRolePanelState();
}

class _NightRolePanelState extends ConsumerState<NightRolePanel> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(loadingProvider.notifier).end();
    });
  }

  @override
  Widget build(BuildContext context) {
    //

    // print(widget.otherMafias);

    //
    bool saulCanBuy = false;
    if (widget.isOneOfMafiaDead == true &&
        widget.hasMafiaBuyedOnce == false &&
        widget.role == MyStrings.saul) saulCanBuy = true;

    //
    // print(night);
    final _height = MediaQuery.sizeOf(context).height;
    final _width = MediaQuery.sizeOf(context).width;
    //
    final choice = useState('');
    final nostradamousChoices = useState(<String>[]);
    final shootOrSlaughter = useState((widget.role == MyStrings.godfather &&
            widget.isHandCuffed &&
            widget.isRenight != true)
        ? 'shoot'
        : '');
    print(shootOrSlaughter.value);
    // for sual when mafia has bullet and one of them is dead
    final buyOrShoot = useState(saulCanBuy ? '' : 'shoot');
    final guessedRole = useState('');

    final mafiaShotInabsenceOfGodfather = useState('');
    //
    final String image = Info.imageByRole(widget.role);
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
    void revertShootOrSlaughter() {
      shootOrSlaughter.value == 'shoot'
          ? shootOrSlaughter.value = 'slaughter'
          : shootOrSlaughter.value = 'shoot';
    }

//
    void reverseBuyOrShoot() {
      buyOrShoot.value == 'buy'
          ? buyOrShoot.value = 'shoot'
          : buyOrShoot.value = 'buy';
    }

    //
    Future<void> putChoiceLocally({required String newChoice}) async {
      final int numberOfPlayers = await ref
          .read(isarServiceProvider.future)
          .then((isar) => isar.retrievePlayer().then((record) => record.count));
      //
      if (widget.role == MyStrings.nostradamous) {
        final maxOfChoices = numberOfPlayers ~/ 3;
        if (nostradamousChoices.value.contains(newChoice)) {
          print('contained');

          nostradamousChoices.value = nostradamousChoices.value
              .where((element) => element != newChoice)
              .toList();
        } else if (nostradamousChoices.value.length >= maxOfChoices) {
          // remove last element and add new one
          nostradamousChoices.value.removeAt(0);
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

    onExti() async {
      ref.read(loadingProvider.notifier).toggle();
      widget.timerController.pause();
      print('finisher');
      print('choice : ${choice.value}');
      // it works BUT must be a more handle on loding states
      await buttonLogicExecuter(
        context: context,
        currentPlayerName: widget.name,
        currentPlayerRole: widget.role,
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
      // final toNight = await isar.getNightNumber();
      Map<String, String?> info = {'saulChoice': saulChoice}
        ..addAll(await Info.night());
      //

      // await ref
      //     .read(currentPlayersProvider.notifier)
      //     .action(MyStrings.nightPage);

      if (!(widget.role == MyStrings.nostradamous &&
          widget.night == 0 &&
          nostradamousChoices.value.isNotEmpty)) {
        context.goNamed(
          'night',
          extra: info,
        );
        ref.read(loadingProvider.notifier).toggle();
      }
    }

    //
    final finisher = () async {
      print('تموم');
      final isPlayerMafia = isMafia(widget.role);
      print("isPlayerMafia: $isPlayerMafia");
      final tonight = await nightFuture;
      print('tonight = $tonight');
      final criteria =
          isPlayerMafia && widget.otherMafias != null && tonight == 0;
      print('citeria: $criteria');

      if ((isPlayerMafia && tonight == 0) || (tonight >= 1 && !isPlayerMafia))
        AwesomeDialog(
          // width: _width / .9,
          context: context,
          dialogType: DialogType.WARNING,
          animType: AnimType.SCALE,
          body: (isPlayerMafia && tonight == 0)
              ? Column(
                  children: [
                    Text(
                      'هم تیمی های شما:',
                      style: MyTextStyles.headlineSmall.copyWith(height: 1.2),
                    ),
                    for (Player player in widget.otherMafias!)
                      Column(
                        children: [
                          SizedBox(
                            height: _height / 48,
                          ),
                          Text(
                            '${player.playerName} : { ${player.roleName} }',
                            style: MyTextStyles.headlineSmall.copyWith(
                              fontSize: 16,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                  ],
                )
              : (tonight >= 1)
                  ? Text(
                      'کد شما: ${widget.code}',
                      style: MyTextStyles.headlineSmall.copyWith(height: 1.2),
                    )
                  : null,
          dismissOnBackKeyPress: true,
          isDense: false,
          btnOk: AnimatedButton(
              pressEvent: () async => await onExti(),
              color: AppColors.primaries[2],
              text: 'متوجه شدم',
              buttonTextStyle: MyTextStyles.bodyLarge.copyWith(
                color: AppColors.white,
              )),
        )..show();

      if (tonight == 0 &&
          !(isPlayerMafia && widget.otherMafias != null && tonight == 0)) {
        await onExti();
        if (widget.role == MyStrings.nostradamous)
          ref.read(loadingProvider.notifier).toggle();
      }
      if (tonight >= 1 && isPlayerMafia) await onExti();
    };

    return GlobalLoading(
      child: PopScope(
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
                          widget.role,
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
                          'کد  ' + widget.code,
                          style: MyTextStyles.bodyMD,
                        ),

                        SizedBox(
                          height: _height / 24,
                        ),

                        Text(
                          widget.name,
                          style: MyTextStyles.rolePanel,
                        ),

                        SizedBox(
                          height: _height / 36,
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
                  top: _height / 2.4,
                  child: ControlPanel(
                    width: _width,
                    height: _height,
                    finisher: finisher,
                    timerController: widget.timerController,
                    child: (widget.role == MyStrings.godfather &&
                            shootOrSlaughter.value != '' &&
                            !widget.isHandCuffed)
                        ?
                        // shoot or slaughter - switch to another option
                        MyButton(
                            title: shootOrSlaughter.value == 'shoot'
                                ? 'تغییر به سلاخی'
                                : 'تغییر به شلیک',
                            onPressed: revertShootOrSlaughter,
                          )
                        : (widget.role == MyStrings.saul &&
                                buyOrShoot.value != '' &&
                                saulCanBuy)
                            ? MyButton(
                                title: buyOrShoot.value == 'shoot'
                                    ? 'تغییر به خریداری'
                                    : 'تغییر به شلیک',
                                onPressed: reverseBuyOrShoot,
                              )
                            : null,
                  ),
                ),

                // shoot or slaughter
                if (widget.role == MyStrings.godfather &&
                    shootOrSlaughter.value == '' &&
                    widget.night != 0 &&
                    widget.isRenight != true)
                  Positioned(
                    bottom: _height / 4.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MyButton(
                          title: 'شلیک',
                          onPressed: () => shootOrSlaughter.value = 'shoot',
                        ),
                        SizedBox(
                          height: _height / 24,
                        ),
                        MyButton(
                          title: 'سلاخی',
                          onPressed: () => shootOrSlaughter.value = 'slaughter',
                        ),
                      ],
                    ),
                  ),

                // buy or shoot
                if (widget.role == MyStrings.saul && buyOrShoot.value == '')
                  Positioned(
                    bottom: _height / 4.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MyButton(
                          title: 'شلیک',
                          onPressed: () => buyOrShoot.value = 'shoot',
                        ),
                        SizedBox(
                          height: _height / 24,
                        ),
                        MyButton(
                          title: 'خریداری',
                          onPressed: () => buyOrShoot.value = 'buy',
                        ),
                      ],
                    ),
                  ),

                // if ((widget.role == MyStrings.saul ) ||
                //     widget.role != MyStrings.saul)
                Positioned(
                  top: shootOrSlaughter.value == ''
                      ? _height / 2
                      : _height / 2.1,
                  child: SizedBox(
                    height: _height / 1.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if ((widget.role != MyStrings.godfather &&
                                widget.role != MyStrings.saul) ||
                            (shootOrSlaughter.value != '' &&
                                widget.role != MyStrings.saul) ||
                            (saulCanBuy && buyOrShoot.value == 'buy'))
                          asyncPlayers.when(
                            data: (playersList) {
                              print(playersList);
                              // (playersList.forEach((player) {
                              //   print(player.playerToString(true));
                              // }));
                              return playersList.isEmpty
                                  ? SizedBox()
                                  : ListOfNightPlayersWidget(
                                      purpose:
                                          shootOrSlaughter.value == 'slaughter'
                                              ? ''
                                              : widget.role,
                                      height: _height,
                                      scrollController:
                                          scrollControllerForListOfPlayers,
                                      width: _width,
                                      choice: choice,
                                      nostradamousChoices:
                                          nostradamousChoices.value.isEmpty &&
                                                  widget.role ==
                                                      MyStrings.nostradamous
                                              ? () {
                                                  final randomPlayers =
                                                      getRandomPlayersNamesFromList(
                                                    playersList.mapToNames(),
                                                    playersList.length ~/ 3,
                                                  );
                                                  for (String player
                                                      in randomPlayers) {
                                                    putChoiceLocally(
                                                        newChoice: player);
                                                  }
                                                  return randomPlayers;
                                                }()
                                              : nostradamousChoices.value,
                                      role: widget.role,
                                      nightFuture: nightFuture,
                                      putChoiceLocally: putChoiceLocally,
                                      playersList: playersList,
                                    );
                            },
                            loading: () => Center(child: defaultLoading()),
                            error: (error, stackTrace) => Text(
                              'Error: $error',
                              // style: MyTextStyles.error,
                            ),
                          ),

                        // show names for other mafias when godfather is dead and must check mafiaShot is empty
                        if (widget.isGodfatherAlive == false &&
                            widget.mafiaHasBullet == true &&
                            (widget.role == MyStrings.matador ||
                                (widget.role == MyStrings.saul &&
                                    buyOrShoot.value == 'shoot') ||
                                widget.role == MyStrings.mafia))
                          () {
                            print('here is the other mafias');
                            return Column(
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
                                  role: widget.role,
                                  nightFuture: nightFuture,
                                  putChoiceLocally:
                                      putShootInPlaceOfGodfatherLocally,
                                  playersList: widget
                                      .playersListForShootInAbsenceOfGodfather!,
                                ),
                              ],
                            );
                          }(),
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
      ),
    );
  }
}
