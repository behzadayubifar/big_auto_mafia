import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/models/online/errors.dart';
import 'package:auto_mafia/online/presentation/users/users_controller.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OnlineButton extends HookConsumerWidget {
  /* const */ OnlineButton({
    required this.height,
    required this.width,
    required this.provider,
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String title;
  final void Function()? onPressed;
  final ProviderListenable provider;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(usersControllerProvider);

    ref.listen(
      usersControllerProvider,
      (previous, current) {
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
              // btnOkText: 'فهمیدم',
              // btnOkOnPress: () => context.pop(),
              buttonsTextStyle: MyTextStyles.bodyMedium.copyWith(
                height: 1.2,
              )).show();
        }
      },
    );

    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: AppColors.black,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 32.0,
            horizontal: 32.0,
          ), // Add padding to make the button bigger
        ),
        onPressed: onPressed,
        child: controller.maybeWhen(
            // I want my loading widget gets its size exatly from its parent
            loading: () => LoadingAnimationWidget.flickr(
                  size: height / 3.2,
                  leftDotColor: AppColors.green,
                  rightDotColor: AppColors.primary,
                ),
            orElse: () => Text(title,
                style: MyTextStyles.headlineSmall.copyWith(
                  color: AppColors.green,
                  // height: 1.2,
                ))),
      ),
    );
  }
}
