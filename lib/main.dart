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
  runApp(
    const ProviderScope(
      overrides: [],
      child: MainApp(),
    ),
  );
  await playSound(AppAudios.pedarKhandeh, isLoop: true);
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
      ],
      // builder: (context, child) {},
    );
  }
}
