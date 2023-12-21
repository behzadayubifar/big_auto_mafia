import 'package:auto_mafia/ui/assign_roles_page.dart';
import 'package:auto_mafia/ui/home/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final routerProvider = Provider<GoRouter>((_) => _router);

final _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: 'assign-roles',
      path: '/assign-roles',
      builder: (context, state) => AssignRolesScreen(),
    ),
  ],
);
