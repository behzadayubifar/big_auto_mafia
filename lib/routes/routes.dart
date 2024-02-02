import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/ui/home/home_page.dart';
import 'package:auto_mafia/ui/night/night_page.dart';
import 'package:auto_mafia/ui/night/night_role_panel.dart';
import 'package:auto_mafia/ui/show_roles/show_role_page.dart';
import 'package:auto_mafia/ui/ui_widget/names_list_show/naming_page.dart';
import 'package:auto_mafia/ui/x_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final routerProvider = Provider<GoRouter>((_) => _router);

final _router = GoRouter(
  debugLogDiagnostics: true,
  // initialLocation: '/name_list/show-roles',
  // initialLocation: '/night',
  // initialLocation: '/night/:${MyStrings.showMyRole}',
  initialLocation: '/name_list',
  // initialLocation: '/night-role-panel',

  routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: 'name-list',
      path: '/name_list',
      builder: (context, state) => const NamingPage(),
      routes: [
        GoRoute(
            name: 'show-roles',
            path: 'show-roles/:role',
            builder: (context, state) {
              final role = state.pathParameters['role'];
              return ShowRolePage(role: role!);
            }),
      ],
    ),
    GoRoute(
      name: 'night',
      path: '/night',
      builder: (context, state) {
        final info = state.extra as Map<String, String>;
        return NightPage(info: info);
      },
    ),
    GoRoute(
      name: 'x-page',
      path: '/x-page',
      builder: (context, state) => XWidget(),
      // builder: (context, state) => XPage(),
    ),
    GoRoute(
        name: 'night_role_panel',
        path: '/night-role-panel',
        builder: (context, state) {
          final Map<String, String> info = state.extra as Map<String, String>;
          final String name = info['name']!;
          final String role = info['role']!;
          // final String name = 'بازیکن 7';
          // final String role = 'کنستانتین';

          return NightRolePanel(name: name, role: role);
        }),
  ],
);
