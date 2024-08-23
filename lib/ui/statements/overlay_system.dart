import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/logic/logics_utils.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/statements/enquiry_results_widget.dart';
import 'package:flutter/material.dart';

Future<String?> showOverlay(
  BuildContext context,
  VoidCallback callback,
  String place,
  List<String>? playersList,
) async {
  //
  final numberOfEachTyoeOfDeadPlayers =
      await determineMafiaAndCitizenCountFromList(
    playerNames: playersList!,
  );
  final mafia = numberOfEachTyoeOfDeadPlayers.mafiaPlayersCount;
  final citizen = numberOfEachTyoeOfDeadPlayers.citizen;
  final independent = numberOfEachTyoeOfDeadPlayers.independent;
  //

  OverlayEntry enquiryOverlay = OverlayEntry(
    builder: (context) {
      return Material(
        color: Colors.transparent,
        elevation: 8.0,
        shadowColor: Colors.black.withOpacity(0.5),
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset('assets/overlays/nostradamousResultOfPredict.png'),
                SizedBox(height: 20),
                Text(
                  place == MyStrings.nostradamousResultsOfPredict
                      ? MyStrings.resultOfPrediction
                      : MyStrings.resultOfEnquiry,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                EnquiryResultsWidget(
                  mafia: mafia,
                  citizen: citizen,
                  independent: place == MyStrings.nostradamousResultsOfPredict
                      ? null
                      : independent,
                ),
                MyButton(
                  title: MyStrings.understand,
                  onPressed: callback,
                )
              ],
            ),
          ),
        ),
      );
    },
  );

  // an overlay for displaying roles of citizens and a plave to choose only one of them and
  // OverlayEntry slaughterOverlay = OverlayEntry(
  //   builder: (context) {},
  // );

  final OverlayState state = Overlay.of(context);
  // await Future.delayed(Duration(seconds: 3));
  // nostradamousResultsOfPredictOverlay.remove();
  state.insert(enquiryOverlay);
  return '';
}
