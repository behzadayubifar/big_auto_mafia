import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/logic/logics.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: AppColors.backGround,
        body: Row(
          children: [
            MyButton(title: 'شروع بازی'),
          ],
        ));
  }
}
