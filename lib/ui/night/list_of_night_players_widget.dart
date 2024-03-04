import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/logic/night_choices_logics.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:flutter/material.dart';

class ListOfNightPlayersWidget extends StatelessWidget {
  const ListOfNightPlayersWidget({
    super.key,
    required double height,
    required this.scrollController,
    required double width,
    required this.choice,
    required this.role,
    required this.nightFuture,
    required this.putChoiceLocally,
    required this.playersList,
    required this.nostradamousChoices,
    this.purpose,
  })  : _height = height,
        _width = width;

  final double _height;
  final ScrollController scrollController;
  final double _width;
  final ValueNotifier<String> choice;
  final String role;
  final Future<int> nightFuture;
  final Function({
    required String newChoice,
  }) putChoiceLocally;
  final List<Player> playersList;
  final List<String> nostradamousChoices;
  final String? purpose;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: SizedBox(
        // width: _width / 1.5,
        height: _height / 1.8,
        child: SafeArea(
          minimum: EdgeInsets.only(top: _height / 15),
          child: Scrollbar(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (purpose != null)
                  Padding(
                    padding: EdgeInsets.only(bottom: _height / 56),
                    child: Text(
                      MyStrings.shootInPlaceOfGodfather,
                      style: MyTextStyles.bodyMD.copyWith(
                        color: AppColors.secondaries[1],
                      ),
                    ),
                  ),
                Expanded(
                  child: SizedBox(
                    width: _width / 2,
                    height: _height / 1.64,
                    child: ListView.separated(
                      controller: scrollController,
                      cacheExtent: _height / 1.64,
                      restorationId: 'night-page',
                      clipBehavior: Clip.antiAlias,
                      itemCount: playersList.length,
                      itemBuilder: (context, index) {
                        final selectedPlayer = playersList[index];
                        return MyButton(
                          title: selectedPlayer.playerName!,
                          player: selectedPlayer,
                          selected: nostradamousChoices.isEmpty
                              ? selectedPlayer.playerName == choice.value
                              : nostradamousChoices
                                  .contains(selectedPlayer.playerName!),
                          place: MyStrings.nightPlayer,

                          // criteria: ,
                          // onDoubleTap: role != MyStrings.godfather
                          //     ? null
                          //     : () async {
                          //         return putGodfatherChoice(
                          //           night: await nightFuture,
                          //           name: selectedPlayer.playerName!,
                          //           guessedRole: selectedPlayer.roleName!,
                          //         );
                          //       },
                          // onLongPress: putChoiceLocally,
                          onPressed: () => putChoiceLocally(
                            newChoice: selectedPlayer.playerName!,
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: _height / 56);
                      },
                    ),
                  ),
                ),
                SizedBox(height: _height / 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
