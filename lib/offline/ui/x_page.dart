import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/offline/db/isar_service.dart';
import 'package:auto_mafia/offline/logic/load_logics.dart';
import 'package:auto_mafia/offline/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/offline/ui/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _container = ProviderContainer();

class XWidget extends ConsumerWidget {
  const XWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: AppColors.backGround,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                title: 'شروع بازی جدید',
                // textStyle: MyTextStyles.bodyLarge.copyWith(
                //   color: AppColors.white,
                // ),
                // place: 'home',

                onDoubleTap: () {
                  // context.go('/name_list');
                  context.go('/x-page');
                },
              ),
              //
              MyButton(
                title: 'ادامه بازی قبلی',
                textStyle: MyTextStyles.bodyLarge.copyWith(
                  color: AppColors.white,
                ),
                place: 'home',
                onDoubleTap: () async {
                  ref.read(loadingProvider.notifier).toggle();
                  Future.delayed(Duration(seconds: 1));
                  final isar =
                      await _container.read(isarServiceProvider.future);
                  final isFinished = await isar
                      .retrieveGameStatusN(n: await isar.getDayNumber())
                      .then((status) => status?.isFinished);
                  if (isFinished == true) {
                    context.go('/name_list');
                  } else {
                    await loadGame(context);
                  }
                  ref.read(loadingProvider.notifier).toggle();
                },
              ),
            ],
          ),
        ));
  }
}
