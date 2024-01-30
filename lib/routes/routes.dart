import 'package:auto_mafia/ui/assign_roles_page.dart';
import 'package:auto_mafia/ui/home/home_page.dart';
import 'package:auto_mafia/ui/night/night_page.dart';
import 'package:auto_mafia/ui/night/night_role_panel.dart';
import 'package:auto_mafia/ui/ui_widget/naming/names_list.dart';
import 'package:auto_mafia/ui/x_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final routerProvider = Provider<GoRouter>((_) => _router);

final _router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/night',
  // initialLocation: '/night',
  routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    // GoRoute(
    //   name: 'assign-roles',
    //   path: '/assign-roles',
    //   builder: (context, state) => AssignRolesScreen(),
    // ),
    GoRoute(
      name: 'name-list',
      path: '/name_list',
      builder: (context, state) => const NamesList(),
    ),
    GoRoute(
      name: 'night',
      path: '/night',
      builder: (context, state) => NightPage(),
    ),
    GoRoute(
      name: 'x-page',
      path: '/x-page',
      builder: (context, state) => ShowTest1(),
      // builder: (context, state) => XPage(),
    ),

    GoRoute(
        name: 'night_role_panel',
        path: '/night-role-panel',
        builder: (context, state) {
          final Map<String, String> info = state.extra as Map<String, String>;
          return NightRolePanel();
        }),
  ],
);
