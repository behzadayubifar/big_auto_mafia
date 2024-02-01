import 'dart:developer';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:auto_mafia/ui/common/my_buttons.dart';
import 'package:auto_mafia/ui/common/title_widget.dart';
import 'package:auto_mafia/ui/widgets/player_name_widget.dart';
import 'package:auto_mafia/utils/dev_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class NightPage extends HookConsumerWidget {
  NightPage({
    required this.info,
    Key? key,
  }) : super(key: key);

  final Map<String, String> info;

  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    //
    final asyncPlayers = ref.watch(currentPlayersProvider);
    // final asyncPlayers = useMemoized(() => asyncPlayersX, [asyncPlayersX]);
    'night-page'.log();

    return Scaffold(
        backgroundColor: AppColors.backGround,
        body: switch (asyncPlayers) {
          AsyncData(:final value) => SafeArea(
              // maintainBottomViewPadding: true,
              minimum: EdgeInsets.only(top: height / 15),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TiTleTile(title: info['title']!),
                    SizedBox(height: height / 24),
                    Expanded(
                      child: SizedBox(
                        width: width / 1.5,
                        // height: height / 1.5,
                        child: ListView.separated(
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
                                GestureDetector(
                                  onDoubleTap: () async {
                                    log('on double tap');
                                  },
                                  child: PlayerNameWidget(
                                    playerName: value[index].playerName,
                                    height: height,
                                    // situation: MyStrings.nightPage,
                                    // situation: MyStrings.showMyRole,
                                    situation: info['situation']!,
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
                    ),
                    SizedBox(height: height / 8),
                  ],
                ),
              ),
            ),
          _ => defaultLoading,
        });
  }
}
