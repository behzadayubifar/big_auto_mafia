import 'dart:developer';

import 'package:auto_mafia/offline/db/entities/vote.dart';
import 'package:auto_mafia/online/data/models/responses/rooms.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../offline/constants/app_colors.dart';
import '../../../offline/constants/my_text_styles.dart';
import '../../data/models/responses/events.dart';
import '../../data/models/responses/votes.dart';
import '../common/lists/my_list_view.dart';
import '../votes/confirm_votes_button.dart';
import '../votes/votes_controller.dart';
import 'game_page.dart';

class PlayersListToVote extends HookConsumerWidget {
  const PlayersListToVote({
    required this.height,
    required this.width,
    required this.scrollController,
    this.event,
    this.resp,
    super.key,
  });

  final double height;
  final double width;
  final ScrollController scrollController;
  final VotesProcessed? event;
  final VoteResp? resp;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chosenForCourt = useState(List<UsersInRoom>.empty());
    //
    final VotesCollection votes;

    if (event != null) {
      votes = event!.collection;
    } else {
      votes = resp!.collection!;
    }

    final sortedVotedNames = votes.collection.entries.toList()
      ..sort((a, b) => b.value.voters.length.compareTo(a.value.voters.length));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: height / 2.4),
        MyListView(
          height: height / 2.4,
          width: width / 1.5,
          children: sortedVotedNames,
          scrollController: scrollController,
          itemBuilder: (context, index) {
            final isAmongEnoughVoted =
                votes.collection[sortedVotedNames[index].key]!.hasEnoughVotes;

            return ExpandablePanel(
              theme: ExpandableThemeData(
                iconSize: width / 16,
                iconColor: AppColors.primaries[2],
                animationDuration: Duration(milliseconds: 500),
                useInkWell: true,
              ),
              collapsed: Container(),
              header: Container(
                decoration: BoxDecoration(
                  // color: AppColors.black20,
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    // if the the voted is among the enough voted
                    // then the gradient is secondary
                    // otherwise it is primary
                    colors: isAmongEnoughVoted
                        ? [
                            AppColors.secondaries[3],
                            AppColors.secondaries[4],
                          ]
                        : [
                            AppColors.primaries[2],
                            AppColors.primaries[3],
                          ],
                    end: Alignment.topLeft,
                    begin: Alignment.bottomRight,
                    transform: GradientRotation(3.14 / 3.2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(
                        width / 32,
                        height / 64,
                        width / 64,
                        height / 64,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: (isAmongEnoughVoted)
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.spaceAround,
                        children: [
                          // voted
                          Text(
                            sortedVotedNames[index].key.fullName!,
                            style: MyTextStyles.bodyMD.copyWith(
                              color: AppColors.white,
                              height: 1.5,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          SizedBox(width: width / 32),
                          // number of votes
                          Text(
                            sortedVotedNames[index]
                                .value
                                .voters
                                .length
                                .toString(),
                            style: MyTextStyles.bodyLarge.copyWith(
                              color: AppColors.secondaries[1],
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isAmongEnoughVoted)
                      Padding(
                        padding: EdgeInsets.only(
                          left: width / 64,
                        ),
                        child: AnimatedButton(
                          text: '',
                          width: width / 8,
                          icon: chosenForCourt.value.contains(
                            sortedVotedNames[index].key,
                          )
                              ? FontAwesomeIcons.checkDouble
                              : FontAwesomeIcons.circleCheck,
                          color: chosenForCourt.value.contains(
                            sortedVotedNames[index].key,
                          )
                              ? AppColors.greens[2]
                              : AppColors.darkText,
                          pressEvent: () {
                            if (!chosenForCourt.value
                                .contains(sortedVotedNames[index].key)) {
                              chosenForCourt.value = [
                                ...chosenForCourt.value,
                                sortedVotedNames[index].key,
                              ];
                            } else {
                              chosenForCourt.value = chosenForCourt.value
                                  .where((choice) =>
                                      choice !=
                                      sortedVotedNames.elementAt(index).key)
                                  .toList();
                            }
                          },
                        ),
                      ),
                  ],
                ),
              ),
              expanded: Row(
                children: [
                  SizedBox(width: width / 32),
                  Container(
                    width: width / 1.5,
                    padding: EdgeInsets.fromLTRB(
                      width / 24,
                      height / 64,
                      width / 24,
                      height / 64,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.black20,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: sortedVotedNames[index]
                          .value
                          .voters
                          .map(
                            (voter) => Text(
                              voter.fullName!,
                              style: MyTextStyles.bodyMD.copyWith(
                                color: AppColors.white,
                                height: 1.5,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: height / 24),
        // confirm button
        ConfirmVotesButton(
          height: height,
          width: width,
          voteds: chosenForCourt,
          onPressed: () async {
            print(chosenForCourt.value);
            final result =
                await ref.read(votesControllerProvider.notifier).vote(
                      voted: chosenForCourt.value.map((e) => e.id!).toList(),
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
  }
}
