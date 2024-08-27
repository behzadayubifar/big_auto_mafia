import 'package:auto_mafia/offline/db/entities/night_results.dart';

extension ResultsTo on Results {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tonight': nightNumber,
      'bornPlayer': bornPlayer,
      'disclosured': disclosured,
      'slaughtered': slaughtered,
      'tonightDeads': tonightDeads,
      'nightCode': nightCode,
      'allDeadPlayers': allDeadPlayers,
      'remainedChancesForNightEnquiry': remainedChancesForNightEnquiry,
    };
  }
}
