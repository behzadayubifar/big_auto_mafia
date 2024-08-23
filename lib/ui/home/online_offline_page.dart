import 'package:auto_mafia/db/isar_service.dart';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineOfflinePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GlobalLoading(
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  context.pushNamed('online');
                },
                icon: Icon(
                  Icons.network_check,
                  size: 96,
                ),
                label: Text(
                  'آنلاین',
                  style: MyTextStyles.displaySmall,
                ),
              ),
              SizedBox(height: 72),
              ElevatedButton.icon(
                onPressed: () async {
                  ref.read(loadingProvider.notifier).toggle();
                  final isar = await ref.read(isarServiceProvider.future);
                  final int n = await isar.getDayNumber();
                  final isLastGameFinished =
                      await isar.retrieveGameStatusN(n: n).then(
                            (status) => status?.isFinished,
                          );

                  context.push('/home/$isLastGameFinished');
                  ref.read(loadingProvider.notifier).toggle();
                },
                icon: Icon(
                  Icons.signal_wifi_off,
                  size: 96,
                ),
                label: Text(
                  'آفلاین',
                  style: MyTextStyles.displaySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
