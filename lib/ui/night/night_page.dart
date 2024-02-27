import 'dart:developer';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/logics.dart';
import 'package:auto_mafia/logic/logics_utils.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/common/title_widget.dart';
import 'package:auto_mafia/ui/day/show_last_move.dart';
import 'package:auto_mafia/ui/statements/statement_overlay_screen.dart';
import 'package:auto_mafia/ui/widgets/player_name_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class NightPage extends HookConsumerWidget {
  NightPage({
    required this.info,
    Key? key,
  }) : super(key: key);

  final Map<String, dynamic> info;

  @override
  Widget build(BuildContext nightContext, WidgetRef ref) {
    print('this is night');
    //
    String nightNumber = '';
    //
    final height = MediaQuery.sizeOf(nightContext).height;
    final width = MediaQuery.sizeOf(nightContext).width;
    //
    final asyncPlayers = ref.watch(currentPlayersProvider);

    // -for saul-
    final bool mafiaBuyed =
        (info['saulChoice'] != null && info['saulChoice'] != "");
    final bool isNight = info['situation'] == MyStrings.nightPage;
    if (isNight)
      nightNumber = info['nightNumber'] == '0' ? "معارفه" : info['nightNumber'];
    //

    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: switch (asyncPlayers) {
        AsyncData(:final value) => SafeArea(
            minimum: EdgeInsets.only(top: height / 15),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  TiTleTile(
                    title: info['nightNumber'] == '0'
                        ? nightNumber
                        : info['title']! + ' $nightNumber',
                  ),
                  SizedBox(height: height / 24),
                  Expanded(
                    child: SizedBox(
                      width: width / 1.5,
                      // height: height / 1.5,
                      child: ListView.separated(
                        shrinkWrap: true,
                        cacheExtent: height / 1.64,
                        restorationId: 'night-page',
                        clipBehavior: Clip.antiAlias,
                        // shrinkWrap: true,
                        // physics: RangeMaintainingScrollPhysics(),
                        itemCount: value.length,
                        itemBuilder: (_, index) {
                          print(
                              'object --------------------------------------------------------');
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (value.elementAt(index).nightDone != true)
                                PlayerNameWidget(
                                  playerName: value[index].playerName!,
                                  height: height,
                                  situation: info['situation']!,
                                  nightContext: nightContext,
                                ),
                              if (value.elementAt(index).nightDone != true)
                                SizedBox(
                                  height: height / 64,
                                ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          if (value.elementAt(index).nightDone != true)
                            return SizedBox(height: height / 48);
                          return SizedBox();
                        },
                      ),
                    ),
                  ),

                  // spacer
                  if (info['button'] != null) SizedBox(height: height / 24),

                  if (info['situation'] == MyStrings.showRoles)
                    MyButton(
                        title: 'go to day',
                        onPressed: () async {
                          final isar =
                              await ref.read(isarServiceProvider.future);

                          final yesterday = await isar.getDayNumber();

                          await isar.putGameStatus(
                            dayNumber: yesterday,
                            isDay: true,
                            situation: MyStrings.dayPage,
                          );

                          await ref
                              .read(currentPlayersProvider.notifier)
                              .action(MyStrings.dayPage);

                          nightContext.go('/day/$yesterday');
                        }),

                  // button
                  if (info['button'] != null &&
                      info['button'] == MyStrings.nightResults)
                    MyButton(
                      state: MyStrings.disabledButton,
                      title: info['button']!,
                      // criteria: value.length == 0,
                      // TODO: add a function to the button (show night's results)
                      onLongPress: /* value.length != 0
                            ? null
                            : */
                          () async {
                        final isar = await ref.read(isarServiceProvider.future);
                        final tonight = await isar.getNightNumber();

                        //
                        final isReNight = await isar
                            .retrieveGameStatusN(
                              n: tonight,
                            )
                            .then((status) => status!.isReNight);
                        if (mafiaBuyed &&
                            value.length == 0 &&
                            isReNight != true) await saul(info['saulChoice']);
                        final nightCode = await isar
                            .retrieveGameStatusN(
                              n: await isar.getDayNumber(),
                            )
                            .then((status) => status?.nightCode);

                        // TODO: we must handle the loading
                        if (tonight != 0) {
                          if (mafiaBuyed &&
                              value.length == 0 &&
                              isReNight != true) {
                            AwesomeDialog(
                                context: nightContext,
                                dialogType: DialogType.NO_HEADER,
                                animType: AnimType.BOTTOMSLIDE,
                                body: SizedBox(
                                  // height: height / 2.5,
                                  child: Column(
                                    children: [
                                      Text("خریداری!",
                                          style: MyTextStyles.displaySmall
                                              .copyWith(
                                            height: 1,
                                            color: AppColors.secondaries[2],
                                          )),
                                      SizedBox(height: height / 32),
                                      Text(
                                        "مافیا شب گذشته اقدام به خریداری کرد، بنابراین همۀ افراد مجددا با دانش به این قضیه باید وظیفۀ امشب خود را انجام دهند.",
                                        style: MyTextStyles.bodyMD.copyWith(
                                          height: 1.6,
                                        ),
                                      ),
                                      SizedBox(height: height / 48),
                                      Text(
                                        'کد خریداری : $nightCode',
                                        style: MyTextStyles.bodyMD.copyWith(
                                          height: 1.6,
                                        ),
                                      ),
                                      SizedBox(height: height / 64),
                                      AnimatedButton(
                                        text: "شروع مجدد شب",
                                        width: width / 2.5,
                                        color: AppColors.green,
                                        pressEvent: () async {
                                          //
                                          final allPlayers =
                                              await isar.getAllPlayers();

                                          print('allPlayers : $allPlayers');

                                          for (String playerName
                                              in allPlayers.mapToNames()) {
                                            await isar.updatePlayer(
                                              playerName: playerName,
                                              nightDone: false,
                                              // handCuffed: false,
                                              // isSaved: false,
                                              // hasBeenSlaughtered: false,
                                              // isBlocked: false,
                                            );
                                          }

                                          // clear tonight's choices
                                          await isar.putNight(
                                            night: tonight,
                                            godfatherChoice: '',
                                            saulChoice: '',
                                            watsonChoice: '',
                                            leonChoice: '',
                                            kaneChoice: '',
                                            konstantinChoice: '',
                                            mafiasShot: '',
                                            matadorChoice: '',
                                            nightOfBlockage: '',
                                            nightOfRightChoiceOfKane: '',
                                            nostradamousChoices: [],
                                            theRoleGuessedByGodfather: '',
                                          );

                                          //
                                          await ref
                                              .read(currentPlayersProvider
                                                  .notifier)
                                              .action(MyStrings.nightPage);
                                          // update situtaion to re-nihgt !!
                                          await isar.putGameStatus(
                                            dayNumber:
                                                await isar.getDayNumber(),
                                            isDay: false,
                                            isReNight: true,
                                            nightCode: null,
                                            // no more shoot for mafias in this night
                                            remainedMafiasBullets: 0,
                                          );
                                          // pop the dialog
                                          Navigator.of(nightContext).pop();
                                        },
                                      ),
                                      SizedBox(height: height / 64),
                                    ],
                                  ),
                                ))
                              ..show();
                          } else {
                            final nightResultJson =
                                await (isar.retrieveNightN(n: tonight)).then(
                              (json) => json.match(
                                (json) => json,
                                (_) => null,
                              ),
                            );

                            log('json: $nightResultJson');
                            final info = await god(json: nightResultJson);
                            nightContext.goNamed(
                              'nights-results',
                              extra: info,
                            );
                          }
                        } else {
                          int dayNumber = await isar.getDayNumber();
                          await isar.putGameStatus(
                            dayNumber: dayNumber + 1,
                            isDay: true,
                            situation: MyStrings.dayPage,
                          );

                          await ref
                              .read(currentPlayersProvider.notifier)
                              .action(MyStrings.dayPage);

                          dayNumber = await isar.getDayNumber();

                          nightContext.goNamed(
                            'day',
                            pathParameters: {'dayNumber': '$dayNumber'},
                          );
                        }

                        // nightContext.goNamed(MyStrings.nightResults);
                        // TODO: we must handle the loading

// showing the result of night
                      },
                    ),

                  // spacer
                  SizedBox(height: height / 16),
                ],
              ),
            ),
          ),
        AsyncError() => const Text('Oops, something unexpected happened'),
        _ => defaultLoading(),
      },
    );
  }
}
