import 'package:auto_mafia/logic/logics_utils.dart';
import 'package:test/test.dart';

void main() {
  test('code generation', () {
    final codeSet = _generateUniqueCode(11);
    expect(codeSet.length, 11);
  });
}
