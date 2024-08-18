import 'package:flutter/services.dart';

const channel = const MethodChannel("ir.bezidev.auto_mafia/update");

Future<Map<String, dynamic>?> checkAppUpdate() async {
  try {
    final Map<String, dynamic> result =
        await channel.invokeMethod('checkAppUpdate');
    return result;
  } on PlatformException catch (e) {
    print("Failed to check for app update: '${e.message}'.");
    return null;
  }
}

Future<({bool isUpdateAvailable, String description, int versionCode})?>
    checkForUpdate() async {
  Map<String, dynamic>? updateInfo = await checkAppUpdate();
  if (updateInfo != null) {
    bool isUpdateAvailable = updateInfo['isUpdateAvailable'];
    String description = updateInfo['description'];
    int versionCode = updateInfo['versionCode'];
    // Handle update information
    return (
      isUpdateAvailable: isUpdateAvailable,
      description: description,
      versionCode: versionCode,
    );
  } else {
    // Handle error
    return null;
  }
}
