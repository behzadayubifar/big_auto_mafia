import 'dart:developer';

import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/offline/db/entities/vote.dart';
import 'package:auto_mafia/online/data/models/responses/events.dart';
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
import 'players_list_to_vote.dart';

class GamePage extends HookConsumerWidget {
  const GamePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    //
    final scrollController = useScrollController();
    final _entries = useState<List<OverlayEntry?>>([]);
    //
    final game = ref.watch(gameControllerProvider);
    final situationsCtrl = ref.watch(situationsControllerProvider);
    final roomsCtrl = ref.watch(activeRoomsProvider);
    final live = ref.watch(appEventsProvider);
    final votesCtrl = ref.watch(votesControllerProvider);
    //
    final voteds = useState(<String>[]);
    final firstVotingIsFinished = useState(false);
    final votesAreFetched = useState(false);
    final fetchedVotesCollection = useState(VotesCollection.empty());
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
        if (event.any((e) => e is VotingFinished)) {
          // show a loading animation on the screen over the whole screen
          if (firstVotingIsFinished.value) {
            return;
          }
          final overlay = OverlayEntry(
            // opaque: false,
            builder: (context) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  ModalBarrier(
                    dismissible: false,
                    color: AppColors.backGround.withOpacity(.85),
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
          // show the loading animation
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Overlay.of(context).insertAll(Iterable.generate(
                _entries.value.length, (index) => _entries.value[index]!));
          });
          firstVotingIsFinished.value = true;
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
                    votesCtrl.whenData(
                          (resp) {
                            return resp.match(
                              (l) {
                                print('votesCtrl failed');
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
                        ).valueOrNull ??
                        SizedBox(),

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
                            ConfirmVotesButton(
                              height: height,
                              width: width,
                              voteds: voteds,
                              onPressed: () async {
                                final result = await ref
                                    .read(votesControllerProvider.notifier)
                                    .vote(
                                      voted: voteds.value,
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

class ConfirmVotesButton extends ConsumerWidget {
  const ConfirmVotesButton({
    super.key,
    required this.height,
    required this.width,
    required this.voteds,
    required this.onPressed,
  });

  final double height;
  final double width;
  final ValueNotifier<List<String>> voteds;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OnlineButton(
      title: "تأیید آراء",
      textStyle: MyTextStyles.headlineSmall.copyWith(
        color: AppColors.lightestGrey,
        height: .1,
      ),
      height: height / 12,
      width: width / 2.4,
      provider: votesControllerProvider,
      backgroundColor: AppColors.greens[2],
      onPressed: onPressed,
    );
  }
}
