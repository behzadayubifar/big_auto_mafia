import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/online/data/models/responses/errors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OnlineButton extends HookConsumerWidget {
  /* const */ OnlineButton({
    this.height,
    this.width,
    this.padding,
    this.provider,
    this.title,
    this.onPressed,
    this.child,
    this.shadowColor,
    this.elevation,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    super.key,
  }) /*  : assert(child != null ||
            (title != null &&
                width != null &&
                height != null &&
                onPressed != null)) */
  ;

  Widget? child;
  final String? title;
  final void Function()? onPressed;
  final ProviderListenable? provider;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color? shadowColor;
  final double? elevation;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final controller = ref.watch(usersControllerProvider);
    var controller;
    if (provider != null) {
      controller = ref.watch(provider!);
      // errorListener(ref, provider!, context);
    }

    return child != null
        ? child!
        : SizedBox(
            height: height,
            width: width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? AppColors.white,
                shadowColor: shadowColor ?? AppColors.black,
                elevation: elevation ?? 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: padding ??
                    EdgeInsets.symmetric(
                      vertical: 32.0,
                      horizontal: 32.0,
                    ), // Add padding to make the button bigger
              ),
              onPressed: onPressed,
              child: controller is AsyncLoading
                  ? LoadingAnimationWidget.flickr(
                      size: height! / 3.2,
                      leftDotColor: AppColors.green,
                      rightDotColor: AppColors.primary,
                    )
                  : Text(
                      title!,
                      style: textStyle ??
                          MyTextStyles.headlineSmall.copyWith(
                            color: textColor ?? AppColors.green,
                            // height: 1.2,
                          ),
                    ),
            ),
          );
  }
}
