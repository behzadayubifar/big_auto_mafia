import 'dart:developer';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/metrics.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/logics_utils.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:auto_mafia/ui/common/my_buttons.dart';
import 'package:auto_mafia/ui/common/player_count_dropdown.dart';
import 'package:auto_mafia/ui/ui_widget/naming/player_name_frame_widget.dart';
import 'package:auto_mafia/ui/common/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

List<String> _listOfPlayersNames = [];

class NamingPage extends HookConsumerWidget {
  const NamingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isar = ref.read(isarServiceProvider.future);

    ValueNotifier<int> _playerNumber = useState(11);
    ValueNotifier<Map<String, String>> _pageInfo = useState(Info.naming);
    String? _buttonInfo = _pageInfo.value['button'];
    print(_buttonInfo);

    final List<TextEditingController> _controllers = List.generate(
      11,
      (i) {
        return useTextEditingController(text: 'بازیکن ${i + 1}');
      },
    );

    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: SafeArea(
        minimum: EdgeInsets.only(top: Metrics.titleTopPadding),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title-Widget
                TiTleTile(title: _pageInfo.value['title']!), // 'اسامی'
                // some-space
                if (_pageInfo.value['count'] != null)
                  const SizedBox(height: 16),
                // a widget to choose how-many-players (it's a dropdown button somehow)
                AnimatedOpacity(
                    opacity: _pageInfo.value['count'] != null ? 1 : 0,
                    duration: const Duration(milliseconds: 400),
                    child: PlayersCountDropdown(playerNumber: _playerNumber)),
                // some-space
                if (_pageInfo.value['count'] != null)
                  const SizedBox(height: 20),
                // list-of-players-names
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * .56,
                    child: ListView.separated(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _playerNumber.value,
                      itemBuilder: (BuildContext context, int index) {
                        final _controller = _controllers[index];
                        return PlayerNameFrameWidget(
                          number: index + 1,
                          controller: _controller,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 16);
                      },
                    ),
                  ),
                ),
                // some-space
                const SizedBox(height: 16),
                // start-button
                if (_buttonInfo != null)
                  MyButton(
                    title: _buttonInfo,
                    onLongPress: () async {
                      switch (_buttonInfo) {
                        case MyStrings.startGame:
                          await _start(_controllers, isar, _pageInfo);
                          break;
                        case MyStrings.assignRole:
                          _pageInfo.value = Info.showRoles;
                          break;
                        // case MyStrings.next:
                        //   _pageInfo.value = InfoStrings.showRoles;
                        //   break;
                        // case MyStrings.back:
                        //   _pageInfo.value = InfoStrings.naming;
                        //   break;
                        // default:
                        //   break;
                      }
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _start(
    List<TextEditingController> _controllers,
    Future<IsarService> isar,
    ValueNotifier<Map<String, String>> _pageInfo,
  ) async {
    for (var i = 0; i < _controllers.length; i++) {
      final _controller = _controllers[i];
      final _playerName = _controller.text;
      if (_playerName != '') {
        _listOfPlayersNames.add(_playerName);
      }
    }
    log('listOfPlayersNames: $_listOfPlayersNames');
    final List<Map<String, String>> _playerRoleMapList = assignRandomRole(
      _listOfPlayersNames,
      roleNamesList(_listOfPlayersNames.length),
    ).entries.map((e) {
      return {
        e.key: e.value,
      };
    }).toList();
    log('playerRoleMapList: $_playerRoleMapList');

    // time to add players to db
    await (await isar).initializePlayers(_playerRoleMapList);

    // update info
    _pageInfo.value = Info.updateInfo(topic: InfoOptions.showRoles);
  }
}
