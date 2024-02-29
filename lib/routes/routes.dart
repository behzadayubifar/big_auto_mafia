import 'dart:developer';

import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:auto_mafia/ui/common/timers/night_timer.dart';
import 'package:auto_mafia/ui/day/day.dart';
import 'package:auto_mafia/ui/day/show_last_move.dart';
import 'package:auto_mafia/ui/home/home_page.dart';
import 'package:auto_mafia/ui/night/night_page.dart';
import 'package:auto_mafia/ui/night/night_role_panel.dart';
import 'package:auto_mafia/ui/show_roles/show_role_page.dart';
import 'package:auto_mafia/ui/statements/chaos_page.dart';
import 'package:auto_mafia/ui/statements/game_over_page.dart';
import 'package:auto_mafia/ui/statements/nights_results_page.dart';
import 'package:auto_mafia/ui/ui_widget/names_list_show/naming_page.dart';
import 'package:auto_mafia/ui/x_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider<GoRouter>((_) => _router);

final _router = GoRouter(
  debugLogDiagnostics: true,
  // initialLocation: '/name_list/show-roles',
  // initialLocation: '/night',
  // initialLocation: '/night/:${MyStrings.showMyRole}',
  // initialLocation: '/night-role-panel',
  // initialLocation: '/night_timer',
  // last was this :
  // initialLocation: '/name_list',
  initialLocation: '/',
  // initialLocation: '/nights_results',
  // initialLocation: '/day',
  // initialLocation: '/x-page',
  // initialLocation: '/chaos',

  routes: <RouteBase>[
    GoRoute(
      name: 'nights-results',
      path: '/nights_results',
      builder: (context, state) {
        final info = state.extra as Map<String, dynamic>;

        return NightsResuls(
          tonight: info['tonight']!.toString(),
          bornPlayer: info['bornPlayer'],
          disclosured: info['disclosured'],
          slaughtered: info['slaughtered'],
          tonightDeads: info['tonightDeads'],
          nightCode: info['nightCode'],
          allDeadPlayers: info['allDeadPlayers'],
          remainedChancesForNightEnquiry:
              info['remainedChancesForNightEnquiry'],
        );
      },
    ),
    GoRoute(
      name: 'home',
      path: '/',
      builder: (_, __) => HomePage(),
      // redirect: (context, state) async {
      //   final isar = await _container.read(isarServiceProvider.future);
      //   final isFinished = await isar
      //       .retrieveGameStatusN(n: await isar.getDayNumber())
      //       .then((status) => status?.isFinished);
      //   if (isFinished == false) {
      //     context.go('/name_list');
      //   } else {
      //     context.go('/');

      //     return;
      //   }
      // },
    ),
    GoRoute(
      name: 'name-list',
      path: '/name_list',
      builder: (context, state) => NamingPage(),
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
        print('here going to night');
        final info = state.extra as Map<String, dynamic>;
        log('info: $info', name: 'night-info');
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
        final info = state.extra as Map<String, dynamic>;
        final String name = info['name']!;
        final String role = info['role']!;
        final String code = info['code']!;
        final bool isGodfatherAlive = info['isGodfatherAlive']!;
        final bool? mafiaHasBullet = info['mafiaHasBullet'];
        final int night = info['night']!;
        final List<Player> playersListForShootInAbsenceOfGodfather =
            info['playersListForShootInAbsenceOfGodfather']!;
        final bool isHandCuffed = info['isHandCuffed']!;
        final bool isOneOfMafiaDead = info['isOneOfMafiaDead'];
        final bool hasMafiaBuyedOnce = info['hasMafiaBuyedOnce'];
        final List<Player>? otherMafias = info['otherMafias'];

        return NightRolePanel(
          name: name,
          role: role,
          code: code,
          isGodfatherAlive: isGodfatherAlive,
          mafiaHasBullet: mafiaHasBullet,
          playersListForShootInAbsenceOfGodfather:
              playersListForShootInAbsenceOfGodfather,
          night: night,
          isHandCuffed: isHandCuffed,
          isOneOfMafiaDead: isOneOfMafiaDead,
          hasMafiaBuyedOnce: hasMafiaBuyedOnce,
          otherMafias: otherMafias,
        );
      },
    ),
    GoRoute(
      name: 'game-over',
      path: '/game_over/:winner',
      builder: (context, state) {
        final winner = state.pathParameters['winner']!;
        return GameOverPage(winner: winner);
      },
    ),
    GoRoute(
      name: 'chaos',
      path: '/chaos',
      builder: (context, state) {
        final threeRemainedPlayers = state.extra as List<String>;
        // final threeRemainedPlayers = [
        //   'بازیکن 1',
        //   'بازیکن 2',
        //   'بازیکن 3',
        // ];
        return Chaos(playersNames: threeRemainedPlayers);
      },
    ),
    GoRoute(
      name: 'day',
      path: '/day/:dayNumber',
      builder: (context, state) {
        final dayNumber = int.parse(state.pathParameters['dayNumber']!);
        print('dayNumber ...: $dayNumber');
        return Day(
          dayNumber: dayNumber,
        );
      },
    ),
    GoRoute(
      name: 'last-move',
      path: '/last_move/:lastMove/:playerWithCardName/:playerWithCardRoleName',
      builder: (context, state) {
        final String lastMove = state.pathParameters['lastMove']!;
        final String playerWithCardName =
            state.pathParameters['playerWithCardName']!;
        final String playerWithCardRoleName =
            state.pathParameters['playerWithCardRoleName']!;
        return ShowLastMove(
          lastMoveName: lastMove,
          playerWithCardName: playerWithCardName,
          playerWithCardRoleName: playerWithCardRoleName,
        );
      },
    ),
  ],
);
