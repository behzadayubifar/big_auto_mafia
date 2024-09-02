import 'package:flutter/material.dart';

import '../../../../offline/constants/app_colors.dart';

class MyListView<T> extends StatelessWidget {
  const MyListView(
      {required this.height,
      required this.width,
      required this.children,
      required this.scrollController,
      required this.itemBuilder,
      super.key});

  final double height;
  final double width;
  final List<T?> children;
  final ScrollController scrollController;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 16),
      child: Scrollbar(
        controller: scrollController,
        scrollbarOrientation: ScrollbarOrientation.right,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width / 48,
            vertical: height / 32,
          ),
          height: height,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.darkerGrey,
                blurRadius: 16,
                spreadRadius: 8,
              ),
            ],
            gradient: LinearGradient(
              colors: [
                AppColors.darkerGrey,
                AppColors.grey,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView.separated(
            controller: scrollController,
            itemCount: children.length,
            separatorBuilder: (context, index) => index != children.length
                ? SizedBox(
                    height: height / 16,
                  )
                : SizedBox(),
            itemBuilder: itemBuilder,
          ),
        ),
      ),
    );
  }
}
