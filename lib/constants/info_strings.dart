import 'package:auto_mafia/constants/my_strings.dart';

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

  static Map<String, String> updateInfo({required InfoOptions topic}) {
    switch (topic) {
      case InfoOptions.naming:
        return naming;
      case InfoOptions.showRoles:
        return showRoles;
    }
  }
}
