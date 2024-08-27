import 'package:auto_mafia/offline/constants/my_strings.dart';
import 'package:auto_mafia/offline/models/last_moves_dataset.dart';
import 'package:auto_mafia/offline/models/role_datasets.dart';
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
  GuideModel(
    question: 'با چند رأی یک نفر به دفاع و با چند رای خارج میشود؟',
    answer:
        '''برای اینکه یک نفر به دفاع برود باید حداقل نصف بیشتر تعداد افراد بازی رأی بیاورد (یعنی حداقل نصف افراد و در صورت فرد بودن تعداد، رند می شود رو به بالا)یعنی اگر ۹ نفر در بازی هستند تقسیم بر ۲ که میشود ۴/۵ و رند رو به بالا که میشود حداقل ۵ رأی.

برای رأی خروج اگر یک نفر در دفاع باشد باز هم باید برای خروج نصف بیشتر رأی بیاورد.
اگر ۲ نفر یا بیشتر باشند حتی اگر یک نفر ۱ رأی هم بیاورد از بازی خارج میشود. اگر همه ی افرادی که در دفاع هستند 0 رأی بیاورند کسی از بازی خارج نمیشود در غیر این صورت هرکس تعداد بیشتری رأی بیاورد از بازی خارج میشود. اگر تعداد رأی های ۲ یا چند نفر مساوی بود از «قرعه ی مرگ» استفاده می‌کنیم.
نکته اینکه افرادی که در دفاع هستند هم می‌توانند به همدیگر رأی بدهند.
نکته ی دیگر اینکه در این نسخه از بازی رأی گیری باید توسط یک فرد مورد اعتماد بازی شمارش شود و مورد تایید همه باشد.''',
    tag: GuideTags.Scenario,
  ),
  GuideModel(
    question: 'یه سری توضیح در مورد سلاخی بده',
    answer:
        '''پدر خوانده قابلیت سلاخی دارد . و میتواند به جای شلیک درصورت متوجه شدن نقش بازیکنی با حدس زدن نقش آن بازیکن را از بازی بیرون کند حتی اگر توسط پزشک سیو شده باشد یا سپر داشته باشد.
برای این کار باید ابتدا گزینه ی «سلاخی» را انتخاب کند و سپس دو لیست نمایان میشود. روی لیست سمت راست اسم های بازیکنان و در لیست سمت چپ نقش های بازیکنان وجود دارد. پدرخوانده باید از لیست سمت راست اسم بازیکن و در لیست سمت چپ نقش حدس زده ی احتمالی را انتخاب می‌کند. و گزینه ی «تموم» را میزند''',
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

  GuideModel(
    question: 'وقتی تغییر چهره اومد چه کنیم ؟',
    answer:
        '''تغییر چهره بدین گونه انجام می‌شود که فردی که کارت تغییر چهره آورده گوشی را بدست میگیرد ، سپس همه ی افراد چشم های خود را میبندند و دست خود را جلو می آورند و آن فرد دستش را به دست یکی از افرادی که خودش انتخاب کرده میزند و او بیدار میشود، سپس در بازی اسم فرد را انتخاب میکند و کارت را به او نشان میدهد. در کارت نوشته شده که چه نقشی با چه نقشی تعویض شده. و از آن به بعد فرد انتخاب شده با نقش جدیدش بازی را ادامه میدهد.''',
    tag: GuideTags.LastMoves,
  ),

  // app
  GuideModel(
    question: 'چگونه می توانم از این برنامه استفاده کنم؟ (روز)',
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
  GuideModel(
    question: 'چگونه می توانم از این برنامه استفاده کنم؟ (شب)',
    answer:
        '''در شب برای هر نقش قابلیت دار، که میتواند از نقشش در آن شب استفاده کند، لیستی از افراد می‌آید که طبق نقشش یکی از آنها را انتخاب می کند.
در شب معارفه فقط برای نوستراداموس لیست افراد می آید. تا ۸ بازیکن نوستراداموس ۲ استعلام دارد ولی از ۹ بازیکن به بالا استعلام نوستراداموس ۳ تا می‌شود.
در شب معارفه برای مافیا نیز اسم یار ها با نقش هایشان نمایان می‌شود و سایر افراد کاری نمیکنند.
در شروع شب های بعد یک تایمر فعال میشود که میتوانید زمان آن را تنظیم کنید و بعد از زدن دکمه ی شروع تمامی بازیکنان چشم های خود را بسته و بعد از ۳ ثانیه مافیا ها چشم های خود را باز و با یکدیگر مشورت می کنند. بعد از شنیدن صدای زنگ مافیا ها چشم هارا بسته و با پایان صدای زنگ تمامی بازیکنان چشم های خود را باز میکنند.
بعد به ترتیب هر فرد روی اسم خود می زند و اگر نقش دار باشد کار خود را انجام می دهد.
''',
    tag: GuideTags.App,
  ),
  GuideModel(
    question: 'قضیه این کد چیه ؟',
    answer:
        '''نکته ی قابل توجه این است که در هر شب برای هر بازیکنی که نقش شهروند دارد یک کد بین ۱ تا ۲۰ می آید و در ماه بالای صفحه قرار میگیرد.مهم است که هر فرد کد خود را حفظ کند. در ادامه گفته می‌شود که کد به چه درد میخورد.
زمانی که ماتادور نقش یک نفر را میبندد(برای همان شب) صبح که شد بازی یک کد اعلام میکند. آن کد با کد شب قبل هرکس مطابقت داشت در واقع نقش آن شخص، شب قبل بسته شده بوده است ، به این معنی که هرکاری که شب قبل انجام داده نادیده گرفته میشود.(و اگر نقشی دارد مانند همشهری کین یا کنستانتین که فقط یکبار قابلیت انجام دارند، اگر نقششان گرفته شود، این قابلیت برای شب بعد باقی می ماند.)
مثال : فرض کنید نقش مریم ، لئون حرفه ای است و کد شب اول او ۴ است. مریم در شب اول به نرگس (که شهروند ساده است) شلیک میکند . تا اینجای بازی در واقع مریم به خاطر شلیک اشتباه باید از بازی بیرون برود ولی...
روز که می شود بازی کد ۴ اعلام می‌کند ، یعنی ماتادور نقش مریم را شب قبل گرفته و شلیک مریم نادیده گرفته می‌شود و مریم در بازی می‌ماند.

''',
    tag: GuideTags.App,
  ),
  GuideModel(
    question: 'کد فراموشی چیه ؟',
    answer:
        '''نکته ی دیگر اینکه کد هر شخص ، هرشب تغییر می‌کند و به صورت رندوم دوباره داده می‌شود.
در صورت فراموش کردن کد میتوانید در روز بعد از اینکه نتایج شب اعلام شد و بازی به صفحه روز رفت با کلیک کردن روی اسم خود و زدن «کد فراموشی»کد شب قبل خود را ببینید.
''',
    tag: GuideTags.App,
  ),
];
