import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/ui/common/timers/night_timer.dart';
import 'package:auto_mafia/ui/day/day.dart';
import 'package:auto_mafia/ui/day/show_last_move.dart';
import 'package:auto_mafia/ui/home/home_page.dart';
import 'package:auto_mafia/ui/night/night_page.dart';
import 'package:auto_mafia/ui/night/night_role_panel.dart';
import 'package:auto_mafia/ui/show_roles/show_role_page.dart';
import 'package:auto_mafia/ui/statements/nights_results.dart';
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
  // initialLocation: '/night-role-panel',
  // initialLocation: '/night_timer',
  // last was this :
  initialLocation: '/name_list',
  // initialLocation: '/nights_results',
  // initialLocation: '/day',
  // initialLocation: '/x-page',

  routes: <RouteBase>[
    GoRoute(
      name: 'nights-results',
      path: '/nights_results',
      builder: (context, state) {
        // final Map<String, dynamic> info = {
        //   'tonight': '1',
        //   'bornPlayer': 'بازیکن 7',
        //   'disclosured': 'علی موسوی',
        //   'slaughtered': 'ماتادور',
        //   'tonightDeads': ['بازیکن 3', 'بازیکن 4'],
        //   'nightCode': 1,
        //   'allDeadPlayers': [
        //     'بازیکن 1',
        //     'بازیکن 2',
        //     'بازیکن 3',
        //     'بازیکن 4',
        //     'بازیکن 5',
        //     'بازیکن 6',
        //     'بازیکن 7'
        //   ],};

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
        final info = state.extra as Map<String, dynamic>;
        final String name = info['name']!;
        final String role = info['role']!;
        final String code = info['code']!;
        final bool isGodfatherIsAlive = info['isGodfatherIsAlive']!;
        final bool? mafiaHasBullet = info['mafiaHasBullet'];
        final int night = info['night']!;
        final List<Player> playersListForShootInAbsenceOfGodfather =
            info['playersListForShootInAbsenceOfGodfather']!;
        final bool isHandCuffed = info['isHandCuffed']!;

        return NightRolePanel(
          name: name,
          role: role,
          code: code,
          isGodfatherAlive: isGodfatherIsAlive,
          mafiaHasBullet: mafiaHasBullet,
          playersListForShootInAbsenceOfGodfather:
              playersListForShootInAbsenceOfGodfather,
          night: night,
          isHandCuffed: isHandCuffed,
        );
      },
    ),
    GoRoute(
      name: 'day',
      path: '/day/:dayNumber',
      builder: (context, state) {
        final dayNumber = int.parse(state.pathParameters['dayNumber']!);
        print('dayNumber: $dayNumber');
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
