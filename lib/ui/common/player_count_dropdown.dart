import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlayersCountDropdown extends StatelessWidget {
  const PlayersCountDropdown({
    super.key,
    required ValueNotifier<int> playerNumber,
  }) : _playerNumber = playerNumber;

  final ValueNotifier<int> _playerNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // dropdown-bg
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(child: SvgPicture.asset(MyAssets.titleBg2, height: 50)),
                SizedBox(height: 16),
              ],
            ),
            SizedBox(width: 10),
          ],
        ),
        // dropdown-widget
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .24,
          child: DropdownButtonHideUnderline(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<int>(
                  value: _playerNumber.value,
                  icon: Visibility(visible: false, child: SizedBox()),
                  elevation: 32,
                  dropdownColor: AppColors.primaries[3],
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                    overflow: TextOverflow.fade,
                    shadows: [
                      Shadow(
                        color: AppColors.darkerGrey,
                        offset: const Offset(0, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  onChanged: (int? newValue) {
                    _playerNumber.value = newValue!;
                  },
                  items: <int>[7, 8, 9, 10, 11]
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
                // text of drop-down-btn
                Text(
                  'نفره',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.white,
                        overflow: TextOverflow.fade,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
