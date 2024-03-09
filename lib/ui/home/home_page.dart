import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/load_logics.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  HomePage({required this.isFinished, super.key});
  // HomePage({super.key});

  // final bool isFinished = true;
  final bool isFinished;
  //
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(isFinished);
    return Scaffold(
        backgroundColor: AppColors.backGround,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                title: 'راهنما',
                place: 'home',
                onLongPress: () {
                  context.push('/guide');
                },
              ),
              //
              SizedBox(
                height: 48,
              ),
              //
              MyButton(
                title: 'شروع بازی جدید',
                place: 'home',
                onLongPress: () {
                  context.go('/name_list');
                },
              ),
              //
              if (!isFinished)
                SizedBox(
                  height: 48,
                ),
              //
              if (!isFinished)
                MyButton(
                  title: 'ادامه بازی قبلی',
                  place: 'home',
                  onLongPress: () async {
                    print('objec   t');
                    ref.read(loadingProvider.notifier).toggle();
                    Future.delayed(Duration(seconds: 1));

                    await loadGame(context);

                    ref.read(loadingProvider.notifier).toggle();
                  },
                ),
            ],
          ),
        ));
  }
}
