import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/entities/game_status.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/ui/day/day.dart';
import 'package:auto_mafia/ui/night/night_page.dart';
import 'package:auto_mafia/ui/statements/nights_results_page.dart';
import 'package:auto_mafia/ui/ui_widget/names_list_show/naming_page.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _container = ProviderContainer();

Future<Widget> LoadGame() async {
  final isar = await _container.read(isarServiceProvider.future);
  final dayNumber = await isar.getDayNumber();
  final situation = await isar
      .retrieveGameStatusN(n: dayNumber)
      .then((status) => status?.situation);
  //
  switch (situation) {
    case MyStrings.dayPage:
      return Day(dayNumber: dayNumber);

    case MyStrings.nightPage:
    case MyStrings.leonPage:
    case MyStrings.watsonPage:
    case MyStrings.mafiaPage:
    case MyStrings.citizenPage:
    case MyStrings.saulPage:
    case MyStrings.matadorPage:
    case MyStrings.godfatherPage:
    case MyStrings.konstantinPage:
    case MyStrings.kanePage:
    case MyStrings.predictPage:
      return NightPage(
        info: await Info.night(),
      );

    case MyStrings.nightResultsPage:
      final night = await isar.getNightNumber();
      final info = await isar.retrieveNightResults(night);
      return NightsResuls(
        allDeadPlayers: info?.allDeadPlayers,
        bornPlayer: info?.bornPlayer,
        disclosured: info?.disclosured,
        nightCode: info?.nightCode,
        tonight: '${info?.nightNumber}',
        remainedChancesForNightEnquiry:
            info?.remainedChancesForNightEnquiry ?? 0,
        slaughtered: info?.slaughtered,
        tonightDeads: info?.tonightDeads,
      );

    case MyStrings.showRoles:
      return NightPage(
        info: Info.showRoles,
      );

    // create for chaos & game over -----------------------------------

    default:
      return Day(dayNumber: dayNumber);
  }
}
