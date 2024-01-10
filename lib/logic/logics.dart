import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logics {
  Logics._();

  final container = ProviderContainer();
// night logics

  // leon logic
  _leon(String chosenPlayerName) async {
    final isar = await container.read(isarServiceProvider.future);
    final chosenPlayer = await isar.getPlayerByName(chosenPlayerName);
    final leon = await isar.getPlayerByRole(RoleName.leon);
    final bool isMafia = chosenPlayer!.type == RoleType.mafia;
    //
    if (isMafia) {
      isar.updatePlayer(chosenPlayer.copy(
        heart: chosenPlayer.heart! - 1,
      ));
      isar.updatePlayer(
        leon!.copy(
          shotCount: leon.shotCount + 1,
        ),
      );

      // it's not mafia
    } else {
      isar.updatePlayer(leon!.copy(
        shotCount: leon.shotCount + 1,
        heart: 0,
      ));
    }
  }

  // watson logic
  _watson(String chosenPlayerName) async {
    final isar = await container.read(isarServiceProvider.future);
    final chosenPlayer = await isar.getPlayerByName(chosenPlayerName);
    final watson = await isar.getPlayerByRole(RoleName.watson);
    //
    isar.updatePlayer(chosenPlayer!.copy(
      isSaved: true,
    ));
    if (chosenPlayer == watson) {
      isar.updatePlayer(watson!.copy(
        isSavedOnce: true,
      ));
    }
  }

  // kane logic
  _kane(String chosenPlayerName) async {
    final isar = await container.read(isarServiceProvider.future);
    final chosenPlayer = await isar.getPlayerByName(chosenPlayerName);
    final kane = await isar.getPlayerByRole(RoleName.kane);
    //
    isar.updatePlayer(kane!.copy(
      hasGussed: true,
    ));
    //
    if (chosenPlayer!.type == RoleType.mafia) {
      isar.updatePlayer(chosenPlayer.copy(
        disclosured: true,
        isReversible: false,
      ));
    }
  }

  // konstantin logic
  _konstantin(String chosenPlayerName) async {
    final isar = await container.read(isarServiceProvider.future);
    final chosenPlayer = await isar.getPlayerByName(chosenPlayerName);
    final konstantin = await isar.getPlayerByRole(RoleName.konstantin);
    //
    isar.updatePlayer(konstantin!.copy(
      hasReturned: true,
    ));
    //
    isar.updatePlayer(chosenPlayer!.copy(
      heart: 1,
      isReversible: false,
    ));
  }

  // mafiaShoot logic
  _mafiaShoot(String chosenPlayerName) async {
    final isar = await container.read(isarServiceProvider.future);
    final chosenPlayer = await isar.getPlayerByName(chosenPlayerName);
    final godFather = await isar.getPlayerByRole(RoleName.godfather);
    //
    isar.updatePlayer(chosenPlayer!.copy(
      heart: chosenPlayer.heart! - 1,
    ));
    //
    isar.updatePlayer(godFather!.copy(
      shotCount: 0,
    ));
  }

  // godfatherSlaughter logic
  _godfatherSlaughter(String chosenPlayerName) async {
    final isar = await container.read(isarServiceProvider.future);
    final chosenPlayer = await isar.getPlayerByName(chosenPlayerName);
    final godFather = await isar.getPlayerByRole(RoleName.godfather);
    //
    isar.updatePlayer(chosenPlayer!.copy(
      hasBeenSlaughtered: true,
      heart: 0,
    ));
    //
    isar.updatePlayer(godFather!.copy(
      shotCount: 0,
    ));
  }

  // matador logic
  _matador(String chosenPlayerName) async {
    final isar = await container.read(isarServiceProvider.future);
    final chosenPlayer = await isar.getPlayerByName(chosenPlayerName);
    final matador = await isar.getPlayerByRole(RoleName.matador);
    //
    isar.updatePlayer(chosenPlayer!.copy(
      isBlocked: true,
    ));
    //
    isar.updatePlayer(matador!.copy(
      shotCount: 0,
    ));
  }

  // saul logic
  _saul(String chosenPlayerName) async {
    final isar = await container.read(isarServiceProvider.future);
    final chosenPlayer = await isar.getPlayerByName(chosenPlayerName);
    final saul = await isar.getPlayerByRole(RoleName.saul);
    //
    isar.updatePlayer(chosenPlayer!.copy(
      isBlocked: true,
    ));
    //
    isar.updatePlayer(saul!.copy(
      hasBuyed: true,
    ));
  }

  // godToDay logic
  godToDay(Map<String, String?> json) async {
    """the core brain of decisions""";

    // requirements
    final isar = await container.read(isarServiceProvider.future);
    final mafiaShot = await isar.getPlayerByName(json["mafiasShot"]!);
    final godFatherChoice =
        await isar.getPlayerByName(json["godfatherChoice"]!);
    final leonChoice = await isar.getPlayerByName(json["leonChoice"]!);
    final kaneChoice = await isar.getPlayerByName(json["kaneChoice"]!);
    final konstantinChoice =
        await isar.getPlayerByName(json["konstantinChoice"]!);
    final watsonChoice = await isar.getPlayerByName(json["watsonChoice"]!);
    final matadorChoice = await isar.getPlayerByName(json["matadorChoice"]!);
    final saulChoice = await isar.getPlayerByName(json["saulChoice"]!);
    // ----------------------------------------------------------------------------------

    // mafia shot
    if (mafiaShot != null) _mafiaShoot(mafiaShot.playerName!);

    // godfather choice for slaughter
    if (godFatherChoice != null)
      _godfatherSlaughter(godFatherChoice.playerName!);

    // leon choice for shooting
    if (leonChoice != null) _leon(leonChoice.playerName!);

    // kane choice for guessing
    if (kaneChoice != null) _kane(kaneChoice.playerName!);

    // konstantin choice for returning
    if (konstantinChoice != null) _konstantin(konstantinChoice.playerName!);

    // watson choice for saving
    if (watsonChoice != null) _watson(watsonChoice.playerName!);

    // matador choice for blocking
    if (matadorChoice != null) _matador(matadorChoice.playerName!);

    // saul choice for blocking
    if (saulChoice != null) _saul(saulChoice.playerName!);

    // update day number
    isar.updateDayNumber(isar.getDayNumber() + 1);
  }

  // godToNight logic
  godToNight() async {
    // requirements
    final isar = await container.read(isarServiceProvider.future);
    // ----------------------------------------------------------------------

    // update night number
    isar.updateNightNumber(isar.getNightNumber() + 1);
  }
}
