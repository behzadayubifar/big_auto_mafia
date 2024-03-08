import 'package:auto_mafia/constants/app_colors.dart';
import 'package:flutter/material.dart';

// --------------------------------------------------------------------------------------------------------------------------

@immutable
class MyButtonStyle {
  const MyButtonStyle._();

  static final defaultStyle = (
    normal: ElevatedButton.styleFrom(
      shadowColor: AppColors.lightText,
      elevation: 9,
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      backgroundColor: AppColors.tintsOfBlack[3],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      minimumSize: const Size(48, 48),
    ),
    selected: ElevatedButton.styleFrom(
      shadowColor: AppColors.lightText,
      elevation: 9,
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      minimumSize: const Size(48, 48),
    ),
  );
  // --------------------------------------------------------------------------------------------------------------------------
  static final ({ButtonStyle normal, ButtonStyle selected}) homeButton = (
    normal: ElevatedButton.styleFrom(
      shadowColor: AppColors.lightText,
      elevation: 9,
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      backgroundColor: AppColors.primaries[2],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      minimumSize: const Size(48, 48),
    ),
    selected: ElevatedButton.styleFrom(
      shadowColor: AppColors.lightText,
      elevation: 9,
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      backgroundColor: AppColors.primaries[0],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      minimumSize: const Size(48, 48),
    ),
  );
}

({ButtonStyle? normal, ButtonStyle? selected}) buttonStyleBasedOnPlace(
  String? place,
) {
  switch (place) {
    case 'home':
      return MyButtonStyle.homeButton;
    default:
      return MyButtonStyle.defaultStyle;
  }
}

// --------------------------------------------------------------------------------------------------------------------------

@immutable
class TextButtonDefaultOverlay extends MaterialStateProperty<Color?> {
  TextButtonDefaultOverlay(this.primary);
  final Color primary;
  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered))
      return primary.withOpacity(0.04);
    if (states.contains(MaterialState.focused) ||
        states.contains(MaterialState.pressed))
      return primary.withOpacity(0.12);
    return null;
  }

  @override
  String toString() {
    return '{hovered: ${primary.withOpacity(0.04)}, focused,pressed: ${primary.withOpacity(0.12)}, otherwise: null}';
  }
}
