import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/logics.dart';
import 'package:auto_mafia/logic/logics_utils.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:auto_mafia/ui/common/title_widget.dart';
import 'package:auto_mafia/ui/statements/overlay_system.dart';
import 'package:auto_mafia/ui/statements/result_row_widget.dart';
import 'package:auto_mafia/ui/statements/statement_overlay_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class NightsResuls extends HookConsumerWidget {
  const NightsResuls({
    super.key,
    required this.tonight,
    required this.remainedChancesForNightEnquiry,
    this.slaughtered,
    this.bornPlayer,
    this.disclosured,
    this.tonightDeads,
    this.nightCode,
    this.allDeadPlayers,
  });

  final String tonight;
  //
  final String? slaughtered;
  final String? bornPlayer;
  final String? disclosured;
  final List<String>? tonightDeads;
  //
  final int? nightCode;
  //
  final List<String>? allDeadPlayers;
  //
  final int remainedChancesForNightEnquiry;
  //

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('slaughtered is $slaughtered');
    print('tonightDeads is $tonightDeads');

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: GlobalLoading(
        child: Scaffold(
          backgroundColor: AppColors.backGround,
          body: SafeArea(
            right: true,
            left: true,
            top: true,
            bottom: true,
            minimum: EdgeInsets.only(
                top: height / 32,
                bottom: height / 64,
                right: width / 24,
                left: width / 24),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TiTleTile(
                    title: MyStrings.nightResults + ' ' + tonight,
                    width: width / 1.4,
                    textStyle:
                        Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: AppColors.white,
                            ),
                  ),
                  SizedBox(height: height / 32),
                  Expanded(
                    child: ListView(
                      children: [
                        if (bornPlayer != '')
                          ResultRow(
                              width: width,
                              names: [bornPlayer!, MyStrings.returnedToGame],
                              topic: MyStrings.bornPlayer),
                        if (bornPlayer != '') SizedBox(height: height / 24),

                        if (disclosured != '')
                          ResultRow(
                              width: width,
                              names: [disclosured!, MyStrings.isMafia],
                              topic: MyStrings.disclosured),
                        if (disclosured != '') SizedBox(height: height / 32),

                        if (slaughtered != '')
                          ResultRow(
                              width: width,
                              names: [slaughtered!, MyStrings.isSlaughtered],
                              topic: MyStrings.slaughtered),
                        if (slaughtered != '') SizedBox(height: height / 32),

                        // if (tonightDeads!.isNotEmpty)
                        ResultRow(
                          width: width,
                          names: tonightDeads!.isNotEmpty
                              ? tonightDeads!
                              : ["هیچکس فوت نکرد شکر خدا !!!"],
                          topic: MyStrings.deads,
                        ),
                        SizedBox(height: height / 16),

                        Image.asset(
                          MyAssets.dashedLine,
                          scale: .2,
                          color: AppColors.secondaries[0],
                          // width: width,
                        ),
                        SizedBox(height: height / 16),

                        // under dashed line -> night code and all dead players
                        Column(
                          children: [
                            // show night code
                            if (nightCode != null)
                              Text(
                                MyStrings.nightCode + nightCode.toString(),
                                style: MyTextStyles.bodyMD.copyWith(
                                  color: AppColors.lighterGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            if (nightCode != null)
                              SizedBox(height: height / 16),

                            // show all the Deads
                            if (allDeadPlayers!.isNotEmpty)
                              Text(
                                MyStrings.allDeads + '  :',
                                style: MyTextStyles.bodyLarge.copyWith(
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            if (allDeadPlayers!.isNotEmpty)
                              SizedBox(height: height / 20),

                            for (String dead in allDeadPlayers!)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    (allDeadPlayers!.indexOf(dead) !=
                                            (allDeadPlayers!.length - 1))
                                        ? dead + ' ,'
                                        : dead,
                                    style: MyTextStyles.bodyMD.copyWith(
                                      color: AppColors.white60,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: height / 24),
                                ],
                              ),
                            if (allDeadPlayers!.isNotEmpty)
                              SizedBox(height: height / 32),
                          ],
                        )
                      ],
                    ),
                  ),
                  // TODO:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyButton(
                          title: MyStrings.enquiry,
                          onLongPress: (allDeadPlayers!.isEmpty ||
                                  remainedChancesForNightEnquiry <= 0)
                              ? null
                              : () async {
                                  ref.read(loadingProvider.notifier).toggle();

                                  final statementInstance =
                                      StatementScreen.instance();

                                  final List<Player> dead = await ref
                                      .read(isarServiceProvider.future)
                                      .then((isar) =>
                                          isar.retrievePlayer(isAlive: false))
                                      .then((record) => record.players);

                                  print('dead : ${dead.mapToNames()}');

                                  final enquiry =
                                      await determineMafiaAndCitizenCountFromList(
                                    playerNames: dead.mapToNames(),
                                    isGodfatherCountedForMafia: true,
                                  );
                                  print('enquiry : $enquiry');
                                  ref.read(loadingProvider.notifier).toggle();

                                  statementInstance.show(
                                    mafia: enquiry.mafiaPlayersCount,
                                    citizen: enquiry.citizen,
                                    independent: enquiry.independent,
                                    title: MyStrings.enquiryResults,
                                    context: context,
                                    callback: () async {
                                      statementInstance.hide();

                                      ref
                                          .read(loadingProvider.notifier)
                                          .toggle();

                                      final isar = await ref
                                          .read(isarServiceProvider.future);
                                      final dayNumber =
                                          await isar.getDayNumber();

                                      final winner = await determineWinner(
                                          dayNumber: dayNumber);
//
                                      if (winner != null) {
                                        ref
                                            .read(loadingProvider.notifier)
                                            .toggle();

                                        await isar.putGameStatus(
                                          situation: MyStrings.gameOver,
                                          dayNumber: dayNumber,
                                          isFinished: true,
                                        );
                                        ref
                                            .read(loadingProvider.notifier)
                                            .end();

                                        context.go('/game_over/$winner');
                                        return;
                                      } else {
                                        final alivePlayers =
                                            await isar.retrievePlayer();
                                        if (alivePlayers.count == 3) {
                                          await isar.putGameStatus(
                                            situation: MyStrings.chaos,
                                            isChaos: true,
                                            dayNumber: dayNumber,
                                          );
                                          context.go(
                                            '/chaos',
                                            extra: alivePlayers.players
                                                .mapToNames(),
                                          );
                                          return;
                                        } else {
                                          print(
                                              "MUST NOT BE EXECUTED IF GAME IS OVER OR CHAOS");

                                          await isar.putGameStatus(
                                            situation: MyStrings.dayPage,
                                            dayNumber: dayNumber,
                                            remainedChancesForNightEnquiry:
                                                remainedChancesForNightEnquiry -
                                                    1,
                                          );

                                          context.go('/day/$dayNumber');
                                          ref
                                              .read(loadingProvider.notifier)
                                              .toggle();
                                        }
                                      }
                                      //
                                    },
                                  );
                                }),
                      SizedBox(height: width / 24),
                      MyButton(
                          title: MyStrings.nextDay,
                          onLongPress: () async {
                            ref.read(loadingProvider.notifier).toggle();

                            final isar =
                                await ref.read(isarServiceProvider.future);
                            final dayNumber = await isar.getDayNumber();

                            await isar.putGameStatus(
                              situation: MyStrings.dayPage,
                              dayNumber: dayNumber,
                            );

                            await ref
                                .read(currentPlayersProvider.notifier)
                                .action(MyStrings.dayPage);

                            final winner =
                                await determineWinner(dayNumber: dayNumber);

                            if (winner != null) {
                              ref.read(loadingProvider.notifier).toggle();

                              await isar.putGameStatus(
                                situation: MyStrings.gameOver,
                                dayNumber: dayNumber,
                                isFinished: true,
                              );
                              ref.read(loadingProvider.notifier).end();

                              context.go('/game_over/$winner');
                              return;
                            } else {
                              final alivePlayers = await isar.retrievePlayer();
                              if (alivePlayers.count == 3) {
                                await isar.putGameStatus(
                                  situation: MyStrings.chaos,
                                  isChaos: true,
                                  dayNumber: dayNumber,
                                );
                                context.go(
                                  '/chaos',
                                  extra: alivePlayers.players.mapToNames(),
                                );
                                return;
                              } else {
                                print(
                                    "MUST NOT BE EXECUTED IF GAME IS OVER OR CHAOS");

                                context.go('/day/$dayNumber');
                                ref.read(loadingProvider.notifier).toggle();
                              }
                            }
                          }),
                    ],
                  ),
                  // SizedBox(height: height / 64),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
