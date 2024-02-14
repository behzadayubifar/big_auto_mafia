import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/metrics.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/common/player_count_dropdown.dart';
import 'package:auto_mafia/ui/ui_widget/names_list_show/names_list_funcs.dart';
import 'package:auto_mafia/ui/ui_widget/names_list_show/player_naming_frame_widget.dart';
import 'package:auto_mafia/ui/common/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

List<String> _listOfPlayersNames = [];

class NamingPage extends HookConsumerWidget {
  const NamingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isar = ref.read(isarServiceProvider.future);

    ValueNotifier<int> _playerNumber = useState(11);
    ValueNotifier<Map<String, String>> _pageInfo = useState(Info.naming);
    String? _buttonInfo = _pageInfo.value['button'];
    // print(_buttonInfo);

    final List<TextEditingController> _controllers = List.generate(
      _playerNumber.value,
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

                // list-of-players-names-with-text-fields
                if (_pageInfo.value['title'] == MyStrings.titleNaming)
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
                          return PlayerNamingFrameWidget(
                            withNumber:
                                _pageInfo.value['count'] != null ? true : false,
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

                // spacer
                const SizedBox(height: 16),

                // button
                if (_buttonInfo != null)
                  MyButton(
                    title: _buttonInfo,
                    onLongPress: () async {
                      switch (_buttonInfo) {
                        case MyStrings.startGame:
                        case MyStrings.assignRole:
                          // _pageInfo.value = Info.showRoles;
                          // initialize the list of players names with the names in the text fields
                          // to db
                          await startAssignRole(
                            controllers: _controllers,
                            isar: isar,
                            // pageInfo: _pageInfo,
                            listOfPlayersNames: _listOfPlayersNames,
                          );
                          await isar.then((isar) => isar.putGameStatus(
                                dayNumber: 0,
                                situation: MyStrings.showRoles,
                              ));

                          context.pushReplacementNamed('night',
                              extra: Info.showRoles);
                          break;
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
}
