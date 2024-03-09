import 'dart:ui';

import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/models/guide_datasets.dart';
import 'package:flutter/painting.dart';

Gradient? gradientBasedOnTag(GuideTags? tag) {
  switch (tag) {
    case GuideTags.RolesBasedOnPlayersNumber:
      return LinearGradient(
        colors: [
          AppColors.darkerGrey,
          AppColors.darkestGrey,
        ],
        end: Alignment.topLeft,
        begin: Alignment.bottomRight,
        transform: GradientRotation(3.14 / 3.2),
      );
    case GuideTags.Scenario:
      return LinearGradient(
        colors: [
          AppColors.darkerGrey,
          AppColors.darkestGrey,
        ],
        end: Alignment.topLeft,
        begin: Alignment.bottomRight,
        transform: GradientRotation(3.14 / 3.2),
      );
    case GuideTags.App:
      return LinearGradient(
        colors: [
          AppColors.tintsOfBlack[1],
          AppColors.tintsOfBlack[3],
        ],
        end: Alignment.topLeft,
        begin: Alignment.bottomRight,
        transform: GradientRotation(3.14 / 3.2),
      );
    case GuideTags.RolesDescription:
      return LinearGradient(
        colors: [
          AppColors.secondaries[3],
          AppColors.secondaries[1],
        ],
        end: Alignment.topLeft,
        begin: Alignment.bottomRight,
        transform: GradientRotation(3.14 / 3.2),
      );
    case GuideTags.LastMoves:
      return LinearGradient(
        colors: [
          AppColors.primaries[4],
          AppColors.primaries[2],
        ],
        end: Alignment.topLeft,
        begin: Alignment.bottomRight,
        transform: GradientRotation(3.14 / 3.2),
      );
    case _:
      null;
  }
}
