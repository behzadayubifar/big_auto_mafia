import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:auto_mafia/offline/gen/assets.gen.dart';

class MyAssets {
  MyAssets._();

  static final String titleBg = Assets.images.backGround.titleBg.path;
  static final String titleBg2 = Assets.images.backGround.titleBg2.path;

  static final String numberHolder = Assets.icons.numberHolder.path;
  static final String playerNameFrame = Assets.images.frames.namesFrame.path;

  static final String logo = Assets.screenshots.logo.path;
  static final String overlay = Assets.screenshots.overlay.path;

  // night's
  static final String nightBg = Assets.images.nights.nightBg.path;
  static final String moon = Assets.images.nights.moonPng.path;
  static final String moon_hq = Assets.images.nights.moonHq.path;
  static final String dashedLine = Assets.images.nights.dashedLine.path;

  // role's-cards
  static final String citizenCard = Assets.cards.roles.citizenCard.path;
  static final String watsonCard = Assets.cards.roles.watsonCard.path;
  static final String leonCard = Assets.cards.roles.leonCard.path;
  static final String kaneCard = Assets.cards.roles.kaneCard.path;
  static final String nostradamousCard =
      Assets.cards.roles.nostradamusCard.path;
  static final String konstantinCard = Assets.cards.roles.konstantinCard.path;
  static final String saulCard = Assets.cards.roles.saulCard.path;
  static final String matadorCard = Assets.cards.roles.matadorCard.path;
  static final String godfatherCard = Assets.cards.roles.godfatherCard.path;
  static final String whichRole = Assets.cards.roles.whichRole.path;
  static final String mafiaCard = Assets.cards.roles.mafiaCard.path;
  static final String mysteriousGangsterCharacter =
      Assets.cards.roles.mysteriousGangsterCharacter.path;

  // overlays
  static final String decorate = Assets.overlays.decorate.path;
  static final String devilEmoji = Assets.overlays.devilEmoji.path;
  static final String dropDown = Assets.overlays.dropdown.path;
  static final String knife = Assets.overlays.knife.path;
  static final String mask = Assets.overlays.mask.path;
  static final String outPeople = Assets.overlays.outPeople.path;
  static final String night = Assets.overlays.night.path;
  static final String pureBg = Assets.overlays.pureBg.path;
  static final String pureBgOverlay = Assets.overlays.pureBgOverlay.path;
  static final String returnToLife = Assets.overlays.returnToLife.path;
  static final String tornPaper = Assets.overlays.tornPaper.path;
  static final String viewFocusTargetVisibilitySeen =
      Assets.overlays.viewFocusTargetVisibilitySeen.path;
  static final String visibleEyeInvisibleSeen =
      Assets.overlays.visibleEyeInvisibleSeen.path;

  // day's
  static final String dayBg = Assets.images.days.dayPureBg.path;
  static final String sun = Assets.images.days.sun.path;
  static final String moonInDay = Assets.images.days.moonInDay.path;
  static final String excludeForMoonInDay =
      Assets.images.days.excludeForMoonInDay.path;

  // last moves
  static final String beautifulMind = Assets.cards.lastMoves.beautifulMind.path;
  static final String faceOff = Assets.cards.lastMoves.faceOff.path;
  static final String handCuff = Assets.cards.lastMoves.handcuff.path;
  static final String roleReveal = Assets.cards.lastMoves.roleReveal.path;
  static final String silenceOfSheep =
      Assets.cards.lastMoves.silenceOfSheep.path;

  // a method to get iamge by topic for nights_results
  static Map<String, dynamic> getImageAndRelatedColorByTopic(String topic) {
    switch (topic) {
      case 'deads':
        return {
          'image': outPeople,
          'color': AppColors.tintsOfBlack[1],
          'scale': 4.8,
        };
      case 'bornPlayer':
        return {
          'image': returnToLife,
          'color': AppColors.green,
          'scale': 15.0,
        };
      case 'disclosured':
        return {
          'image': mask,
          'color': AppColors.secondaries[1],
          'scale': 4.0,
        };
      case 'slaughtered':
        return {
          'image': knife,
          'color': AppColors.secondaries[2],
          'scale': 12.0,
        };
      default:
        return {'image': '?', 'color': AppColors.secondaries[2], 'scale': 1.0};
    }
  }

  // a method to get card of lastMove by name of lastMove
  static String getCardByLastMoveName(String lastMoveName) {
    switch (lastMoveName) {
      case 'beautifulMind':
        return beautifulMind;
      case 'faceOff':
        return faceOff;
      case 'handCuff':
        return handCuff;
      case 'roleReveal':
        return roleReveal;
      case 'silenceOfSheep':
        return silenceOfSheep;
      default:
        return '?';
    }
  }
}
