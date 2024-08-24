import 'package:auto_mafia/db/isar_service.dart';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/db/shared_prefs/shared_prefs.dart';
import 'package:auto_mafia/ui/common/fields/text_form_fields.dart';
import 'package:auto_mafia/ui/common/loading.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineOfflinePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    final lastIP = SharedPrefs.getString('ip');
    final ipController = useTextEditingController(text: lastIP);

    return GlobalLoading(
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    title: "ENTER IP",
                    body: SingleChildScrollView(
                        child: Column(children: [
                      MyTextField(
                          textDirection: TextDirection.ltr,
                          labelText: 'IP',
                          controller: ipController,
                          validator: (content) {
                            if (content == null || content.isEmpty) {
                              return 'لطفا IP را وارد کنید';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: size.height / 32,
                      ),
                    ])),
                    dialogType: DialogType.INFO_REVERSED,
                    btnOkText: 'تایید',
                    buttonsTextStyle: MyTextStyles.bodyLarge.copyWith(
                      height: 1.3,
                    ),
                    btnOkOnPress: () async {
                      SharedPrefs.setString('ip', ipController.text);
                      context.pushNamed('online');
                    },
                  ).show();
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
