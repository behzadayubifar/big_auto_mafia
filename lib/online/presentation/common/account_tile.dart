import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../offline/constants/app_colors.dart';
import '../../../offline/constants/my_text_styles.dart';
import '../../../offline/db/entities/user.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({
    required this.user,
    required this.height,
    required this.width,
    this.onPressed,
    this.repeatedName,
    super.key,
  });

  final User user;
  final double height;
  final double width;
  final void Function()? onPressed;
  final bool? repeatedName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          // I want to remove the shape of the button
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
              shape: LinearBorder.end()),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: height / 32,
              horizontal: width / 128,
            ),
            child: Row(
              children: [
                // icon
                Icon(
                  FontAwesomeIcons.userNinja,
                  size: 48,
                  color: AppColors.darkerGrey,
                ),
                SizedBox(width: width / 32),
                // name (if name is repeated we show the name and the username)
                SizedBox(
                  width: width / 2.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.fullName,
                        overflow: TextOverflow.ellipsis,
                        style: MyTextStyles.bodyLarge.copyWith(
                          color: AppColors.grey,
                          height: 1.5,
                        ),
                      ),
                      if (repeatedName!)
                        Text(
                          user.username!,
                          overflow: TextOverflow.ellipsis,
                          style: MyTextStyles.bodyMD.copyWith(
                            color: AppColors.grey,
                            height: 1.5,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Divider
        Divider(
            color: AppColors.primaries[0],
            thickness: 1,
            height: 0,
            indent: width / 16,
            endIndent: width / 16),
      ],
    );
  }
}