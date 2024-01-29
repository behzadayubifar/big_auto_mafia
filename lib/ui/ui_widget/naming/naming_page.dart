import 'dart:developer';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/metrics.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/logics_utils.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:auto_mafia/ui/ui_widget/naming/player_name_frame_widget.dart';
import 'package:auto_mafia/ui/common/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

List<String> _listOfPlayersNames = [];

class NamingPage extends HookConsumerWidget {
  const NamingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isar = ref.read(isarServiceProvider.future);
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
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title-Widget
              TiTleTile(title: MyStrings.titleNaming),
              // some-space
              const SizedBox(height: Metrics.titleBottomPadding),
              // list-of-players-names
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * .6,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 11,
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
              ElevatedButton(
                child: Text('شروع بازی'),
                onPressed: () async => await _start(_controllers, isar),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Future<void> _start(List<TextEditingController> _controllers,
      Future<IsarService> isar) async {
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
  }
}
