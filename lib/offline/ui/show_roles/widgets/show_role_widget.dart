import 'package:auto_mafia/offline/ui/common/buttons/my_buttons.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class ShowRoleWidget extends StatelessWidget {
  ShowRoleWidget({
    super.key,
    required double width,
    required double height,
    required this.image,
    this.title,
    this.textStyle,
    this.onLongPress,
    this.isComplete,
    this.button,
  })  : _width = width,
        _height = height;

  final double _width;
  final double _height;
  final String image;
  final String? title;
  final TextStyle? textStyle;
  final void Function()? onLongPress;
  final bool? isComplete;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: _height / 7.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InteractiveViewer(
            maxScale: 4.0,
            minScale: 0.1,
            boundaryMargin: EdgeInsets.all(20),
            child: SvgPicture.asset(
              image,
              width: _width,
              alignment: Alignment.center,
            ),
          ),
          if (isComplete ?? true) SizedBox(height: 16),
          if (isComplete ?? true)
            SizedBox(
              height: _height / 10,
              child: button ??
                  MyButton(
                    title: title ?? '',
                    textStyle: textStyle,
                    onLongPress: onLongPress,
                  ),
            ),
        ],
      ),
    );
  }
}
