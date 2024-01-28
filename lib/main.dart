import 'package:auto_mafia/routes/routes.dart';
import 'package:auto_mafia/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final _theme = ref.watch(autoMafiaThemeProvider.notifier).theme();

    return MaterialApp.router(
      title: 'Auto Mafia',
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
