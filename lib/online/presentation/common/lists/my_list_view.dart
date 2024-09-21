import 'package:flutter/material.dart';

import '../../../../offline/constants/app_colors.dart';
import '../../../../offline/constants/my_text_styles.dart';

class MyListView<T> extends StatelessWidget {
  const MyListView(
      {required this.height,
      required this.width,
      required this.children,
      required this.scrollController,
      required this.itemBuilder,
      this.gradient,
      this.title,
      this.boxShadow,
      this.padding,
      this.color,
      super.key});

  final double height;
  final double width;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  final String? title;
  final List<T?> children;
  final ScrollController scrollController;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 16),
          child: Scrollbar(
            controller: scrollController,
            scrollbarOrientation: ScrollbarOrientation.right,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: width * 1.4,
              ),
              clipBehavior: Clip.hardEdge,
              padding: padding ??
                  EdgeInsets.symmetric(
                    horizontal: width / 32,
                    vertical: height / 32,
                  ),
              height: height,
              decoration: BoxDecoration(
                boxShadow: boxShadow,
                color: color ?? Colors.transparent,
                gradient: gradient,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                clipBehavior: Clip.hardEdge,
                controller: scrollController,
                itemCount: children.length,
                separatorBuilder: (context, index) =>
                    index != children.length - 1
                        ? SizedBox(
                            height: height / 16,
                          )
                        : SizedBox(),
                itemBuilder: itemBuilder,
              ),
            ),
          ),
        ),

        // header
        if (title != null)
          Container(
            height: height / 6,
            width: width * 1.4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.black20,
                  AppColors.black50,
                ],
              ),
            ),
            child: Text(
              title!,
              style: MyTextStyles.headlineSmall.copyWith(
                color: AppColors.lightestGrey,
                height: 2.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
