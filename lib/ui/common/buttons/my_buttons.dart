import 'dart:async';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/ui/common/buttons/button_controller.dart';
import 'package:auto_mafia/ui/common/buttons/my_button_style.dart';
import 'package:auto_mafia/ui/ui_utils/get_criteria_for_night_role_panel.dart';
import 'package:auto_mafia/utils/dev_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// --------------------------------------------------------------------------------------------------------------------------
class MyButton extends HookConsumerWidget {
  MyButton({
    // this.isLoading,
    this.state = 'default',
    this.onDoubleTap,
    super.key,
    this.onLongPress,
    required this.title,
    this.fontSize,
    this.textStyle,
    this.criteria,
    this.player,
    this.selected,
    this.place,
    this.onPressed,
  });

  final void Function()? onLongPress;
  final String title;
  final double? fontSize;
  final TextStyle? textStyle;
  final String? state;
  // one condition to enable the button (if it's true, the button will be enabled)
  final bool? criteria;
  final void Function()? onDoubleTap;
  final Player? player;
  final bool? selected;
  final String? place;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = buttonStyleBasedOnPlace(place);

    final localstate = useState(
      'default',
    );
    // final stateController = useMaterialStatesController(
    //   values: {
    //     MaterialState.disabled,
    //   },
    // );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onDoubleTap: onDoubleTap != null && ((criteria ?? true) == true)
            ? () {
                if (onDoubleTap != null) {
                  localstate.value = MyStrings.doubleTappedButton;
                  Timer(Duration(milliseconds: 400), () => onDoubleTap!());
                }
              }
            : null,
        child: ElevatedButton(
          style: (selected == true) ? style.selected : style.normal,
          child: Text(
            title,
            style: textStyle ??
                Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white,
                      fontSize: fontSize,
                    ),
          ),
          onLongPress: onLongPress,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
