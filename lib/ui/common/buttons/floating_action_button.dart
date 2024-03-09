import 'package:auto_mafia/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ------------------ model ------------------

class MyFloatingActionButtonModel {
  const MyFloatingActionButtonModel({
    required this.path,
    required this.icon,
    this.iconColor,
    this.tooltip,
    this.backgroundColor,
  });
  final String path;
  final IconData icon;
  final Color? iconColor;
  final String? tooltip;
  final Color? backgroundColor;
}

// ------------------ functions ------------------

FloatingActionButton buildfloatingActionButton({
  required BuildContext context,
  String? name,
}) {
  final model = floatingButtonsStashes[name];
  return FloatingActionButton(
    onPressed: () {
      context.push(model.path);
    },
    child: Icon(
      model!.icon,
      color: model.iconColor ?? AppColors.white,
    ),
    tooltip: model.tooltip,
    elevation: 16.0,
    backgroundColor: model.backgroundColor,
  );
}

// ------------------ stashes ------------------

Map<String, MyFloatingActionButtonModel> floatingButtonsStashes = {
  'guide': MyFloatingActionButtonModel(
    path: '/guide',
    icon: CupertinoIcons.question_diamond_fill,
    backgroundColor: AppColors.darkerGrey,
    tooltip: 'راهنما',
  ),
};
