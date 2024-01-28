import 'package:auto_mafia/db/entities/game_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('==2', () {
    var status1 = GameStatus();

    var status2 = GameStatus();

    expect(status1 == status2, true);
  });
}
