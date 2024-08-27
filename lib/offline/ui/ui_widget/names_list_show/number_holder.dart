import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NumberHolder extends StatelessWidget {
  NumberHolder({
    Key? key,
    required this.number,
    required this.isNotFocused,
  }) : super(key: key);

  final int number;
  final bool isNotFocused;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // number-holder
        AnimatedRotation(
          turns: isNotFocused ? 0 : .25,
          duration: const Duration(milliseconds: 500),
          child: SvgPicture.asset(MyAssets.numberHolder,
              height: 64,
              alignment: Alignment.center,
              colorFilter: ColorFilter.mode(
                isNotFocused
                    ? AppColors.darkText
                    : const Color.fromARGB(255, 227, 92, 92),
                BlendMode.srcIn,
              )),
        ),
        // number
        AnimatedPositioned(
          top: isNotFocused ? 4 : 16,
          left: isNotFocused ? 14 : 24,
          right: 0,
          bottom: 20,
          duration: const Duration(milliseconds: 400),
          child: Center(
            child: Text(
              number.toString(),
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppColors.lightText,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
