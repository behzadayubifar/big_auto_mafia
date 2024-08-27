import 'package:auto_mafia/offline/constants/my_text_styles.dart';
import 'package:auto_mafia/offline/models/role_datasets.dart';
import 'package:auto_mafia/online/presentation/rooms/controllers/rooms_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../offline/constants/app_colors.dart';

class Guied extends ConsumerWidget {
  const Guied({
    super.key,
    required this.width,
    required this.side,
    this.iconColor,
  });

  final double width;
  final String side;
  final Color? iconColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRoles = ref.watch(selectedRolesProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // side
        Row(
          children: [
            // a green dash
            Icon(
              FontAwesomeIcons.dashcube,
              color: iconColor,
              size: width / 32,
            ),
            SizedBox(width: width / 32),
            // side
            Text(
              side,
              style: MyTextStyles.bodyLarge,
            ),
          ],
        ),
        Spacer(),
        // number of selection of this side
        Text(
          selectedRoles
              .where(
                (String role) {
                  final roleType = allRoles2[role]!['side'];
                  return roleType == side;
                },
              )
              .length
              .toString(),
          style: MyTextStyles.bodyLarge.copyWith(
            // color: iconColor,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2.4
              ..color = iconColor!,
          ),
        ),
      ],
    );
  }
}
