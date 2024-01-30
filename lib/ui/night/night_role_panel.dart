import 'package:auto_mafia/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class NightRolePanel extends HookWidget {
  const NightRolePanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.sizeOf(context).height;
    final _width = MediaQuery.sizeOf(context).width;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // background
          Image.asset(
            MyAssets.nightBg,
            width: _width,
            fit: BoxFit.cover,
          ),
          // moon
          Positioned(
            top: _height / 9,
            left: _width / 4.2,
            child: Image.asset(
              MyAssets.moon,
              width: _width / 1.7,
              fit: BoxFit.cover,
            ),
          ),

          // texts

          // name-of-player
          // a dashed line for separating
          // role-of-player
          // image-of-role
        ],
      ),
    );
  }
}
