import 'package:flutter/foundation.dart' show immutable;

typedef CloseStatementScreen = bool Function();
typedef UpdateStatementScreen = bool Function(String text);

@immutable
class StatementScreenController {
  final CloseStatementScreen close;
  final UpdateStatementScreen update;

  const StatementScreenController({
    required this.close,
    required this.update,
  });
}
