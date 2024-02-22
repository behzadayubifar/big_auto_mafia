import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/logic/logics_utils.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Chaos extends HookConsumerWidget {
  const Chaos({required this.playersNames, super.key});

  final List<String> playersNames;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    //
    final handShakenPlayers = useState(<String>[]);
    final winner = useState('');
    //
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: Padding(
        padding: EdgeInsets.all(height / 56),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(winner.value.isEmpty ? 'Chaos' : 'برنده',
                  style: MyTextStyles.displayMedium
                      .copyWith(color: AppColors.primaries[2])),
              SizedBox(height: height / 20),
              if (winner.value.isNotEmpty)
                Text(
                  '${winner.value}',
                  style:
                      MyTextStyles.bodyLarge.copyWith(color: AppColors.green),
                ),
              if (winner.value.isEmpty)
                SizedBox(
                  height: height / 1.5,
                  width: width / 3,
                  child: ListView.separated(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final playerName = playersNames.elementAt(index);
                        return ElevatedButton(
                          onPressed: () {
                            if (handShakenPlayers.value.contains(playerName)) {
                              handShakenPlayers.value = handShakenPlayers.value
                                  .where((element) => element != playerName)
                                  .toList();
                            } else if (handShakenPlayers.value.length == 2) {
                              handShakenPlayers.value.removeAt(0);
                              handShakenPlayers.value = [
                                ...handShakenPlayers.value,
                                playerName
                              ];
                            } else {
                              handShakenPlayers.value = [
                                ...handShakenPlayers.value,
                                playerName
                              ];
                            }
                          },
                          child: Text(
                            playerName,
                            style: MyTextStyles.bodyMedium
                                .copyWith(color: AppColors.lightestGrey),
                          ),
                          style: ElevatedButton.styleFrom(
                            shadowColor: AppColors.lightText,
                            elevation: 9,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                            backgroundColor:
                                handShakenPlayers.value.contains(playerName)
                                    ? AppColors.secondaries[2]
                                    : AppColors.darkerGrey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            minimumSize: const Size(48, 48),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: height / 16);
                      }),
                ),
              if (winner.value.isEmpty)
                AnimatedButton(
                  text: 'دست دادن',
                  width: width / 2.5,
                  buttonTextStyle: MyTextStyles.bodyLarge,
                  color: handShakenPlayers.value.length == 2
                      ? AppColors.green
                      : AppColors.tintsOfBlack[2],
                  pressEvent: () async {
                    winner.value = await winnerOfChaod(handShakenPlayers.value);
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
