import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/gen/assets.gen.dart';
import 'package:auto_mafia/models/role_datasets.dart';

enum InfoOptions {
  naming,
  showRoles,
}

class Info {
  Info._();

  static const Map<String, String> naming = {
    'title': MyStrings.titleNaming,
    'button': MyStrings.startGame,
    'numberOfPlayers': MyStrings.titleNumberOfPlayers,
    'count': MyStrings.nPlayer,
  };

  static const Map<String, String> showRoles = {
    'title': MyStrings.rolesTitiel,
    'button': MyStrings.assignRole,
  };

  static const Map<String, String> night = {
    'title': MyStrings.nightTitle,
    'button': MyStrings.seeNightResults,
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

      // never must be shown
      default:
        return Assets.charactersSpecific.citizen.path;
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
