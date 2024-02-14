import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/night/night_page.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class XWidget extends StatelessWidget {
  const XWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    // return NightPage(info: Info.showRoles, key: UniqueKey());
    return ElevatedButton(
      onPressed: () => AwesomeDialog(
        context: context,
        dialogBackgroundColor: AppColors.lighterGrey,
        dialogType: DialogType.INFO,
        animType: AnimType.LEFTSLIDE,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            Text('title', style: MyTextStyles.bodyLarge),
            SizedBox(height: 40),
            Text(
              'a ',
              style: MyTextStyles.bodySmall.copyWith(height: 1.5),
              // overflow: TextOverflow.ellipsis
            ),
          ],
        ),
        // title: title,
        // desc: desc,
        btnOk: MyButton(
          title: MyStrings.nextNight,
          onLongPress: () async {},
        ),
      )..show(),
      child: Text('click me'),
    );
  }
}
