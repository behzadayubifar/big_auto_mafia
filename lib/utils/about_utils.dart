import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';

rateInMyket() async {
  if (Platform.isAndroid) {
    String url = "myket://comment?id=com.example.auto_mafia";
    AndroidIntent intent = AndroidIntent(
      action: 'action_view',
      data: url,
      // arguments: {'authAccount': currentUserEmail},
    );
    await intent.launch();
  }
}
