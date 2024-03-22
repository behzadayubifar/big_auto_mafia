import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/last_moves_logics.dart';
import 'package:auto_mafia/logic/logics.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

ProviderContainer _createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );
  return container;
}

final _container = _createContainer();

void showLastMoveDialog({
  required BuildContext context,
  required String lastMoveName,
  required String playerWithCardName,
  required String playerWithCardRoleName,
  required List<String> selectedPlayers,
}) async {
  //
  print(lastMoveName);
  //
  final isar = await _container.read(isarServiceProvider.future);
  //
  String title = switch (lastMoveName) {
    MyStrings.faceOff => 'تعویض نقش',
    MyStrings.beautifulMind => 'نتیجۀ حدس نوستراداموس',
    MyStrings.silenceOfSheep => 'اهدای سکوت',
    MyStrings.roleReveal => 'اعلام نقش',
    MyStrings.handCuff => 'اهدای دستبند',
    _ => 'اشتباه',
  };
  //

  late final String? selectedPlayerRoleName;

  if (lastMoveName == MyStrings.faceOff ||
      lastMoveName == MyStrings.beautifulMind) {
    selectedPlayerRoleName = await isar
        .getPlayerByName(selectedPlayers.single)
        .then((value) => value!.roleName);
  }

  String desc = switch (lastMoveName) {
    MyStrings.faceOff =>
      '$playerWithCardName با نقش $playerWithCardRoleName نقش خود را با ${selectedPlayers.single} با نقش $selectedPlayerRoleName عوض کرد',
    MyStrings.beautifulMind => selectedPlayerRoleName == MyStrings.nostradamous
        ? 'شما به جای ${selectedPlayers.single} در بازی می‌مانید'
        : '${selectedPlayers.single} نوستراداموس نیست',
    MyStrings.silenceOfSheep =>
      '${selectedPlayers.join(', ')} روز بعد نمی‌تواند صحبت کند',
    MyStrings.roleReveal => '',
    MyStrings.handCuff =>
      '$playerWithCardName دستبند خود را به ${selectedPlayers.single} اهدا کرد',
    _ => 'اشتباه',
  };
  //

  AwesomeDialog(
    dismissOnBackKeyPress: false,
    dismissOnTouchOutside: false,
    context: context,
    dialogBackgroundColor: AppColors.lighterGrey,
    dialogType: DialogType.INFO,
    animType: AnimType.LEFTSLIDE,
    body: Column(
      children: [
        SizedBox(height: 32),
        Text(title,
            style: MyTextStyles.headlineSmall.copyWith(
              height: 1,
            )),
        SizedBox(height: 40),
        Text(
          desc,
          // overflow: TextOverflow.ellipsis
          // maxLines: 5,
          style: MyTextStyles.bodyLarge.copyWith(height: 1.5),
        ),
      ],
    ),
    // title: title,
    // desc: desc,
    btnOk: MyButton(
      title: MyStrings.nextNight,
      onLongPress: () async {
        // await _container
        //     .read(currentPlayersProvider.notifier)
        //     .action(MyStrings.nightPage);
        // final today = await isar.getDayNumber();
        switch (lastMoveName) {
          case MyStrings.faceOff:
            await faceOff(
              playerWithCardName: playerWithCardName,
              otherPlayerName: selectedPlayers.single,
            );
            break;
          case MyStrings.handCuff:
            await handCuff(playerName: selectedPlayers.single);
            break;
          case MyStrings.silenceOfSheep:
            await silenceOfSheep(playersNames: selectedPlayers);
            break;
          case MyStrings.roleReveal:
            await identityReveal(playerName: selectedPlayers.single);
            break;
          case MyStrings.beautifulMind:
            final isGuessedNostradamous = await beautifulMind(
                guessedToBeNostradamous: selectedPlayers.single);
            if (isGuessedNostradamous) {
              await isar.updatePlayer(
                playerName: selectedPlayers.single,
                disclosured: true,
                isReversible: false,
                heart: 0,
              );
              await isar.updatePlayer(
                playerName: playerWithCardName,
                heart: 1,
              );
            }

            break;
          default:
            print('no last move');
        }

        await god(isGettingDay: false);

        //
        context.goNamed('night', extra: await Info.night());
      },
    ),
  )..show();
}
