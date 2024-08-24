import 'dart:developer';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/online/presentation/users/users_controller.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OnlineButton extends HookConsumerWidget {
  /* const */ OnlineButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpController = ref.watch(usersControllerProvider);
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    ref.listen(
      usersControllerProvider,
      (previous, current) {
        if (previous == current) return;

        if (current is AsyncError) {
          AwesomeDialog(
              context: context,
              padding: EdgeInsets.all(16.0),
              dialogType: DialogType.ERROR,
              title: 'خطا',
              body: Text(current.error.toString(),
                  style: MyTextStyles.bodyMedium.copyWith(
                    height: 1.2,
                  )),
              btnOkText: 'فهمیدم',
              // btnOkOnPress: () => context.pop(),
              buttonsTextStyle: MyTextStyles.bodyMedium.copyWith(
                height: 1.2,
              )).show();
        }
      },
    );

    return SizedBox(
      height: height / 12,
      width: width / 2.4,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 32.0,
            horizontal: 32.0,
          ), // Add padding to make the button bigger
        ),
        onPressed: onPressed,
        child: signUpController.maybeWhen(
            // I want my loading widget gets its size exatly from its parent
            loading: () => LoadingAnimationWidget.flickr(
                  size: height / 2,
                  leftDotColor: AppColors.green,
                  rightDotColor: AppColors.primary,
                ),
            orElse: () => Text(title,
                style: MyTextStyles.headlineSmall.copyWith(
                  color: AppColors.green,
                ))),
      ),
    );
  }
}
