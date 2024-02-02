import 'dart:developer';

import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:auto_mafia/ui/widgets/player_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    final String image = Info.imageByRole(role);
    //
    final asyncPlayers = ref.watch(currentPlayersProvider);
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

                      // role-of-player
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

              Positioned(
                top: _height / 2.4,
                right: _width / 8,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child:
                      // list-of-players
                      SizedBox(
                    height: _height / 1.5,
                    child: asyncPlayers.when(
                      data: (value) => SafeArea(
                        minimum: EdgeInsets.only(top: _height / 15),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: _width / 1.5,
                                  child: ListView.separated(
                                    cacheExtent: _height / 1.64,
                                    restorationId: 'night-page',
                                    clipBehavior: Clip.antiAlias,
                                    itemCount: value.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          GestureDetector(
                                            onDoubleTap: () async {
                                              log('on double tap');
                                            },
                                            child: PlayerNameWidget(
                                              playerName:
                                                  value[index].playerName,
                                              height: _height, situation: '',
                                              nightContext: context,

                                              // situation: Info.showMyRole,
                                            ),
                                          ),
                                          SizedBox(
                                            height: _height / 64,
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(height: _height / 48);
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: _height / 8),
                            ],
                          ),
                        ),
                      ),
                      loading: () => Center(child: defaultLoading),
                      error: (error, stackTrace) => Text(
                        'Error: $error',
                        // style: MyTextStyles.error,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
