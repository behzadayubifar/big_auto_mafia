import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'button_controller.g.dart';

@riverpod
class MyButtonController extends _$MyButtonController {
  @override
  String build(String status) {
    return status;
  }

  void change(String newState) => state = newState;
}
