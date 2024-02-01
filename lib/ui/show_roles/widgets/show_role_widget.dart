import 'package:auto_mafia/ui/common/my_buttons.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

class ShowRoleWidget extends StatelessWidget {
  ShowRoleWidget({
    super.key,
    required double width,
    required double height,
    required this.image,
    required this.title,
    this.textStyle,
    this.onLongPress,
    this.isComplete,
  })  : _width = width,
        _height = height;

  final double _width;
  final double _height;
  final String image;
  final String title;
  final TextStyle? textStyle;
  final void Function()? onLongPress;
  bool? isComplete = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: _height / 7.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            width: _width,
            alignment: Alignment.center,
          ),
          if (isComplete ?? true) SizedBox(height: 16),
          if (isComplete ?? true)
            SizedBox(
              height: _height / 10,
              child: MyButton(
                  title: title, textStyle: textStyle, onLongPress: onLongPress),
            ),
        ],
      ),
    );
  }
}