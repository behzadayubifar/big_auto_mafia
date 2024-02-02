import 'dart:math';
import 'dart:developer' as dev;

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:auto_mafia/ui/ui_utils/calculate_text_layout_size.dart';
import 'package:auto_mafia/ui/ui_widget/names_list_show/naming_page.dart';
import 'package:auto_mafia/ui/ui_widget/names_list_show/number_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class PlayerNamingFrameWidget extends HookConsumerWidget {
  PlayerNamingFrameWidget({
    bool withNumber = false,
    required int number,
    required TextEditingController controller,
    super.key,
  })  : _withNumber = withNumber,
        _number = number,
        _controller = controller;

  final int _number;
  // use this to change the suffix icon rotation
  final bool _withNumber;
  //
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _focusNode = useFocusNode(
      canRequestFocus: true,
      descendantsAreFocusable: true,
    );

    final _textStyle = Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: Colors.white,
          overflow: TextOverflow.fade,
        );

    final ValueNotifier<Size> _textSize = useState(Size.zero);
    final _playerName = useState('');

    useEffect(
      () {
        _controller.addListener(() {
          _playerName.value = _controller.text;
          Size newSize = calculateTextSize(
            text: _playerName.value == ''
                ? _controller.value.text
                : _playerName.value,
            style: _textStyle,
            context: context,
          );
          _textSize.value = newSize;
        });
        return null;
      },
      [_controller.text],
    );

    final ValueNotifier<bool> _isNotSelected = useState(true);
    useEffect(() {
      _focusNode.addListener(() {
        _isNotSelected.value = !_focusNode.hasFocus;
      });
      return null;
    }, [_focusNode.hasPrimaryFocus]);

    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // a frame
                AnimatedOpacity(
                  opacity: _isNotSelected.value ? .2 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: RotatedBox(
                    quarterTurns: _number % 2 == 0 ? 2 : 0,
                    child: SvgPicture.asset(
                      MyAssets.playerNameFrame,
                      width: max(_textSize.value.width + 30, 200),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                //spacer
                SizedBox(height: 4),
                // a text field
                SizedBox(
                  width: max(_textSize.value.width + 20, 380),
                  child: TextField(
                    onSubmitted: (String playerName) {
                      _focusNode.unfocus();
                    },
                    onTapOutside: (_) {
                      _focusNode.unfocus();
                    },
                    autofocus: false,
                    focusNode: _focusNode,
                    // onTapOutside: ,
                    cursorColor: AppColors.lighterGrey,
                    keyboardAppearance: Brightness.dark,
                    showCursor: false,
                    textAlign: TextAlign.center,
                    maxLength: 16,
                    maxLines: 1,
                    controller: _controller,
                    decoration: InputDecoration(
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 64,
                        maxWidth: 64,
                      ),
                      border: InputBorder.none,
                      prefixIcon: NumberHolder(
                          number: _number, isNotFocused: _isNotSelected.value),
                      contentPadding: EdgeInsets.only(top: 36, left: 64),
                      counterText: '',
                      hintText: _playerName.value,
                      hintStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                              ),
                    ),
                    style: _textStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
