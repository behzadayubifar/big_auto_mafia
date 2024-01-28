import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/metrics.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/ui/ui_widget/naming/player_name_frame_widget.dart';
import 'package:auto_mafia/ui/common/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NamingPage extends HookWidget {
  const NamingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return PlayerNameFrameWidget(
                        number: index + 1,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 16);
                    },
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
