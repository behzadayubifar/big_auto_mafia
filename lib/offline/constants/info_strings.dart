import 'package:auto_mafia/offline/constants/my_strings.dart';
import 'package:auto_mafia/offline/db/isar_service.dart';
import 'package:auto_mafia/offline/gen/assets.gen.dart';
import 'package:auto_mafia/offline/my_assets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
final Future<IsarService> _isar = _container.read(isarServiceProvider.future);

enum InfoOptions {
  naming,
  showRoles,
}

class Info {
  Info._();

  static const Map<String, String> naming = {
    'title': MyStrings.titleNaming,
    'button': MyStrings.assignRole,
    'numberOfPlayers': MyStrings.titleNumberOfPlayers,
    'count': MyStrings.nPlayer,
  };

  static const Map<String, String> showRoles = {
    'title': MyStrings.rolesTitle,
    'situation': MyStrings.showRoles,
    // 'button': MyStrings.assignRole,
  };

  static Future<Map<String, String>> night() async => {
        'title': MyStrings.nightTitle,
        'button': MyStrings.nightResults,
        'situation': MyStrings.nightPage,
        'nightNumber':
            (await _isar.then((isar) => isar.getNightNumber())).toString(),
        'isAnyoneDoneNightJob': (await _isar
                .then((isar) => isar.retrievePlayer())
                .then((players) => players.players.any(
                      (player) => player.nightDone == true,
                    )))
            .toString(),
      };

  static Map<String, String> nightRolePanel({
    required String playerName,
    required String roleName,
  }) =>
      {
        'name': playerName,
        'role': roleName,
        'image': imageByRole(roleName),
      };

  // a method to find the image of the role
  static String imageByRole(String role) {
    switch (role) {
      case "پدرخوانده":
        return Assets.charactersSpecific.godfather.path;
      case "ماتادور":
        return Assets.charactersSpecific.matador.path;
      case "سائول گودمن":
        return Assets.charactersSpecific.saul.path;
      case "کنستانتین":
        return Assets.charactersSpecific.konstantin.path;
      case "نوستراداموس":
        return Assets.charactersSpecific.predict.path;
      case "همشهری کین":
        return Assets.charactersSpecific.guess.path;
      case "لئون حرفه‌ای":
        // need also to show bullets (count based on the shots)
        return Assets.charactersSpecific.gun.path;
      case "دکتر واتسون":
        return Assets.charactersSpecific.stethoscope.path;
      case "شهروند ساده":
        return Assets.charactersSpecific.citizen.path;
      case "مافیا ساده":
        return Assets.charactersSpecific.mafia.path;

      // never must be shown
      default:
        return Assets.charactersSpecific.citizen.path;
    }
  }

  static String cardByRole(String role) {
    switch (role) {
      case "پدرخوانده":
        return MyAssets.godfatherCard;
      case "ماتادور":
        return MyAssets.matadorCard;
      case "مافیا ساده":
        return MyAssets.mafiaCard;
      case "سائول گودمن":
        return MyAssets.saulCard;
      case "کنستانتین":
        return MyAssets.konstantinCard;
      case "نوستراداموس":
        return MyAssets.nostradamousCard;
      case "همشهری کین":
        return MyAssets.kaneCard;
      case "لئون حرفه‌ای":
        // need also to show bullets (count based on the shots)
        return MyAssets.leonCard;
      case "دکتر واتسون":
        return MyAssets.watsonCard;
      case "شهروند ساده":
        return MyAssets.citizenCard;

      // never must be shown
      default:
        return MyAssets.mysteriousGangsterCharacter;
    }
  }

  static Map<String, String> updateInfo({required InfoOptions topic}) {
    switch (topic) {
      case InfoOptions.naming:
        return naming;
      case InfoOptions.showRoles:
        return showRoles;
    }
  }
}
