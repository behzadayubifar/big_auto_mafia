import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/ui/night/night_page.dart';
import 'package:flutter/material.dart';

class XWidget extends StatelessWidget {
  const XWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NightPage(info: Info.showRoles, key: UniqueKey());
  }
}
