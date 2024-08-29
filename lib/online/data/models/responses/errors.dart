import 'dart:developer';

import 'package:auto_mafia/online/presentation/users/controller/accounts_controller.dart';
import 'package:auto_mafia/online/presentation/users/controller/users_controller.dart';
import 'package:auto_mafia/routes/routes.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../offline/constants/my_text_styles.dart';

class ErrorResp {
  String msg;
  dynamic err;
  Map<String, dynamic>? details;

  ErrorResp({required this.msg, required this.err, required this.details});

  factory ErrorResp.fromJson(Map<String, dynamic> json) {
    return ErrorResp(
      msg: json['msg'],
      err: json['err'],
      details: json['details'],
    );
  }
}

class ErrorsObserver extends ProviderObserver {
  // @override
  // void didAddProvider(
  //   ProviderBase<Object?> provider,
  //   Object? value,
  //   ProviderContainer container,
  // ) {
  //   print('Provider $provider was initialized with $value');
  // }

  // @override
  // void didDisposeProvider(
  //   ProviderBase<Object?> provider,
  //   ProviderContainer container,
  // ) {
  //   print('Provider $provider was disposed');
  // }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('Provider $provider updated from $previousValue to $newValue');
    if (newValue is AsyncData) {
      newValue.whenOrNull(
        data: (data) {
          if (data is ErrorResp) {
            print("crrent: $newValue");
            AwesomeDialog(
                context: NavigationService.navigatorKey.currentContext!,
                padding: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                dialogType: DialogType.ERROR,
                title: 'خطا',
                body: Text(data.msg,
                    style: MyTextStyles.bodyMedium.copyWith(
                      height: 1.6,
                    )),
                buttonsTextStyle: MyTextStyles.bodyMedium.copyWith(
                  height: 1.2,
                )).show();
          }
        },
      );
    }
  }

  // @override
  // void providerDidFail(
  //   ProviderBase<Object?> provider,
  //   Object error,
  //   StackTrace stackTrace,
  //   ProviderContainer container,
  // ) {
  //   print('Provider $provider threw $error at $stackTrace');
  // }
}

// final allProviders = [usersControllerProvider, accountsControllerProvider];

// @Riverpod(keepAlive: true)
// void appErrors(
//   AppErrorsRef ref,
//   BuildContext context,
// ) {
//   print('here in p');
//   allProviders.map(
//     (provider) => ref.listen(
//       accountsControllerProvider,
//       (previous, current) => showError(previous, current, context),
//     ),
//   );
// }

showError(previous, current, context) {
  if (previous == current || current is AsyncLoading) return;

  if (current.value is ErrorResp) {
    print("crrent: $current");
    AwesomeDialog(
        context: context,
        padding: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
        dialogType: DialogType.ERROR,
        title: 'خطا',
        body: Text((current.value as ErrorResp).msg,
            style: MyTextStyles.bodyMedium.copyWith(
              height: 1.6,
            )),
        buttonsTextStyle: MyTextStyles.bodyMedium.copyWith(
          height: 1.2,
        )).show();
  }
}

void errorListener2(
  WidgetRef ref,
  // ProviderListenable provider,
  BuildContext context,
) =>
    ref.listen(
      accountsControllerProvider,
      (previous, current) {
        if (previous == current || current is AsyncLoading) return;

        if (current.value!.isLeft()) {
          print("crrent: $current");
          AwesomeDialog(
              context: context,
              padding: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
              dialogType: DialogType.ERROR,
              title: 'خطا',
              body: Text(
                  (current.value!.getLeft())
                      .map((errOption) => errOption.msg)
                      .toString(),
                  style: MyTextStyles.bodyMedium.copyWith(
                    height: 1.6,
                  )),
              buttonsTextStyle: MyTextStyles.bodyMedium.copyWith(
                height: 1.2,
              )).show();
        }
      },
    );
