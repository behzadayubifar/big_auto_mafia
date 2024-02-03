class MyStrings {
  MyStrings._();

  // titles
  static const String appName = 'اتومافیا';
  static const String titleNumberOfPlayers = 'تعداد بازیکنان';
  static const String titleNaming = 'اسامی';
  static const String rolesTitle = 'نقش ها';
  static const String nightTitle = 'شب';

  // buttons-texts
  static const String startGame = 'شروع بازی';
  static const String nPlayer = 'نفره';
  static const String assignRole = 'کارت پخش کن';
  // static const String assignRole = 'دیدن ن';
  static const String next = 'بعدی';
  static const String back = 'قبلی';
  static const String cancel = 'لغو';
  static const String ok = 'تایید';
  static const String seeNightResults = 'نتایج شب';
  static const String saw = 'دیدم';
  static const String showMyRole = 'ببینم نقشمو';

  // situation
  static const String naming = 'naming';
  static const String showRoles = 'showRoles';
  static const String nightPage = 'night-page';
  static const String rolePanel = 'role-panel';
  static const String dayPage = 'day-page';

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

  // button-states
  static const String defaultButton = 'default';
  static const String longPressedButton = 'longPressedButton';
  static const String doubleTappedButton = 'doubleTappedButton';
  static const String nightSpecificButton = 'nightSpecificButton';
  static const String disabledButton = 'disabledButton';
}
