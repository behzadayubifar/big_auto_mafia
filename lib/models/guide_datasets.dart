import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/models/last_moves_dataset.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:flutter/foundation.dart' show immutable;

enum GuideTags {
  RolesBasedOnPlayersNumber,
  Scenario,
  App,
  RolesDescription,
  LastMoves,
}

@immutable
class GuideModel {
  const GuideModel({
    required this.question,
    required this.answer,
    this.tag,
  });
  final String question;
  final String answer;
  final GuideTags? tag;
}

final List<GuideModel> guideDatasets = [
  // roles based on players number
  GuideModel(
    question: 'بازی ۷ نفره شامل چه نقش هایی است؟',
    answer:
        'پدر خوانده ، ماتادور، دکتر واتسون ، لئون حرفه ای، همشهری کین ، کنستانتین و نوستراداموس',
    tag: GuideTags.RolesBasedOnPlayersNumber,
  ),
  GuideModel(
    question: 'بازی ۸ نفره شامل چه نقش هایی است؟',
    answer:
        'پدر خوانده ، ماتادور، دکتر واتسون ، لئون حرفه ای، همشهری کین ، کنستانتین ، نوستراداموس و شهروند ساده',
    tag: GuideTags.RolesBasedOnPlayersNumber,
  ),
  GuideModel(
    question: 'بازی ۹ نفره شامل چه نقش هایی است؟',
    answer:
        'پدر خوانده ، ماتادور، مافیای ساده ، دکتر واتسون ، لئون حرفه ای، همشهری کین ، کنستانتین ، نوستراداموس و شهروند ساده',
    tag: GuideTags.RolesBasedOnPlayersNumber,
  ),
  GuideModel(
    question: 'بازی ۱۰ نفره شامل چه نقش هایی است؟',
    answer:
        'پدر خوانده ، ماتادور، مافیای ساده ، دکتر واتسون ، لئون حرفه ای، همشهری کین ، کنستانتین ، نوستراداموس و دو کارت شهروند ساده',
    tag: GuideTags.RolesBasedOnPlayersNumber,
  ),
  GuideModel(
    question: 'بازی ۱۱ نفره شامل چه نقش هایی است؟',
    answer:
        'پدر خوانده ، ماتادور، ساول گودمن ، دکتر واتسون ، لئون حرفه ای، همشهری کین ، کنستانتین ، نوستراداموس و سه کارت شهروند',
    tag: GuideTags.RolesBasedOnPlayersNumber,
  ),

  // scenario
  GuideModel(
    question: 'چه نقش هایی در بازی وجود دارد؟',
    answer:
        'پدر خوانده ، ماتادور، مافیای ساده ، دکتر واتسون ، لئون حرفه ای، همشهری کین ، کنستانتین ، نوستراداموس و شهروند ساده',
    tag: GuideTags.Scenario,
  ),

  // roles description
  GuideModel(
    question: 'نقش پدر خوانده',
    answer: allRoles[RoleName.godfather]!['description'],
    tag: GuideTags.RolesDescription,
  ),
  GuideModel(
    question: 'نقش ماتادور',
    answer: allRoles[RoleName.matador]!['description'],
    tag: GuideTags.RolesDescription,
  ),

  GuideModel(
    question: 'نقش ساول گودمن',
    answer: allRoles[RoleName.saul]!['description'],
    tag: GuideTags.RolesDescription,
  ),

  GuideModel(
    question: 'نقش دکتر واتسون',
    answer: allRoles[RoleName.watson]!['description'],
    tag: GuideTags.RolesDescription,
  ),
  GuideModel(
    question: 'نقش لئون حرفه ای',
    answer: allRoles[RoleName.leon]!['description'],
    tag: GuideTags.RolesDescription,
  ),
  GuideModel(
    question: 'نقش همشهری کین',
    answer: allRoles[RoleName.kane]!['description'],
    tag: GuideTags.RolesDescription,
  ),
  GuideModel(
    question: 'نقش کنستانتین',
    answer: allRoles[RoleName.konstantin]!['description'],
    tag: GuideTags.RolesDescription,
  ),
  GuideModel(
    question: 'نقش نوستراداموس',
    answer: allRoles[RoleName.nostradamous]!['description'],
    tag: GuideTags.RolesDescription,
  ),
  GuideModel(
    question: 'نقش شهروند ساده',
    answer: allRoles[RoleName.citizen]!['description'],
    tag: GuideTags.RolesDescription,
  ),
  GuideModel(
    question: 'نقش مافیای ساده',
    answer: allRoles[RoleName.mafia]!['description'],
    tag: GuideTags.RolesDescription,
  ),

  // last moves
  GuideModel(
    question: 'ذهن زیبا',
    answer: allLastMoves[MyStrings.beautifulMind]!,
    tag: GuideTags.LastMoves,
  ),
  GuideModel(
    question: 'تغییر چهره',
    answer: allLastMoves[MyStrings.faceOff]!,
    tag: GuideTags.LastMoves,
  ),
  GuideModel(
    question: 'سکوت بره ها',
    answer: allLastMoves[MyStrings.silenceOfSheep]!,
    tag: GuideTags.LastMoves,
  ),
  GuideModel(
    question: 'افشای هویت',
    answer: allLastMoves[MyStrings.roleReveal]!,
    tag: GuideTags.LastMoves,
  ),
  GuideModel(
    question: 'دستبند',
    answer: allLastMoves[MyStrings.handCuff]!,
    tag: GuideTags.LastMoves,
  ),

  // app
  GuideModel(
    question: 'چگونه می توانم از این برنامه استفاده کنم؟',
    answer: '''برای شروع، ابتدا «شروع بازی جدید» را انتخاب کنید.
از بالای صفحه ، روی  «۱۱ نفره» کلیک کنید. تعداد بازیکنان هرچند تا (بین ۷ تا ۱۱) که هست انتخاب کنید.
اسم هارا از پیشفرض به اسم بازیکنان تغییر دهید.
گزینه ی «کارت پخش کن » را انتخاب کنید.(انگشت خود را روی دکمه دو ثانیه نگه دارید)
هر نفر اسم خودش را انتخاب کند (۲ ثانیه نگه دارید).نقشش را ببیند و در آخر گزینه ی «دیدم» (۲ثانیه) را انتخاب کنید.
وقتی تمام بازیکنان نقش خود را دیدند بازی به روز میرود.
وقتی همه ی بازیکنان صحبت کردن و رأی گیری انجام شد بازیکنانی که رأی خروج آوردند انتخاب کنید.
اگر فقط یک بازیکن باشد برای همان بازیکن کارت حرکت آخر نمایان میشود.
اما اگر بیش از یک بازیکن باشد، با زدن گزینه ی «قرعه مرگ» یک بازیکن به صورت رندوم برای خروج و کارت حرکت آخر انتخاب می‌شود. 
در صورتی که هیچکس خارج نشد با نگه داشتن (۲ثانیه) دکمه ی ماه پایین صفحه بازی به شب می رود.
''',
    tag: GuideTags.App,
  ),
];
