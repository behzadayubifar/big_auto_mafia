import 'dart:async';

import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/ui/common/buttons/my_buttons.dart';
import 'package:auto_mafia/ui/statements/nostradamous_result.dart';
import 'package:auto_mafia/ui/statements/statements_overlay_controller.dart';
import 'package:flutter/material.dart';

class StatementScreen {
  StatementScreen._sharedInstance();
  static final StatementScreen _shared = StatementScreen._sharedInstance();
  factory StatementScreen.instance() => _shared;

  StatementScreenController? controller;

  void show({
    required BuildContext context,
    required VoidCallback callback,
  }) {
    controller = showOverlay(context: context, callback: callback);
  }

  void hide() {
    controller?.close();
    controller = null;
  }

  StatementScreenController? showOverlay({
    required BuildContext context,
    required VoidCallback callback,
  }) {
    // final textController = StreamController<String>();
    // textController.add(text);

    final state = Overlay.of(context);
    if (state == null) {
      return null;
    }
    // final renderBox = context.findRenderObject() as RenderBox;
    // final size = renderBox.size;
    // final overlay = OverlayEntry(
    //   builder: (context) {
    //     return Material(
    //       color: Colors.black.withAlpha(150),
    //       child: Center(
    //         child: Container(
    //           constraints: BoxConstraints(
    //             maxWidth: size.width * 0.8,
    //             maxHeight: size.height * 0.8,
    //             minWidth: size.width * 0.5,
    //           ),
    //           decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(10.0),
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.all(16.0),
    //             child: SingleChildScrollView(
    //               child: Column(
    //                 mainAxisSize: MainAxisSize.min,
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   const SizedBox(height: 10),
    //                   const CircularProgressIndicator(),
    //                   const SizedBox(height: 20),
    //                   StreamBuilder(
    //                     stream: textController.stream,
    //                     builder: (context, snapshot) {
    //                       if (snapshot.hasData) {
    //                         return Text(
    //                           snapshot.data as String,
    //                           textAlign: TextAlign.center,
    //                           style: Theme.of(context)
    //                               .textTheme
    //                               .bodyMedium
    //                               ?.copyWith(color: Colors.black),
    //                         );
    //                       } else {
    //                         return Container();
    //                       }
    //                     },
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );

    OverlayEntry nostradamousResultOfPredictOverlay = OverlayEntry(
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
                    MyStrings.resultOfPrediction,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  NostradamouResult(),

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
