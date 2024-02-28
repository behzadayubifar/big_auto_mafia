import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/load_logics.dart';
import 'package:auto_mafia/logic/logics.dart';
import 'package:auto_mafia/main.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _container = ProviderContainer();

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GlobalLoading(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 122, 122, 158),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  title: 'جدید',
                  textStyle: MyTextStyles.bodyLarge.copyWith(
                    color: AppColors.white,
                  ),
                  onDoubleTap: () {
                    context.go('/name_list');
                  },
                ),
                MyButton(
                  title: 'شروع بازی',
                  textStyle: MyTextStyles.bodyLarge.copyWith(
                    color: AppColors.white,
                  ),
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
          )),
    );
  }
}
