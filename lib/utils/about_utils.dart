import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';

rateInMyket() async {
  if (Platform.isAndroid) {
    // String url = "myket://comment?id=ir.bezidev.auto_mafia";
    String url = "bazaar://details?id=" + "ir.bezidev.auto_mafia";

    AndroidIntent intent = AndroidIntent(
      action: 'action_view',
      data: url,
      // arguments: {'authAccount': currentUserEmail},
    );
    await intent.launch();
  }
}
