class MyStrings {
  MyStrings._();

  // titles
  static const String appName = 'اتومافیا';
  static const String titleNumberOfPlayers = 'تعداد بازیکنان';
  static const String titleNaming = 'اسامی';
  static const String rolesTitle = 'نقش ها';
  static const String nightTitle = 'شب';
  static const String resultOfPrediction = 'نتیجۀ پیش بینی';

  // buttons-texts
  static const String startGame = 'شروع بازی';
  static const String nPlayer = 'نفره';
  static const String assignRole = 'کارت پخش کن';
  // static const String assignRole = 'دیدن ن';
  static const String next = 'بعدی';
  static const String back = 'قبلی';
  static const String cancel = 'لغو';
  static const String ok = 'تایید';
  static const String nightResults = 'نتایج شب';
  static const String saw = 'دیدم';
  static const String showMyRole = 'ببینم نقشمو';
  static const String finish = 'تموم';
  static const String understand = 'فهمیدم';
  static const String enquiry = 'استعلام';
  static const String enquiryResults = 'نتیجۀ استعلام';

  // situation
  static const String naming = 'naming';
  static const String showRoles = 'showRoles';
  static const String nightPage = 'night-page';
  static const String rolePanel = 'role-panel';
  static const String dayPage = 'day-page';
  static const String nightResultsPage = 'night-results-page';
  static const String reNight = 're-night';
  static const String gameOver = 'game-over';
  static const String chaos = 'chaos';

  // show-role-page situations
  static const String beforeShowingRole = 'before-showing-role';
  static const String roleIsShowing = 'role-is-showing';
  static const String seenRole = 'seen-role';

  // role's-page
  static const String godfatherPage = 'godfather-page';
  static const String matadorPage = 'matador-page';
  static const String saulPage = 'saul-page';
  static const String konstantinPage = 'konstantin-page';
  static const String watsonPage = 'watson-page';
  static const String leonPage = 'leon-page';
  static const String kanePage = 'kane-page';
  static const String predictPage = 'nostrodamus-page';
  static const String citizenPage = 'citizen-page';
  static const String mafiaPage = 'mafia-page';

  static String pageByRole(String role) {
    final page = switch (role) {
      'پدرخوانده' => godfatherPage,
      'ماتادور' => matadorPage,
      'سائول گودمن' => saulPage,
      'کنستانتین' => konstantinPage,
      'دکتر واتسون' => watsonPage,
      'لئون حرفه‌ای' => leonPage,
      'همشهری کین' => kanePage,
      'نوستراداموس' => predictPage,
      'شهروند ساده' => citizenPage,
      _ => '?',
    };
    return page;
  }

  // roles
  static const String godfather = 'پدرخوانده';
  static const String matador = 'ماتادور';
  static const String saul = 'سائول گودمن';
  static const String konstantin = 'کنستانتین';
  static const String watson = 'دکتر واتسون';
  static const String leon = 'لئون حرفه‌ای';
  static const String kane = 'همشهری کین';
  static const String nostradamous = 'نوستراداموس';
  static const String citizen = 'شهروند ساده';
  static const String mafia = 'مافیا ساده';

  // night-role-panel
  static const String nightDoneJob = 'nightDoneJob';
  static const String undoJob = 'صرف نظر از انتخاب قبلی';
  static const String shootInPlaceOfGodfather = 'شلیک';
  static const String buying = 'خریداری';
  static const String defuse = 'دیفیوز (ماتادور)';

  // button-states
  static const String defaultButton = 'default';
  static const String longPressedButton = 'longPressedButton';
  static const String doubleTappedButton = 'doubleTappedButton';
  static const String nightSpecificButton = 'nightSpecificButton';
  static const String disabledButton = 'disabledButton';

  // button-places
  static const String nightPlayer = 'nightPlayer';

  // nights' results
  static const String deads = 'deads';
  static const String bornPlayer = 'bornPlayer';
  static const String disclosured = 'disclosured';
  static const String slaughtered = 'slaughtered';
  static const String nightCode = ' کد شب :  ';
  static const String allDeads = 'همۀ رفتگان';
  static const String nextNight = 'شب بعد';
  static const String nextDay = 'روز بعد';
  static const String returnedToGame = 'به بازی برگشت';
  static const String isMafia = 'مافیاست';
  static const String isSlaughtered = 'سلاخی شد';
  static const String resultOfEnquiry = 'نتیجۀ استعلام';

  // common
  static const String tonight = 'tonight';

  // overlays
  static const String nostradamousResultsOfPredict =
      'nostradamousResultsOfPredict';

  // last move names
  static const String lastMove = 'lastMove';
  static const String beautifulMind = 'beautifulMind';
  static const String faceOff = 'faceOff';
  static const String handCuff = 'handCuff';
  static const String silenceOfSheep = 'silenceOfSheep';
  static const String roleReveal = 'roleReveal';

  // dialogs
  static const String areYouShureToQuitTheApp = 'شما در حال خروج از بازی هستید';
  static const String exitFromApp = 'خروج از بازی';
}
