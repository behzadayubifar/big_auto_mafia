import 'package:auto_mafia/online/presentation/votes/votes_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../offline/constants/app_colors.dart';
import '../../../offline/constants/my_text_styles.dart';
import '../../data/models/responses/rooms.dart';
import '../common/buttons/online_buttons.dart';

class ConfirmVotesButton extends ConsumerWidget {
  const ConfirmVotesButton({
    super.key,
    required this.height,
    required this.width,
    required this.voteds,
    required this.onPressed,
  });

  final double height;
  final double width;
  final ValueNotifier<List<UsersInRoom>> voteds;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OnlineButton(
      title: "تأیید آراء",
      textStyle: MyTextStyles.headlineSmall.copyWith(
        color: AppColors.lightestGrey,
        height: .1,
      ),
      height: height / 12,
      width: width / 2.4,
      provider: votesControllerProvider,
      backgroundColor: AppColors.greens[2],
      onPressed: onPressed,
    );
  }
}
