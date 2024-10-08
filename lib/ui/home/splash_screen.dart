import 'package:go_router/go_router.dart';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends StatefulHookConsumerWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(milliseconds: 4750),
      () async {
        // final isar = await ref.read(isarServiceProvider.future);
        // final int n = await isar.getDayNumber();
        // final isLastGameFinished = await isar.retrieveGameStatusN(n: n).then(
        //       (status) => status?.isFinished,
        //     );
        // context.go('/home/$isLastGameFinished');
        context.goNamed('off-or-online');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Image.asset(
          'assets/gifs/splash_auto_mafia.gif',
          // animate: true,
        ),
        /* Lottie.asset(
          Lotties.splash,
          // Lotties.chicken,
          // animate: true,
        ), */
      ),
    );
  }
}
