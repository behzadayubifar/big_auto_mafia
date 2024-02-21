import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Widget GridOfPlayers({
  required AsyncValue<List<Player>> asyncAlivePlayers,
  required double height,
  required double width,
  required ValueNotifier<List<String>>? selectedPlayers,
  required ScrollController scrollController,
  Axis axix = Axis.horizontal,
}) {
  return Center(
    child: Center(
      child: switch (asyncAlivePlayers) {
        AsyncData(:final value) => SizedBox(
            height: axix == Axis.horizontal ? height / 6 : height / 2,
            width: width / 1.2,
            child: Scrollbar(
              controller: scrollController,
              child: GridView.builder(
                controller: scrollController,
                shrinkWrap: true,
                scrollDirection: axix,
                cacheExtent: height / 1.64,
                restorationId: 'day-page',
                clipBehavior: Clip.antiAlias,
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      MyButton(
                        onPressed: () {
                          if (selectedPlayers.value
                              .contains(value[index].playerName!)) {
                            selectedPlayers.value = selectedPlayers.value
                                .where((element) =>
                                    element != value[index].playerName!)
                                .toList();
                          } else {
                            selectedPlayers.value = [
                              ...selectedPlayers.value,
                              value[index].playerName!
                            ];
                          }
                        },
                        title: value[index].playerName!,
                        selected: selectedPlayers!.value
                            .contains(value[index].playerName!),
                      ),
                    ],
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: axix == Axis.horizontal ? 2 : 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: axix == Axis.horizontal ? .36 : 4,
                ),
              ),
            ),
          ),
        _ => defaultLoading,
      },
    ),
  );
}