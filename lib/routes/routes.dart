import 'dart:developer';

import 'package:auto_mafia/offline/constants/my_strings.dart';
import 'package:auto_mafia/offline/db/entities/player.dart';
import 'package:auto_mafia/offline/db/entities/user.dart';
import 'package:auto_mafia/offline/db/shared_prefs/shared_prefs.dart';
import 'package:auto_mafia/offline/ui/common/loading.dart';
import 'package:auto_mafia/offline/ui/day/day.dart';
import 'package:auto_mafia/offline/ui/day/show_last_move.dart';
import 'package:auto_mafia/offline/ui/dialogs/timer_dialog_widget.dart';
import 'package:auto_mafia/offline/ui/guide/guide_screen.dart';
import 'package:auto_mafia/offline/ui/home/about_us_screen.dart';
import 'package:auto_mafia/offline/ui/home/home_page.dart';
import 'package:auto_mafia/offline/ui/home/splash_screen.dart';
import 'package:auto_mafia/offline/ui/night/night_page.dart';
import 'package:auto_mafia/offline/ui/night/night_role_panel.dart';
import 'package:auto_mafia/offline/ui/show_roles/show_role_page.dart';
import 'package:auto_mafia/offline/ui/statements/chaos_page.dart';
import 'package:auto_mafia/offline/ui/statements/game_over_page.dart';
import 'package:auto_mafia/offline/ui/statements/nights_results_page.dart';
import 'package:auto_mafia/offline/ui/ui_widget/names_list_show/naming_page.dart';
import 'package:auto_mafia/online/data/models/responses/rooms.dart';
import 'package:auto_mafia/online/presentation/game/nights/night_game_page.dart';
import 'package:auto_mafia/online/presentation/rooms/waiting_room.dart';
import 'package:auto_mafia/online/presentation/users/controller/accounts_controller.dart';
import 'package:auto_mafia/online/presentation/users/panel/panel.dart';
import 'package:auto_mafia/online/presentation/users/sign_up/user_entry.dart';
import 'package:auto_mafia/offline/ui/x_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../offline/db/entities/room.dart';
import '../online/presentation/game/game_page.dart';
import '../online/presentation/rooms/room_entry.dart';
import '../offline/ui/home/online_offline_page.dart';
import '../online/presentation/rooms/show_role_online.dart';

part 'routes.g.dart';

class NavigationService {
  static final navigatorKey = GlobalKey<NavigatorState>();
}

@riverpod
GoRouter router(RouterRef ref) {
  // var _name;
  // var _coins;

  // var _extra = <String, dynamic>{};

  return GoRouter(
    // observers: [MyNavigatorOserver()],
    debugLogDiagnostics: true,
    navigatorKey: NavigationService.navigatorKey,
    // initialLocation: '/name_list/show-roles',
    // initialLocation: '/night',
    // initialLocation: '/night/:${MyStrings.showMyRole}',
    // initialLocation: '/night-role-panel',
    // initialLocation: '/night_timer',
    // last was this :
    // initialLocation: '/name_list',
    // initialLocation: '/',
    initialLocation: '/splash',
    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Text('Error: ${state.error}'),
        ),
      );
    },
    // initialLocation: '/nights_results',
    // initialLocation: '/day',
    // initialLocation: '/x-page',
    // initialLocation: '/chaos',

    routes: <RouteBase>[
      GoRoute(
        path: '/splash',
        builder: (context, state) => SplashScreen(),
      ),
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
        // path: '/:isFinished',
        path: '/home/:isFinished',
        builder: (_, GoRouterState state) {
          final isFinished = switch (state.pathParameters['isFinished']) {
            'true' => true,
            'null' => null,
            'false' => false,
            _ => null,
          };
          print('goroter: isFinished -> ${state.pathParameters['isFinished']}');
          return HomePage(isFinished: isFinished);
          // return HomePage();
        },
      ),
      GoRoute(
        path: '/off_or_online',
        name: 'off-or-online',
        builder: (context, state) => OnlineOfflinePage(),
      ),
      GoRoute(
        path: '/online',
        name: 'online',
        redirect: (context, state) async {
          String path = "";
          // redirect user to the specific page based on the condition
          // that is already Logged in or not
          final token = SharedPrefs.getString('token');
          if (token == null) {
            path = '/online/user_entry/false';
          } else {
            final decodedToken = JwtDecoder.decode(token);
            final exp = decodedToken['exp'];
            final now = DateTime.now().millisecondsSinceEpoch / 1000;
            if (exp < now) {
              path = '/online/user_entry/true';
            } else /*  if the token is still valid  */ {
              final isLogin = state.pathParameters['isLogin'] == 'true';
              if (isLogin) {
                path = '/online/user_entry/true';
              } else if (state.fullPath == '/online') {
                print(state.fullPath == '/online');
                print('full path : ${state.fullPath}');
                // final userID = decodedToken['userID'];
                // final isar = await ref.read(isarServiceProvider.future);
                // final user = await isar.retrieveUserByID(userID);
                // // _name = user!.firstName! + ' ' + user.lastName!;
                // // _coins = user.coins ?? 0;

                // final otherAccounts = await isar.retrieveOtherUsers(userID);
                // final repeatedNames =
                //     getUsersWithRepeatedFullName(otherAccounts);
                // final currentUser = await isar.retrieveUserByID(userID);

                // add otherAccounts and repeatedNames to the extra
                // _extra = {
                //   'otherAccounts': otherAccounts,
                //   'repeatedNames': repeatedNames,
                //   'currentUser': currentUser,
                // };

                await ref
                    .read(accountsControllerProvider.notifier)
                    .getAllAccountsLocally();

                path = '/online/panel';
              } else {
                return null;
              }
            }
          }
          ref.read(loadingProvider.notifier).end();
          return path;
        },
        routes: [
          GoRoute(
              path: 'user_entry/:isLogin',
              name: 'user-entry',
              builder: (context, state) {
                final isLogin = state.pathParameters['isLogin'] == 'true';
                final userName = state.extra as String?;
                return UserEntry(
                  isLogin: isLogin,
                  userName: userName,
                );
              }),
          GoRoute(
            path: 'panel',
            name: 'panel',
            builder: (context, state) {
              return Panel();
            },
          ),
          GoRoute(
              path: 'room_entry',
              name: 'room-entry',
              builder: (context, state) {
                return RoomEntry();
              }),
          GoRoute(
              path: 'waiting_room',
              name: 'waiting-room',
              builder: (context, state) {
                return WaitingRoom();
              }),
          GoRoute(
            path: 'show_role',
            name: 'show-role',
            builder: (context, state) {
              final PlayerOnline player;
              switch (state.extra.runtimeType) {
                case PlayerOnline:
                  player = state.extra as PlayerOnline;
                  break;
                default:
                  player = PlayerOnline.fromJson(
                      state.extra! as Map<String, dynamic>);
              }
              return ShowRoleOnline(
                player: player,
              );
            },
          ),
          GoRoute(
            path: 'game_page',
            name: 'game-page',
            builder: (context, state) {
              return GamePage();
            },
          ),
          GoRoute(
            path: 'night_game_page',
            name: 'night-game-page',
            builder: (context, state) {
              return NightGamePage();
            },
          ),
        ],
      ),

      // ------------------ Offline ------------------
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
          final info = state.extra as Map<String, dynamic>;
          log('info: $info', name: 'night-info');
          if (info['situation'] == MyStrings.nightPage) {
            WidgetsBinding.instance.scheduleFrameCallback((timeStamp) {
              if (int.tryParse(info['nightNumber'])! >= 1 &&
                  info['isAnyoneDoneNightJob'] == 'false')
                Overlay.of(context).insert(timerOverlay);
            });
          }
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
          final bool? hasMafiaBuyedOnce = info['hasMafiaBuyedOnce'];
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
          final players = state.extra as List<Player>;
          return GameOverPage(
            winner: winner,
            players: players,
          );
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
        name: 'guide',
        path: '/guide',
        builder: (context, state) {
          return GuideScreen();
        },
      ),
      GoRoute(
        name: 'about',
        path: '/about',
        builder: (context, state) {
          return AboutUsScreen();
        },
      ),
      GoRoute(
        name: 'last-move',
        path:
            '/last_move/:lastMove/:playerWithCardName/:playerWithCardRoleName',
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
}






// class MyNavigatorOserver extends NavigatorObserver {
//   // @override
//   // void didPush(Route route, Route? previousRoute) {
//   //   super.didPush(route, previousRoute);
//   //   log('didPush: ${route.settings.name}', name: 'navigator-observer');
//   // }

//   @override
//   void didPop(Route route, Route? previousRoute) {
//     print(previousRoute);
//     // check if the previous route is empty or not if it is empty then it means that the app is going to be closed so show a dialog
//     if (previousRoute == null) {
//       // print(previousRoute);
//       log('didPop: ${route.settings.name}', name: 'navigator-observer');
//       AwesomeDialog(
//         context: route.navigator!.context,
//         dialogType: DialogType.WARNING,
//         animType: AnimType.SCALE,
//         title: 'خروج از برنامه',
//         desc: 'آیا می خواهید از برنامه خارج شوید؟',
//         btnCancelOnPress: () {},
//         btnOkOnPress: () {
//           exit(0);
//         },
//       );
//     } else {
//       log('didPop: ${route.settings.name}', name: 'navigator-observer');
//       super.didPop(route, previousRoute);
//     }
//   }

//   @override
//   void
// }
