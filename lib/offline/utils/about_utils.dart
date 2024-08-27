import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';

rateIn(String market) async {
  if (Platform.isAndroid) {
    String url = switch (market) {
      'myket' => "myket://comment?id=ir.bezidev.auto_mafia",
      'bazaar' => 'bazaar://details?id=ir.bezidev.auto_mafia',
      _ => 'bazaar://details?id=ir.bezidev.auto_mafia',
    };
    // String url = "bazaar://details?id=" + "ir.bezidev.auto_mafia";

    AndroidIntent intent = AndroidIntent(
      action: 'action_view',
      data: url,
      // arguments: {'authAccount': currentUserEmail},
    );
    await intent.launch();
  }
}
