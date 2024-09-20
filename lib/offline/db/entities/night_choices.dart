import 'package:isar/isar.dart';

import '../fast_hash.dart';

part 'night_choices.g.dart';

/* 
  MafiaShot                 uuid.UUID `json:"mafia_shot" db:"mafia_shot" validate:"omitempty,uuid" errormsg:"id must be a valid UUID"`
	Slaughtery                uuid.UUID `json:"slaughtery" db:"slaughtery" validate:"omitempty,uuid" errormsg:"id must be a valid UUID"`
	TheRoleGuessedByGodfather string    `json:"the_role_guessed_by_godfather" db:"the_role_guessed_by_godfather"`
	Matador                   uuid.UUID `json:"matador" db:"matador" validate:"omitempty,uuid" errormsg:"id must be a valid UUID"`
	// NightOfBlockage           int       `json:"night_of_blockage" db:"night_of_blockage" validate:"omitempty" errormsg:"night_of_blockage must be a valid integer"`
	NightOfRightGuessOfKane int             `json:"night_of_right_guess_of_kane" db:"night_of_right_guess_of_kane" validate:"omitempty" errormsg:"night_of_right_guess_of_kane must be a valid integer"`
	Saul                    uuid.UUID       `json:"saul" db:"saul" validate:"omitempty,uuid" errormsg:"id must be a valid UUID"`
	Watson                  uuid.UUID       `json:"watson" db:"watson" validate:"omitempty,uuid" errormsg:"id must be a valid UUID"`
	Leon                    uuid.UUID       `json:"leon" db:"leon" validate:"omitempty,uuid" errormsg:"id must be a valid UUID"`
	Kane                    uuid.UUID       `json:"kane" db:"kane" validate:"omitempty,uuid" errormsg:"id must be a valid UUID"`
	Konstantin              uuid.UUID       `json:"konstantin" db:"konstantin" validate:"omitempty,uuid" errormsg:"id must be a valid UUID"`
	Nostradamous            utils.UUIDArray `json:"nostradamous" db:"nostradamous"`
 */

@Collection()
class NightChoices {
  String? roomId;

  Id get isarId => fastHash(roomId!);

  String? mafiaShot;
  String? slaughtery;
  String? theRoleGuessedByGodfather;
  String? matador;
  int? nightOfRightGuessOfKane;
  String? saul;
  String? watson;
  String? leon;
  String? kane;
  String? konstantin;
  List<String>? nostradamous;

  static NightChoices fromJson(Map<String, dynamic> json) => NightChoices()
    ..roomId = json['room_id']
    ..mafiaShot = json['mafia_shot']
    ..slaughtery = json['slaughtery']
    ..theRoleGuessedByGodfather = json['the_role_guessed_by_godfather']
    ..matador = json['matador']
    ..nightOfRightGuessOfKane = json['night_of_right_guess_of_kane']
    ..saul = json['saul']
    ..watson = json['watson']
    ..leon = json['leon']
    ..kane = json['kane']
    ..konstantin = json['konstantin']
    ..nostradamous = List<String>.from(json['nostradamous']);

  Map<String, dynamic> toJson() => {
        'room_id': roomId,
        'mafia_shot': mafiaShot,
        'slaughtery': slaughtery,
        'the_role_guessed_by_godfather': theRoleGuessedByGodfather,
        'matador': matador,
        'night_of_right_guess_of_kane': nightOfRightGuessOfKane,
        'saul': saul,
        'watson': watson,
        'leon': leon,
        'kane': kane,
        'konstantin': konstantin,
        'nostradamous': nostradamous,
      };

  NightChoices copy({
    String? roomId,
    String? mafiaShot,
    String? slaughtery,
    String? theRoleGuessedByGodfather,
    String? matador,
    int? nightOfRightGuessOfKane,
    String? saul,
    String? watson,
    String? leon,
    String? kane,
    String? konstantin,
    List<String>? nostradamous,
  }) =>
      NightChoices()
        ..roomId = roomId ?? this.roomId
        ..mafiaShot = mafiaShot ?? this.mafiaShot
        ..slaughtery = slaughtery ?? this.slaughtery
        ..theRoleGuessedByGodfather =
            theRoleGuessedByGodfather ?? this.theRoleGuessedByGodfather
        ..matador = matador ?? this.matador
        ..nightOfRightGuessOfKane =
            nightOfRightGuessOfKane ?? this.nightOfRightGuessOfKane
        ..saul = saul ?? this.saul
        ..watson = watson ?? this.watson
        ..leon = leon ?? this.leon
        ..kane = kane ?? this.kane
        ..konstantin = konstantin ?? this.konstantin
        ..nostradamous = nostradamous ?? this.nostradamous;
}
