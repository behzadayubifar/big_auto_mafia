import 'dart:async';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/ui/common/buttons/button_controller.dart';
import 'package:auto_mafia/ui/common/buttons/my_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// --------------------------------------------------------------------------------------------------------------------------
class MyButton extends HookConsumerWidget {
  MyButton(
      {
      // this.isLoading,
      this.state = 'default',
      this.onDoubleTap,
      super.key,
      this.onLongPress,
      required this.title,
      this.fontSize,
      this.textStyle,
      this.criteria,
      this.player});

  final void Function()? onLongPress;
  final String title;
  final double? fontSize;
  final TextStyle? textStyle;
  final String? state;
  // one condition to enable the button (if it's true, the button will be enabled)
  final bool? criteria;
  final void Function()? onDoubleTap;
  final Player? player;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonState = ref.watch(myButtonControllerProvider(state!));
    final localstate = useState('default');
    final stateController = useMaterialStatesController(
      values: {
        MaterialState.disabled,
      },
    );

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
          // statesController: stateController,
          // style:

          // if(buttonState)
          //   //
          //   MyStrings.disabledButton => ElevatedButton.styleFrom(
          //       enableFeedback: true,
          //       shadowColor: AppColors.lighterGrey,
          //       elevation: 18,
          //       alignment: Alignment.center,
          //       padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          //       backgroundColor: AppColors.primaries[4],
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(16),
          //       ),
          //       minimumSize: const Size(64, 48),
          //     ),

          //
          /* MyStrings.longPressedButton => ElevatedButton.styleFrom(
                shadowColor: AppColors.secondaries[4],
                elevation: 18,
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                backgroundColor: AppColors.secondaries[3],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                minimumSize: const Size(64, 48),
              ),
            //
            MyStrings.nightSpecificButton => ElevatedButton.styleFrom(
                shadowColor: AppColors.lightText,
                elevation: 9,
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                backgroundColor: AppColors.tintsOfBlack[3],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                minimumSize: const Size(48, 48),
              ),
            //
            _ => ElevatedButton.styleFrom(
                shadowColor: AppColors.lightText,
                elevation: 9,
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                minimumSize: const Size(48, 48),
              ),
          }, */
          child: Text(
            title,
            style: textStyle ??
                Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white,
                      fontSize: fontSize,
                    ),
          ),
          onLongPress: onLongPress != null && ((criteria ?? true) == true)
              ? () {
                  if (onLongPress != null) {
                    localstate.value = MyStrings.longPressedButton;
                    Timer(Duration(milliseconds: 400), () => onLongPress!());
                  }

                  // based on role and the passed selected player uses logic's methods
                }
              : null,
          onPressed: () {},
        ),
      ),
    );
  }
}
