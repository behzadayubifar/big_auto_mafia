import 'dart:developer';

import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/offline/db/entities/room.dart';
import 'package:auto_mafia/offline/db/entities/vote.dart';
import 'package:auto_mafia/online/data/models/responses/events.dart';
import 'package:auto_mafia/online/data/models/responses/rooms.dart';
import 'package:auto_mafia/online/data/models/responses/situations.dart';
import 'package:auto_mafia/online/events/sse.dart';
import 'package:auto_mafia/online/presentation/common/buttons/online_buttons.dart';
import 'package:auto_mafia/online/presentation/common/lists/my_list_tile.dart';
import 'package:auto_mafia/online/presentation/game/game_controller.dart';
import 'package:auto_mafia/online/presentation/rooms/controllers/active_room.dart';
import 'package:auto_mafia/online/presentation/situations/situations_controller.dart';
import 'package:auto_mafia/online/presentation/votes/votes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../offline/db/shared_prefs/shared_prefs.dart';
import '../../../offline/my_assets.dart';
import '../../data/models/responses/votes.dart';
import '../common/lists/my_list_view.dart';
import '../votes/confirm_votes_button.dart';
import 'players_list_to_vote.dart';

class GamePage extends HookConsumerWidget {
  const GamePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    //
    final scrollController = useScrollController();
    final playersScrollController = useScrollController();

    final _entries = useState<List<OverlayEntry?>>([]);
    //
    final game = ref.watch(gameControllerProvider);
    final situationsCtrl = ref.watch(situationsControllerProvider);
    final roomsCtrl = ref.watch(activeRoomsProvider);
    final live = ref.watch(appEventsProvider);
    final votesCtrl = ref.watch(votesControllerProvider);
    //
    final voteds = useState(<UsersInRoom>[]);
    final firstVotingIsFinished = useState(false);
    final votesAreFetched = useState(false);
    final fetchedVotesCollection = useState(VotesCollection.empty());
    //
    final courtIsFinished = useState(false);
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
    // listen to the events and show a loading animation
    // when the voting is finished
    live.whenData(
      (event) {
        // first voting is finished ->
        if (event.any((e) => e is VotingFinished) &&
            event.any((e) => !(e is CourtFinished))) {
          // show a loading animation on the screen over the whole screen
          if (firstVotingIsFinished.value) {
            return;
          }

          final loadingOverlay = OverlayEntry(
            // opaque: false,
            builder: (context) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  ModalBarrier(
                    dismissible: false,
                    color: AppColors.backGround.withOpacity(.85),
                  ),
                  Text(
                    "منتظر نتیجۀ رأی گیری اولیه",
                    style: MyTextStyles.headlineSmall.copyWith(
                      color: AppColors.lightestGrey,
                    ),
                  ),
                  LoadingAnimationWidget.beat(
                    color: AppColors.secondaries[0],
                    size: width / 1.6,
                  ),
                ],
              );
            },
          );

          _entries.value.add(loadingOverlay);
          // show the loading animation
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Overlay.of(context).insertAll(Iterable.generate(
                _entries.value.length, (index) => _entries.value[index]!));
          });
          firstVotingIsFinished.value = true;
        }

        if (event.any((e) => e is CourtFinished)) {
          if (courtIsFinished.value) {
            return;
          }

          _entries.value.clear();

          final overlay = OverlayEntry(
            builder: (context) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  ModalBarrier(
                    dismissible: false,
                    color: AppColors.backGround.withOpacity(.85),
                  ),
                  Text(
                    "دادگاه پایان یافت",
                    style: MyTextStyles.headlineSmall.copyWith(
                      color: AppColors.lightestGrey,
                    ),
                  ),
                  LoadingAnimationWidget.beat(
                    color: AppColors.secondaries[0],
                    size: width / 1.6,
                  ),
                ],
              );
            },
          );

          _entries.value.add(overlay);
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Overlay.of(context).insertAll(Iterable.generate(
                _entries.value.length, (index) => _entries.value[index]!));
          });
          courtIsFinished.value = true;
        }
      },
    );

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

                  // ---------------------END OF BASEMENT FOR GAME PAGE-----------------------------------------------------------
                  // FIRSR VOTING STUFF (and its results) + Court voting stuff
                  if (!courtIsFinished.value) ...[
                    // list of votes from events
                    if (firstVotingIsFinished.value)
                      live.whenData(
                            (events) {
                              final lstEvent = events.lastOrNull;
                              if (lstEvent is VotesProcessed) {
                                // WidgetsBinding.instance
                                //     .addPostFrameCallback((timeStamp) {});
                                if (_entries.value.isNotEmpty) {
                                  _entries.value.forEach((entry) {
                                    if (entry != null && entry.mounted) {
                                      entry.remove();
                                    }
                                  });
                                  _entries.value.clear();
                                }
                                return PlayersListToVote(
                                  height: height,
                                  width: width,
                                  scrollController: scrollController,
                                  event: lstEvent,
                                );
                              }
                            },
                          ).valueOrNull ??
                          SizedBox(),

                    // list of votes from votesCtrl
                    if (!firstVotingIsFinished.value || votesAreFetched.value)
                      votesCtrl.maybeWhen(
                        data: (resp) {
                          return resp.match(
                            (l) {
                              print('votesCtrl failed');
                              return SizedBox();
                            },
                            (r) {
                              if (r.collection != null) {
                                firstVotingIsFinished.value = true;
                                votesAreFetched.value = true;
                                fetchedVotesCollection.value = r.collection!;
                              }
                              print('votesCtrl success');

                              return PlayersListToVote(
                                height: height,
                                width: width,
                                scrollController: scrollController,
                                resp: VoteResp(
                                  collection: fetchedVotesCollection.value,
                                ),
                              );
                            },
                          );
                        },
                        orElse: () => SizedBox(),
                        loading: () => Center(
                          child: LoadingAnimationWidget.bouncingBall(
                            color: AppColors.secondaries[2],
                            size: width / 4,
                          ),
                        ),
                      ),

                    // TODO: FIX this overflowing of the list constrains
                    if (!firstVotingIsFinished.value)
                      roomsCtrl.maybeWhen(
                        data: (rooms) {
                          final players = rooms[0]!.usersInfo!;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: height / 2.4),
                              // list of players
                              MyListView(
                                  height: height / 2.4,
                                  width: width,
                                  children: players,
                                  scrollController: playersScrollController,
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
                                              .map(
                                                (voted) => voted.id!,
                                              )
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
                                        if (voteds.value.any(
                                          (voted) =>
                                              voted.id == players[index].id,
                                        )) {
                                          voteds.value = voteds.value
                                              .where((voted) =>
                                                  voted.id != players[index].id)
                                              .toList();
                                        } else {
                                          voteds.value = [
                                            ...voteds.value,
                                            players[index],
                                          ];
                                        }
                                      },
                                    );
                                  }),

                              SizedBox(height: height / 24),

                              // confirm button
                              ConfirmVotesButton(
                                height: height,
                                width: width,
                                voteds: voteds,
                                onPressed: () async {
                                  print('hey');
                                  final result = await ref
                                      .read(votesControllerProvider.notifier)
                                      .vote(
                                        voted: voteds.value
                                            .map(
                                              (voted) => voted.id!,
                                            )
                                            .toList(),
                                      );
                                  result.match(
                                    (l) {
                                      print('vote failed');
                                    },
                                    (r) {
                                      print('vote success');
                                      log(r.toString());
                                    },
                                  );
                                },
                              ),
                            ],
                          );
                        },
                        orElse: () => LoadingAnimationWidget.twoRotatingArc(
                          color: AppColors.secondaries[1],
                          size: width / 4,
                        ),
                      ),
                  ],

                  // COURT RESULTS

                  // We show the court results: who is going to be executed and the exit cart
                  if (courtIsFinished.value) ...[
                    // load the game
                    if (situationsCtrl.value!
                            .getOrElse(
                              (_) => SituationsResp.empty(),
                            )
                            .situation!
                            .situation ==
                        'court_result')
                      Column(),

                    // live
                    if (!(situationsCtrl.value!
                            .getOrElse(
                              (_) => SituationsResp.empty(),
                            )
                            .situation!
                            .situation ==
                        'court_result'))
                      live.whenData(
                            (events) {
                              final lstEvent = events.lastOrNull;
                              if (lstEvent is CourtResult) {
                                // if the player is the one who is going to be executed
                                // show the eixt card to the player + list of other live players
                                if (lstEvent.exitedPlayerId ==
                                    SharedPrefs.userID) {
                                  return ExitingThePlayer(
                                    lstEvent: lstEvent,
                                    roomsCtrl: roomsCtrl,
                                    height: height,
                                    width: width,
                                    scrollController: scrollController,
                                    exitCard: lstEvent.exitCard,
                                  );
                                }

                                return Column(
                                  children: [
                                    Text(
                                      'دادگاه پایان یافت',
                                      style:
                                          MyTextStyles.headlineSmall.copyWith(
                                        color: AppColors.lightestGrey,
                                      ),
                                    ),
                                    Text(
                                      'بازیکن انتخاب شده برای اعدام:',
                                      style:
                                          MyTextStyles.headlineSmall.copyWith(
                                        color: AppColors.lightestGrey,
                                      ),
                                    ),
                                    Text(
                                      lstEvent.exitedPlayerName,
                                      style:
                                          MyTextStyles.headlineSmall.copyWith(
                                        color: AppColors.lightestGrey,
                                      ),
                                    ),
                                    Text(
                                      'حرکت آخر:',
                                      style:
                                          MyTextStyles.headlineSmall.copyWith(
                                        color: AppColors.lightestGrey,
                                      ),
                                    ),
                                    Text(
                                      lstEvent.exitCard,
                                      style:
                                          MyTextStyles.headlineSmall.copyWith(
                                        color: AppColors.lightestGrey,
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return SizedBox();
                            },
                          ).valueOrNull ??
                          SizedBox(),
                  ]
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
    );
  }
}

class ExitingThePlayer extends StatelessWidget {
  const ExitingThePlayer({
    super.key,
    required this.lstEvent,
    required this.roomsCtrl,
    required this.height,
    required this.width,
    required this.scrollController,
    required this.exitCard,
  });

  final AppEvent? lstEvent;
  final AsyncValue<List<Room?>> roomsCtrl;
  final double height;
  final double width;
  final ScrollController scrollController;
  final String exitCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'دادگاه پایان یافت',
          style: MyTextStyles.headlineSmall.copyWith(
            color: AppColors.lightestGrey,
          ),
        ),
        Text(
          'حرکت آخر: $exitCard',
          style: MyTextStyles.headlineSmall.copyWith(
            color: AppColors.lightestGrey,
          ),
        ),
        Text(
          'بازیکنان:',
          style: MyTextStyles.headlineSmall.copyWith(
            color: AppColors.lightestGrey,
          ),
        ),
        roomsCtrl.whenData(
              (rooms) {
                final players = rooms[0]!.usersInfo!;
                return MyListView(
                  height: height / 2.4,
                  width: width,
                  children: players,
                  scrollController: scrollController,
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
                          if (players[index].id == SharedPrefs.userID) ...[
                            AppColors.primaries[2],
                            AppColors.primaries[3],
                          ] else ...[
                            AppColors.secondaries[2],
                            AppColors.secondaries[3],
                          ]
                        ],
                      ),
                      title: players[index].fullName!,
                      onTap: () {},
                    );
                  },
                );
              },
            ).valueOrNull ??
            SizedBox(),
      ],
    );
  }
}
