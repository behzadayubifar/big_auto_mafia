import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/online/presentation/common/buttons/online_buttons.dart';
import 'package:auto_mafia/online/presentation/common/lists/my_list_tile.dart';
import 'package:auto_mafia/online/presentation/game/game_controller.dart';
import 'package:auto_mafia/online/presentation/rooms/controllers/active_room.dart';
import 'package:auto_mafia/online/presentation/situations/situations_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../offline/db/shared_prefs/shared_prefs.dart';
import '../../../offline/my_assets.dart';
import '../common/lists/my_list_view.dart';

class GamePage extends HookConsumerWidget {
  const GamePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    //
    final scrollController = useScrollController();
    //
    final game = ref.watch(gameControllerProvider);
    final situationsCtrl = ref.watch(situationsControllerProvider);
    final roomsCtrl = ref.watch(activeRoomsProvider);
    //
    final voteds = useState(<String>[]);
    //
    final user = roomsCtrl.whenData((rooms) {
      final userId = SharedPrefs.userID;
      final user = rooms[0]!.usersInfo!.firstWhere(
            (user) => user.id == userId,
          );
      return user;
    });
    //
    final player = game.whenData((game) {
      return game.match(
        (l) => null,
        (r) => r.playerOnline,
      );
    });

    return Scaffold(
      body: situationsCtrl.maybeWhen(
        data: (data) {
          return data.match(
            (l) {
              return Container(
                height: height,
                width: width,
                color: AppColors.backGround,
                child: Center(
                  child: Text(
                    'error : ${l.msg}',
                    style: MyTextStyles.headlineSmall.copyWith(
                      color: AppColors.lightestGrey,
                    ),
                  ),
                ),
              );
            },
            (r) {
              if (r.situation == null) {
                return Container(
                  height: height,
                  width: width,
                  color: AppColors.backGround,
                  child: Center(
                    child: Text(
                      'no situation',
                      style: MyTextStyles.headlineSmall.copyWith(
                        color: AppColors.lightestGrey,
                      ),
                    ),
                  ),
                );
              }
              // got situation
              return Stack(
                children: [
                  // background
                  Image.asset(
                    MyAssets.dayBg,
                    color: AppColors.backGround,
                    colorBlendMode: BlendMode.overlay,
                    width: width,
                    fit: BoxFit.cover,
                  ),

                  // day number
                  Positioned(
                    top: height / 4.8,
                    right: width / 2.5,
                    child: Text.rich(
                      TextSpan(
                        text: 'روز',
                        style: MyTextStyles.bodyMD,
                        children: [
                          TextSpan(
                            text: ' ${r.situation!.dayNumber}',
                            style: MyTextStyles.displayMedium,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // user name
                  Positioned(
                    top: height / 3.8,
                    right: width / 4.5,
                    child: user.whenData((user) {
                      return SizedBox(
                        width: width / 1.83,
                        child: Text(
                          user.fullName!,
                          style: MyTextStyles.bodyLarge.copyWith(
                            color: AppColors.primaries[3],
                            height: 1.6,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      );
                    }).value!,
                  ),

                  // Avatar of the player
                  Positioned(
                    top: height / 3,
                    right: width / 3,
                    child: player.whenData((player) {
                      return Text(
                        player!.role!,
                        style: MyTextStyles.bodyLarge.copyWith(
                          color: AppColors.primaries[2],
                        ),
                      );
                    }).value!,
                  ),

                  // a list of alive players which are clickable
                  // TODO: FIX this overflowing of the list constrains
                  roomsCtrl.maybeWhen(
                    data: (data) {
                      final players = data[0]!.usersInfo!;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: height / 2.4),
                          // list of players
                          MyListView(
                              height: height / 2.4,
                              width: width,
                              children: players,
                              scrollController: scrollController,
                              // title: 'به کیا رأی میدی؟',
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.primaries[1],
                                  AppColors.lightestGrey,
                                ],
                              ),
                              itemBuilder: (context, index) {
                                return MyListTile(
                                  height: height / 14,
                                  width: width,
                                  index: index,
                                  gradient: LinearGradient(
                                    colors: [
                                      if (!voteds.value
                                          .contains(players[index].id)) ...[
                                        AppColors.primaries[2],
                                        AppColors.primaries[3],
                                      ] else ...[
                                        AppColors.secondaries[2],
                                        AppColors.secondaries[3],
                                      ]
                                    ],
                                  ),
                                  title: players[index].fullName!,
                                  onTap: () {
                                    if (voteds.value
                                        .contains(players[index].id)) {
                                      voteds.value = voteds.value
                                          .where(
                                              (id) => id != players[index].id)
                                          .toList();
                                    } else {
                                      voteds.value = [
                                        ...voteds.value,
                                        players[index].id!
                                      ];
                                    }
                                  },
                                );
                              }),

                          SizedBox(height: height / 24),

                          // confirm button
                          OnlineButton(
                            title: "تأیید آراء",
                            textStyle: MyTextStyles.headlineSmall.copyWith(
                              color: AppColors.lightestGrey,
                              height: .1,
                            ),
                            backgroundColor: AppColors.greens[3],
                            onPressed: () => print('confirm'),
                          ),
                        ],
                      );
                    },
                    orElse: () => LoadingAnimationWidget.twoRotatingArc(
                      color: AppColors.secondaries[1],
                      size: width / 4,
                    ),
                  ),
                  //   data: (game) {
                  //     return game.match(
                  //       (l) {
                  //         return SizedBox();
                  //       },
                  //       (r) {
                  //         return Positioned(
                  //           top: height / 2.4,
                  //           // right: width / ,
                  //           child: SizedBox(
                  //             width: width / 1,
                  //             height: height / 1.2,
                  //             child: ListView(
                  //               children: [
                  //                 // Avatar + role
                  //                 Row(
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceEvenly,
                  //                   children: [
                  //                     Icon(
                  //                       FontAwesomeIcons.userNinja,
                  //                       size: 64,
                  //                       color: AppColors.tintsOfBlack[3],
                  //                     ),
                  //                     // Spacer(),
                  //                     Text(
                  //                       r.playerOnline!.role!,
                  //                       style:
                  //                           MyTextStyles.headlineSmall.copyWith(
                  //                         color: AppColors.primaries[2],
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 SizedBox(height: height / 32),
                  //               ],
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   },
                  //   orElse: () => SizedBox(),
                  // ),
                ],
              );
            },
          );
        },
        orElse: () => Center(
          child: LoadingAnimationWidget.bouncingBall(
            color: AppColors.secondaries[0],
            size: width / 4,
          ),
        ),
      ),
      // Center(
      //   child: game.maybeWhen(
      //     data: (game) {
      //       return game.match(
      //         // TODO: handle l case
      //         (l) {},
      //         (r) {
      //           // if (r.playerOnline == null) {}
      //           return Container(
      //             height: height,
      //             width: width,
      //             color: AppColors.backGround,
      //             child: Center(
      //               child: Text(
      //                 'role : ${r.playerOnline!.role}',
      //                 style: MyTextStyles.headlineSmall.copyWith(
      //                   color: AppColors.lightestGrey,
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       );
      //     },
      //     orElse: () => LoadingAnimationWidget.bouncingBall(
      //       color: AppColors.secondaries[0],
      //       size: width / 4,
      //     ),
      //   ),
      // ),
    );
  }
}
