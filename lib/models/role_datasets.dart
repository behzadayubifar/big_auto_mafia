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
  mafia,
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
  RoleName.mafia: "مافیا ساده",
};

getRoleName(RoleName roleName) => roleNames[roleName]!;

List<String> roleNamesList(playersCount) => [
      roleNames[RoleName.godfather]!,
      roleNames[RoleName.matador]!,
      roleNames[RoleName.watson]!,
      roleNames[RoleName.leon]!,
      roleNames[RoleName.kane]!,
      roleNames[RoleName.konstantin]!,
      roleNames[RoleName.nostradamous]!,
      if (playersCount >= 8) roleNames[RoleName.citizen]!,
      if (playersCount == 9 || playersCount == 10) roleNames[RoleName.mafia]!,
      if (playersCount >= 10) roleNames[RoleName.citizen]!,
      if (playersCount == 11) roleNames[RoleName.citizen]!,
      if (playersCount == 11) roleNames[RoleName.saul]!,
    ];

Map<RoleName, Map<String, dynamic>> allRoles = {
  RoleName.citizen: {
    "roleName": roleNames[RoleName.citizen],
    "description":
        'شهروندی است که هیچ توانایی خاصی ندارد و تنها باید با همکاری بازیکنان دیگر مافیا ها را شناسایی کند و از بازی خارج کند.',
    "type": RoleType.citizen,
    "heart": 1,
  },
  RoleName.watson: {
    "roleName": roleNames[RoleName.watson],
    "description":
        'هرشب می تواند جان یک نفر چه عضو مافیا و چه عضو شهروندی را نجات دهد.جان خودش را یکبار می تواند در طول بازی نجات دهد ولی در نجات جان دیگران محدودیتی ندارد.',
    "type": RoleType.citizen,
    "heart": 1,
  },
  RoleName.leon: {
    "roleName": roleNames[RoleName.leon],
    "description":
        """هرشبی که بخواهد می تواند به یکی از اعضای تیم مافیا شلیک کند.
              اما با شلیک اشتباه به شهروندان به مجازات خودش کشته می شود و دکتر نمی تواند او را نجات دهد.
              لئون یک جلیقه دارد که یکبار از تیر نجات پیدا می کند.حداکثر دو شلیک دارد.
              """,
    "type": RoleType.citizen,
    "heart": 2,
  },
  RoleName.kane: {
    "roleName": roleNames[RoleName.kane],
    "description":
        'شهروندی است که در یکی از شب ها به انتخاب خود به دعوت گرداننده یکی از بازیکنان را نشان می دهد.اگر یک مافیا را درست نشان کرده باشد صبح روز بعد گرداننده ساید مافیای نشان شده را در جمع افشا می کند.و همشهری کین شب بعد کشته می شود.دکتر توانایی نجات او را ندارد.اما اگر نشانش از ساید مافیا نبود گرداننده هیچ چیزی اعلام نخواهد کرد و همشهری کین در بازی خواهد ماند و استعلامش از بین خواهد رفت.اگر او یا نشانش کشته شوند عملیات شب وی اجرا نشده و از بین نمی رود و همچنان باقی می ماند.استعلام پدرخوانده برای همشهری کین مافیایی است.',
    "type": RoleType.citizen,
    "heart": 1,
  },
  RoleName.konstantin: {
    "roleName": roleNames[RoleName.konstantin],
    "description":
        'گرداننده کنستانتین را بیدار می کند تا او به انتخاب خود و تنها یک بار یک نفر از بازیکنان اخراجی اعم از مافیا شهروند و یا مستقل را به بازی برگرداند.غیر از نقش های افشا شده.توانایی های بازیکن احضار شده ادامه پیدا می کند و از بین نمی رود و از نو نمی شود.',
    "type": RoleType.citizen,
    "heart": 1,
  },
  RoleName.nostradamous: {
    "roleName": roleNames[RoleName.nostradamous],
    "description":
        'در شب معارفه گرداننده او را بیدار می کند.نوستراداموس به انتخاب خود سه بازیکن را به گرداننده نشان می دهد.سپس گرداننده به او تعداد مافیا های موجود در میان این سه را اعلام می کند و پیش بینی او مبنی بر پیروزی یکی از دو ساید را از او می پرسد.نوستراداموس پیش بینی می کند شهروندان برنده خواهند شد یا مافیا ها.از این پس او برای برنده شدن سایدی که انتخاب کرده است تلاش می کند.بدون آنکه دیگر افراد بدانند وی به چه سایدی پیوسته است.اگر ساید مورد انتخابش برنده شد او نیز برنده است و اگر ساید مورد انتخابش بازنده شد او نیز بازنده خواهد شد.شلیک هیچ یک از دو ساید بر او موثر نخواهد بود و در شب کشته نخواهد شد.مگر با حس ششم پدرخوانده اما در روز با رای گیری از بازی خارج خواهد شد.استعلام پدرخوانده برای وی شهروندی خواهد بود.',
    "type": RoleType.independent,
    "heart": 100,
  },
  RoleName.godfather: {
    "roleName": roleNames[RoleName.godfather],
    "description":
        'او از یک بار شلیک شب لئون مصون است.یک جلیقه دارد.تعیین شلیک شب از طرف گروه به عهده پدرخوانده است و اگر از بازی خارج شود دیگر اعضا به جای او شلیک می کنند.پدرخوانده دارای توانایی حس ششم است و اگر در شب تصمیم بگیرد به جای شلیک از حس ششم استفاده کند باید نقش بازیکنی را درست حدس بزند و توسط گرداننده تائید شود.بازیکنی که پدرخوانده نقش او را درست حدس زده است سلاخی می شود یعنی اگر سپر داشته باشد یا دکتر او را سیو کرده باشد بازهم از بازی خارج می شود و آن شب توانایی وی اعمال نخواهد شد و پس از خروج از بازی توسط کنستانتین قابل احضار نمی باشد.استعلام پدرخوانده برای نوستراداموس شهروندی بوده ولی برای همشهری کین مافیایی و مثبت خواهد بود.',
    "type": RoleType.mafia,
    "heart": 2,
  },
  RoleName.matador: {
    "roleName": roleNames[RoleName.matador],
    "description":
        'شب ها با تیم مافیا بیدار می شود و هر شب از توانایی خود استفاده می کند.در شب هر بازیکنی را نشان دهد توانایی شب او را آن شب از وی خواهد گرفت و فرد نشان شده اگر بیدار شود با ضربدر گرداننده مواجه می شود اما فردا مجدد می تواند از توانایی اش استفاده کند.ماتادور دو شب متوالی نمی تواند یک بازیکن را نشان کند.',
    "type": RoleType.mafia,
    "heart": 1,
  },
  RoleName.saul: {
    "roleName": roleNames[RoleName.saul],
    "description":
        'شب ها با تیم مافیا بیدار می شود و هر شب از توانایی خود استفاده می کند.در شب هر بازیکنی را نشان دهد توانایی شب او را آن شب از وی خواهد گرفت و فرد نشان شده اگر بیدار شود با ضربدر گرداننده مواجه می شود اما فردا مجدد می تواند از توانایی اش استفاده کند.سائول دو شب متوالی نمی تواند یک بازیکن را  کند.',
    "type": RoleType.mafia,
    "heart": 1,
  },
  RoleName.mafia: {
    "roleName": roleNames[RoleName.mafia],
    "description":
        'مافیا ها شب ها با یکدیگر بیدار می شوند و هر شب از توانایی خود استفاده می کنند.در شب هر بازیکنی را نشان دهند توانایی شب او را آن شب از وی خواهند گرفت و فرد نشان شده اگر بیدار شود با ضربدر گرداننده مواجه می شود اما فردا مجدد می تواند از توانایی اش استفاده کند.مافیا ها باید با همکاری یکدیگر شهروندان را از بازی خارج کنند.',
    "type": RoleType.mafia,
    "heart": 1,
  },
};
