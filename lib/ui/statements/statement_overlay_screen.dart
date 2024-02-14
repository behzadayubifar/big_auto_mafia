import 'dart:async';

import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/statements/enquiry_results_widget.dart';
import 'package:auto_mafia/ui/statements/statements_overlay_controller.dart';
import 'package:flutter/material.dart';

class StatementScreen {
  StatementScreen._sharedInstance();
  static final StatementScreen _shared = StatementScreen._sharedInstance();
  factory StatementScreen.instance() => _shared;

  StatementScreenController? controller;

  void show({
    int? mafia,
    int? citizen,
    int? independent,
    required BuildContext context,
    required VoidCallback callback,
    required String title,
  }) {
    controller = showOverlay(
      context: context,
      callback: callback,
      mafia: mafia,
      citizen: citizen,
      independent: independent,
      title: MyStrings.nightResults,
    );
  }

  void hide() {
    controller?.close();
    controller = null;
  }

  StatementScreenController? showOverlay({
    int? mafia,
    int? citizen,
    int? independent,
    required String title,
    required BuildContext context,
    required VoidCallback callback,
  }) {
    // final textController = StreamController<String>();
    // textController.add(text);

    final state = Overlay.of(context);
    if (state == null) {
      return null;
    }

    OverlayEntry nostradamousResultOfPredictOverlay = OverlayEntry(
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
                    title,
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
                    independent: independent,
                  ),

                  SizedBox(height: 20),

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

    state.insert(nostradamousResultOfPredictOverlay);

    return StatementScreenController(
      close: () {
        nostradamousResultOfPredictOverlay.remove();
        return true;
      },
      update: (text) {
        return true;
      },
    );
  }

//
}
