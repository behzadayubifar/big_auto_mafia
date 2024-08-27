import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../offline/constants/app_colors.dart';
import '../../../../offline/constants/my_text_styles.dart';
import '../../rooms/controllers/rooms_controller.dart';

class RolesSelectionCheckbox extends HookConsumerWidget {
  const RolesSelectionCheckbox({
    required this.title,
    this.textColor,
    super.key,
  });

  final String title;
  final Color? textColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.sizeOf(context).width;

    final selectedRoles = ref.watch(selectedRolesProvider);
    // final isSelected = useState(selectedRoles.contains(title));

    return InkWell(
      onTap: () {
        // isSelected.value = !isSelected.value;
        if (!selectedRoles.contains(title)) {
          ref.read(selectedRolesProvider.notifier).add(title);
        } else {
          ref
              .read(selectedRolesProvider.notifier)
              .remove(title, removeAll: true);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // checkbox
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            value: ref.watch(selectedRolesProvider).contains(title),
            onChanged: (_) {},
          ),
          // role name
          Text(
            title,
            style: MyTextStyles.bodyMD.copyWith(color: textColor),
          ),
          SizedBox(width: width / 64),
          // number of selection of this role
          if (['شهروند ساده', 'مافیا ساده'].contains(title))
            Text(
              selectedRoles
                  .where((element) => element == title)
                  .length
                  .toString(),
              style: MyTextStyles.bodyMD.copyWith(color: textColor),
            ),
          Spacer(),
          // a button to increase the number of the role
          if (['شهروند ساده', 'مافیا ساده'].contains(title))
            Row(
              children: [
                ColoredButton(
                    width: width,
                    title: title,
                    backgroundColor: AppColors.green.withOpacity(0.32),
                    onPressed: () {
                      ref.read(selectedRolesProvider.notifier).add(title);
                    }),
                SizedBox(width: width / 64),
                ColoredButton(
                    width: width,
                    title: title,
                    backgroundColor: AppColors.secondaries[0],
                    onPressed: () {
                      ref.read(selectedRolesProvider.notifier).remove(title);
                    }),
              ],
            ),
        ],
      ),
    );
  }
}

class ColoredButton extends StatelessWidget {
  const ColoredButton({
    super.key,
    required this.width,
    required this.title,
    required this.backgroundColor,
    required this.onPressed,
  });

  final double width;
  final String title;
  final Color? backgroundColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          maximumSize: Size(width / 10, width / 10),
          minimumSize: Size(width / 10, width / 10),
          alignment: Alignment.center,
          backgroundColor: backgroundColor,
        ),
        onPressed: () {
          onPressed();
        },
        child:
            SizedBox() /* Icon(
        Icons.remove,
        size: width / 24,
      ), */
        );
  }
}
