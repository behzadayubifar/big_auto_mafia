import 'dart:developer';

import 'package:isar/isar.dart';

part 'night_results.g.dart';

@Collection()
class Results {
  Id? id;
  int? nightNumber;
  String? bornPlayer;
  String? disclosured;
  String? slaughtered;
  List<String>? tonightDeads;
  int? nightCode;
  List<String>? allDeadPlayers;
  int? remainedChancesForNightEnquiry;

  Results copy({
    int? nightNumber,
    String? bornPlayer,
    String? disclosured,
    String? slaughtered,
    List<String>? tonightDeads,
    int? nightCode,
    List<String>? allDeadPlayers,
    int? remainedChancesForNightEnquiry,
  }) {
    final newResults = Results()
      ..id = id
      ..nightNumber = nightNumber ?? this.nightNumber
      ..bornPlayer = bornPlayer ?? this.bornPlayer
      ..disclosured = disclosured ?? this.disclosured
      ..slaughtered = slaughtered ?? this.slaughtered
      ..tonightDeads = tonightDeads ?? this.tonightDeads
      ..nightCode = nightCode ?? this.nightCode
      ..allDeadPlayers = allDeadPlayers ?? this.allDeadPlayers
      ..remainedChancesForNightEnquiry =
          remainedChancesForNightEnquiry ?? this.remainedChancesForNightEnquiry;

    //
    log('newResults: ${newResults.toString()} with id: ${newResults.id}',
        name: 'results');
    //
    return newResults;
  }
}
