import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/common/title_widget.dart';
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
    return SizedBox(
      height: height / 2.5,
      width: width / 1.5,
      child: ElevatedButton(
        onPressed: () => AwesomeDialog(
            dialogBackgroundColor: AppColors.white,
            padding: EdgeInsets.fromLTRB(
                width / 64, height / 256, width / 64, height / 64),
            context: context,
            dialogType: DialogType.NO_HEADER,
            animType: AnimType.BOTTOMSLIDE,
            body: SizedBox(
              // height: height / 2.5,
              child: Column(
                children: [
                  Text("خریداری!",
                      style: MyTextStyles.displaySmall.copyWith(
                        height: 1,
                        color: AppColors.secondaries[2],
                      )),
                  SizedBox(height: height / 32),
                  Text(
                    "مافیا شب گذشته اقدام به خریداری کرد، بنابراین همۀ افراد مجددا با دانش به این قضیه باید وظیفۀ امشب خود را انجام دهند.",
                    style: MyTextStyles.bodyMD.copyWith(height: 1.5),
                  ),
                  SizedBox(height: height / 64),
                  AnimatedButton(
                    text: "شروع مجدد شب",
                    width: width / 2.5,
                    color: AppColors.green,
                    pressEvent: () async {
                      // pop the dialog
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ))
          ..show(),
        child: Text('click me'),
      ),
    );
  }
}
