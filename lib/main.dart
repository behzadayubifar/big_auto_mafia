import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/routes/routes.dart';
import 'package:auto_mafia/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

ProviderContainer createContainer({
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
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
    final isar = ref.watch(isarServiceProvider.future);

    return MaterialApp.router(
      title: 'Auto Mafia', backButtonDispatcher: RootBackButtonDispatcher(),
      routerConfig: router,
      theme: _theme,
      // darkTheme: ThemeData(brightness: Brightness.dark),
      // themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      locale: const Locale('fa', 'IR'),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: <Locale>[
        Locale('fa', 'IR'), // Israeli Hebrew
        // ...
      ],
    );
  }
}
