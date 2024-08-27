import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Guied extends StatelessWidget {
  const Guied({
    super.key,
    required this.width,
    required this.title,
    this.iconColor,
  });

  final double width;
  final String title;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // a green dash
        Icon(
          FontAwesomeIcons.dashcube,
          color: iconColor,
          size: width / 32,
        ),
        // side
        SizedBox(width: width / 64),
        Text(title),
      ],
    );
  }
}
