import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/statements/nostradamous_result.dart';
import 'package:flutter/material.dart';

Future<bool> showNostradamousResultsOfPredictOverlay(
    BuildContext context, VoidCallback callback) async {
  //
  OverlayEntry nostradamousResultsOfPredictOverlay = OverlayEntry(
    builder: (context) {
      return Material(
        elevation: 4.0,
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
                  'نتیجه پیش بینی',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                NostradamouResult(),
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
  //

  final OverlayState state = Overlay.of(context);
  state.insert(nostradamousResultsOfPredictOverlay);
  // await Future.delayed(Duration(seconds: 3));
  // nostradamousResultsOfPredictOverlay.remove();
  return true;
}

  // Overlay.of(context).insert(nostradamousResultOfPredictOverlay);
