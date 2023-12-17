import 'package:isar/isar.dart';

part 'role.g.dart';

enum RoleType { citizen, mafia, independent }

enum RoleName {
  citizen,
  watson,
  leon,
  kane,
  konstantin,
  nostradamous,
  godfather,
  matador,
  saul,
}

Map<RoleName, String> roleNames = {
  RoleName.citizen: "شهروند ساده",
  RoleName.watson: "دکتر واتسون",
  RoleName.leon: "لئون حرفه‌ای",
  RoleName.kane: "همشهری کین",
  RoleName.konstantin: "کنستانتین",
  RoleName.nostradamous: "نوستراداموس",
  RoleName.godfather: "پدرخوانده",
  RoleName.matador: "ماتادور",
  RoleName.saul: "سائول گودمن",
};

@embedded
class Role {
  Role();
  String? roleName;
  String? description;
  @Enumerated(EnumType.ordinal32)
  RoleType? type;
  int? heart;
  int? code;
  bool isBlocked = false;
  bool handCuffed = false;
  bool isReversible = true;
  bool isSaved = false;
  bool isShot = false;
  bool disclosured = false;
  Role.start({
    required this.roleName,
    required this.type,
    required this.description,
    required this.heart,
    this.code,
    this.isBlocked = false,
    this.handCuffed = false,
    this.isReversible = true,
    this.isSaved = false,
    this.isShot = false,
    this.disclosured = false,
  });
}

// @embedded
// class PseudoRole extends Role {
//   PseudoRole();
//   String? roleName;
//   String? description;
//   @Enumerated(EnumType.ordinal32)
//   RoleType? type;
//   int? heart;
//   int? code;
//   bool isBlocked = false;
//   bool handCuffed = false;
//   bool isReversible = true;
//   bool isSaved = false;
//   bool isShot = false;
//   bool disclosured = false;
//   PseudoRole.start({
//     required this.roleName,
//     required this.type,
//     required this.description,
//     required this.heart,
//     this.code,
//     this.isBlocked = false,
//     this.handCuffed = false,
//     this.isReversible = true,
//     this.isSaved = false,
//     this.isShot = false,
//     this.disclosured = false,
//   });
// }

class Citizen extends Role {
  Citizen();
  Citizen.start()
      : super.start(
          roleName: roleNames[RoleName.citizen]!,
          description:
              'شهروندی است که هیچ توانایی خاصی ندارد و تنها باید با همکاری بازیکنان دیگر مافیا ها را شناسایی کند و از بازی خارج کند.',
          heart: 1,
          type: RoleType.citizen,
        );
}

class Watson extends Role {
  Watson();
  // later we will add a bool isSavedOnce to check if watson saved someone once or not
  late final bool _isSavedOnce;
  Watson.start()
      : super.start(
          roleName: roleNames[RoleName.watson]!,
          description:
              'هرشب می تواند جان یک نفر چه عضو مافیا و چه عضو شهروندی را نجات دهد.جان خودش را یکبار می تواند در طول بازی نجات دهد ولی در نجات جان دیگران محدودیتی ندارد.',
          heart: 1,
          type: RoleType.citizen,
        );

  bool get isSavedOnce => _isSavedOnce;
  set isSavedOnce(_) => _isSavedOnce = true;
}

class Leon extends Role {
  Leon();
  int _shotCount = 0;
  Leon.start()
      : super.start(
          roleName: roleNames[RoleName.leon]!,
          description:
              """هرشبی که بخواهد می تواند به یکی از اعضای تیم مافیا شلیک کند.
              اما با شلیک اشتباه به شهروندان به مجازات خودش کشته می شود و دکتر نمی تواند او را نجات دهد.
              لئون یک جلیقه دارد که یکبار از تیر نجات پیدا می کند.حداکثر دو شلیک دارد.
              """,
          heart: 2,
          type: RoleType.citizen,
        );

  int get shotCount => _shotCount;
  set shotCount(_) => _shotCount++;
}

class Kane extends Role {
  Kane();
  late final bool? _hasGussed;
  Kane.start()
      : super.start(
          roleName: roleNames[RoleName.kane]!,
          description:
              'شهروندی است که در یکی از شب ها به انتخاب خود به دعوت گرداننده یکی از بازیکنان را نشان می دهد.اگر یک مافیا را درست نشان کرده باشد صبح روز بعد گرداننده ساید مافیای نشان شده را در جمع افشا می کند.و همشهری کین شب بعد کشته می شود.دکتر توانایی نجات او را ندارد.اما اگر نشانش از ساید مافیا نبود گرداننده هیچ چیزی اعلام نخواهد کرد و همشهری کین در بازی خواهد ماند و استعلامش از بین خواهد رفت.اگر او یا نشانش کشته شوند عملیات شب وی اجرا نشده و از بین نمی رود و همچنان باقی می ماند.استعلام پدرخوانده برای همشهری کین مافیایی است.',
          heart: 1,
          type: RoleType.citizen,
        );

  bool? get hasGuessed => _hasGussed;
  set hasGuessed(_) => _hasGussed = true;
}

class Konstantin extends Role {
  Konstantin();
  late final bool? _hasReturned;
  Konstantin.start()
      : super.start(
          roleName: roleNames[RoleName.konstantin]!,
          description:
              'گرداننده کنستانتین را بیدار می کند تا او به انتخاب خود و تنها یک بار یک نفر از بازیکنان اخراجی اعم از مافیا شهروند و یا مستقل را به بازی برگرداند.غیر از نقش های افشا شده.توانایی های بازیکن احضار شده ادامه پیدا می کند و از بین نمی رود و از نو نمی شود.',
          heart: 1,
          type: RoleType.citizen,
        );

  bool? get hasReturned => _hasReturned;
  set hasReturned(_) => _hasReturned = true;
}

class Nostradamous extends Role {
  Nostradamous();
  late final RoleType _whichSideWillWin;
  Nostradamous.start()
      : super.start(
          roleName: roleNames[RoleName.nostradamous]!,
          description:
              'در شب معارفه گرداننده او را بیدار می کند.نوستراداموس به انتخاب خود سه بازیکن را به گرداننده نشان می دهد.سپس گرداننده به او تعداد مافیا های موجود در میان این سه را اعلام می کند و پیش بینی او مبنی بر پیروزی یکی از دو ساید را از او می پرسد.نوستراداموس پیش بینی می کند شهروندان برنده خواهند شد یا مافیا ها.از این پس او برای برنده شدن سایدی که انتخاب کرده است تلاش می کند.بدون آنکه دیگر افراد بدانند وی به چه سایدی پیوسته است.اگر ساید مورد انتخابش برنده شد او نیز برنده است و اگر ساید مورد انتخابش بازنده شد او نیز بازنده خواهد شد.شلیک هیچ یک از دو ساید بر او موثر نخواهد بود و در شب کشته نخواهد شد.مگر با حس ششم پدرخوانده اما در روز با رای گیری از بازی خارج خواهد شد.استعلام پدرخوانده برای وی شهروندی خواهد بود.',
          heart: 100,
          type: RoleType.independent,
        );

  @enumerated
  RoleType get whichSideWillWin => _whichSideWillWin;
  set whichSideWillWin(RoleType chosenSide) => _whichSideWillWin = chosenSide;
}

class Godfather extends Role {
  Godfather();
  Godfather.start()
      : super.start(
          roleName: roleNames[RoleName.godfather]!,
          description:
              'او از یک بار شلیک شب لئون مصون است.یک جلیقه دارد.تعیین شلیک شب از طرف گروه به عهده پدرخوانده است و اگر از بازی خارج شود دیگر اعضا به جای او شلیک می کنند.پدرخوانده دارای توانایی حس ششم است و اگر در شب تصمیم بگیرد به جای شلیک از حس ششم استفاده کند باید نقش بازیکنی را درست حدس بزند و توسط گرداننده تائید شود.بازیکنی که پدرخوانده نقش او را درست حدس زده است سلاخی می شود یعنی اگر سپر داشته باشد یا دکتر او را سیو کرده باشد بازهم از بازی خارج می شود و آن شب توانایی وی اعمال نخواهد شد و پس از خروج از بازی توسط کنستانتین قابل احضار نمی باشد.استعلام پدرخوانده برای نوستراداموس شهروندی بوده ولی برای همشهری کین مافیایی و مثبت خواهد بود.',
          heart: 2,
          type: RoleType.mafia,
        );
}

class Matador extends Role {
  Matador();
  Matador.start()
      : super.start(
          roleName: roleNames[RoleName.matador]!,
          description:
              'شب ها با تیم مافیا بیدار می شود و هر شب از توانایی خود استفاده می کند.در شب هر بازیکنی را نشان دهد توانایی شب او را آن شب از وی خواهد گرفت و فرد نشان شده اگر بیدار شود با ضربدر گرداننده مواجه می شود اما فردا مجدد می تواند از توانایی اش استفاده کند.ماتادور دو شب متوالی نمی تواند یک بازیکن را نشان کند.',
          heart: 1,
          type: RoleType.mafia,
        );
}

class Saul extends Role {
  Saul();
  late final bool _hasBuyed;
  Saul.start()
      : super.start(
          roleName: roleNames[RoleName.saul]!,
          description:
              'شب ها با تیم مافیا بیدار می شود و هر شب از توانایی خود استفاده می کند.در شب هر بازیکنی را نشان دهد توانایی شب او را آن شب از وی خواهد گرفت و فرد نشان شده اگر بیدار شود با ضربدر گرداننده مواجه می شود اما فردا مجدد می تواند از توانایی اش استفاده کند.سائول دو شب متوالی نمی تواند یک بازیکن را  کند.',
          heart: 1,
          type: RoleType.mafia,
        );

  bool get hasBuyed => _hasBuyed;
  set hasBuyed(_) => _hasBuyed = true;
}
