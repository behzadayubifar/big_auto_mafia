import 'dart:developer';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/logics.dart';
import 'package:auto_mafia/logic/logics_utils.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/common/title_widget.dart';
import 'package:auto_mafia/ui/statements/statement_overlay_screen.dart';
import 'package:auto_mafia/ui/widgets/player_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class NightPage extends HookConsumerWidget {
  NightPage({
    required this.info,
    Key? key,
  }) : super(key: key);

  final Map<String, String> info;

  Widget build(BuildContext nightContext, WidgetRef ref) {
    final height = MediaQuery.sizeOf(nightContext).height;
    final width = MediaQuery.sizeOf(nightContext).width;
    //
    final asyncPlayers = ref.watch(currentPlayersProvider);
    //
    final scrollController = useScrollController(
      initialScrollOffset: 0,
      keepScrollOffset: true,
    );
    //

    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: switch (asyncPlayers) {
        AsyncData(:final value) => SafeArea(
            // maintainBottomViewPadding: true,
            minimum: EdgeInsets.only(top: height / 15),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  TiTleTile(title: info['title']!),
                  SizedBox(height: height / 24),
                  Expanded(
                    child: SizedBox(
                      width: width / 1.5,
                      // height: height / 1.5,
                      child: ListView.separated(
                        shrinkWrap: true,
                        cacheExtent: height / 1.64,
                        restorationId: 'night-page',
                        // addAutomaticKeepAlives: true,
                        // key: _pageStorageKey,
                        clipBehavior: Clip.antiAlias,
                        // shrinkWrap: true,
                        // physics: RangeMaintainingScrollPhysics(),
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              PlayerNameWidget(
                                playerName: value[index].playerName!,
                                height: height,
                                situation: info['situation']!,
                                nightContext: nightContext,
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
                        final nightResultJson =
                            await (isar.retrieveNightN(n: tonight)).then(
                          (json) => json.match(
                            (json) => json,
                            (_) => null,
                          ),
                        );

                        log('json: $nightResultJson');
                        // TODO: we must handle the loading
                        if (tonight != 0) {
                          final info = await god(json: nightResultJson);
                          nightContext.goNamed(
                            'nights-results',
                            extra: info,
                          );
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
        _ => defaultLoading,
      },
    );
  }
}
