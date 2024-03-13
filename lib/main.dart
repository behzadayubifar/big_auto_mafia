import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:auto_mafia/audio/audio_assets.dart';
import 'package:auto_mafia/audio/audio_service.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/load_logics.dart';
import 'package:auto_mafia/routes/routes.dart';
import 'package:auto_mafia/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _container = ProviderContainer();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // find the current platform

  runApp(
    const ProviderScope(
      overrides: [],
      child: MainApp(),
    ),
  );
  // await playSound(AppAudios.pedarKhandeh, isLoop: true);
  // final isar = await createContainer().read(isarServiceProvider.future);
  // await isar.clearAll();
  // await isar.putGameStatus(dayNumber: 0);
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final _theme = ref.watch(autoMafiaThemeProvider.notifier).theme();
    // final isar = ref.watch(isarServiceProvider.future);

    return MaterialApp.router(
      // handle back button for quitting the app and showing a dialog

      title: 'Auto Mafia',
      /* backButtonDispatcher: RootBackButtonDispatcher(), */
      routerConfig: router,
      theme: _theme,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      locale: const Locale('fa', 'IR'),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: <Locale>[
        Locale('fa', 'IR'),
        Locale('en', 'US'),
      ],
      // builder: (context, child) {
      //   // manage the back button
      //   return PopScope(
      //     child: child!,
      //     // check if the previous route is empty or not if it is empty then it means that the app is going to be closed so show a dialog
      //     // get the previous route and check if it is null then show a dialog
      //     onPop: (route, previousRoute) async {
      //       if (previousRoute == null) {
      //         // print(previousRoute);
      //         // log('didPop: ${route.settings.name}', name: 'navigator-observer');
      //         await showDialog(
      //           context: route.navigator!.context,
      //           builder: (context) {
      //             return AlertDialog(
      //               title: const Text('خروج از برنامه'),
      //               content: const Text('آیا می خواهید از برنامه خارج شوید؟'),
      //               actions: <Widget>[
      //                 TextButton(
      //                   onPressed: () {
      //                     Navigator.of(context).pop();
      //                   },
      //                   child: const Text('خیر'),
      //                 ),
      //                 TextButton(
      //                   onPressed: () {
      //                     if (Platform.isAndroid) {
      //                       AndroidIntent intent = AndroidIntent(
      //                         action: 'android.intent.action.MAIN',
      //                         category: 'android.intent.category.HOME',
      //                       );
      //                       intent.launch();
      //                     }
      //                     // exit(0);
      //                   },
      //                   child: const Text('بله'),
      //                 ),
      //               ],
      //             );
      //           },
      //         );
      //       } else {
      //         // log('didPop: ${route.settings.name}', name: 'navigator-observer');
      //         return true;
      //       }
      //     },
      //   );
      // },
    );
  }
}
