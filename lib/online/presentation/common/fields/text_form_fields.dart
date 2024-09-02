import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../offline/constants/app_colors.dart';
import '../../../../offline/constants/my_text_styles.dart';

class MyTextField extends HookWidget {
  MyTextField({
    this.textDirection,
    this.keyboardType,
    this.nextController,
    this.nextFocusNode,
    this.textInputAction,
    this.controller,
    this.maxLength,
    this.obscureText = false,
    this.validator,
    this.labelText,
    this.fillColor,
    this.labelColor,
    this.onSubmitted,
    super.key,
  });

  final TextEditingController? controller;
  final bool obscureText;
  final String? labelText;
  final int? maxLength;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final FocusNode? nextFocusNode;
  final TextEditingController? nextController;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;
  final Color? fillColor;
  final Color? labelColor;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final _focusNode = useFocusNode();
    final isFocused = useState(false);

    useEffect(() {
      void listener() {
        isFocused.value = _focusNode.hasFocus;
      }

      _focusNode.addListener(listener);
      return () => _focusNode.removeListener(listener);
    }, [_focusNode]);

    return TextFormField(
      textDirection: textDirection ?? TextDirection.rtl,
      controller: controller,
      validator: (value) => (validator != null) ? validator!(value) : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enableInteractiveSelection: true,
      onAppPrivateCommand: (action, data) {
        if (action == 'onCut') {
          final text = controller!.text;
          final start = controller!.selection.start;
          final end = controller!.selection.end;
          final newText = text.replaceRange(start, end, '');
          controller!.text = newText;
          controller!.selection = TextSelection.collapsed(offset: start);
        } else if (action == 'onCopy') {
          final text = controller!.text;
          final start = controller!.selection.start;
          final end = controller!.selection.end;
          final copiedText = text.substring(start, end);
          Clipboard.setData(ClipboardData(text: copiedText));
        } else if (action == 'onPaste') {
          final text = controller!.text;
          final start = controller!.selection.start;
          final end = controller!.selection.end;
          final pastedText = data.toString();
          final newText = text.replaceRange(start, end, pastedText);
          controller!.text = newText;
          controller!.selection =
              TextSelection.collapsed(offset: start + pastedText.length);
        }
      },
      onTapOutside: (_) => _focusNode.unfocus(),
      focusNode: _focusNode,
      decoration: InputDecoration(
        errorStyle: MyTextStyles.bodySmall
            .copyWith(height: 1.2, color: AppColors.secondary),
        fillColor: fillColor ?? AppColors.white60,
        // labelText: labelText,
        label: Container(
          decoration: BoxDecoration(
            color: fillColor ?? AppColors.white60,
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: EdgeInsets.all(8.0),
          child: Text(
            labelText!,
            style: MyTextStyles.bodyLarge.copyWith(
              color: labelColor ?? AppColors.grey,
            ),
          ),
        ),
        // labelStyle: MyTextStyles.bodyLarge.copyWith(
        //     color: labelColor ??
        //         () {
        //           labelColor =
        //               isFocused.value ? AppColors.primaries[3] : AppColors.grey;
        //           return AppColors.grey;
        //         }()),
        counterStyle: MyTextStyles.bodySmall.copyWith(
          color: AppColors.grey,
          height: 1.2,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaries[4]),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaries[4]),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      obscureText: obscureText,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction ?? TextInputAction.next,
      onFieldSubmitted: (value) {
        if (nextFocusNode != null) {
          _focusNode.unfocus();
          FocusScope.of(context).requestFocus(nextFocusNode);
        }

        if (nextController != null) {
          nextController!.selection = TextSelection(
            baseOffset: 0,
            extentOffset: nextController!.text.length,
          );
        }

        // Remove the last space in the field
        if (value.endsWith(' ')) {
          final trimmedValue = value.trimRight();
          controller!.text = trimmedValue;
        }

        // Remove the last space or any other whitespace character in the field
        final trimmedValue = value.replaceAll(RegExp(r'\s+$'), '');
        controller!.text = trimmedValue;

        if (onSubmitted != null) {
          onSubmitted!(value);
        }
      },
    );
  }
}
