import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'q2a1rv7z': {
      'en': 'gym racks',
      'ar': 'رفوف الصالة الرياضية',
    },
    'c71z0t0b': {
      'en': 'Welcome Back',
      'ar': 'مرحبًا بعودتك',
    },
    '7bi4q2h7': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'urg9df5a': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    '0897hwlm': {
      'en': 'Sign In',
      'ar': '',
    },
    'tbm7liex': {
      'en': 'forget password? ',
      'ar': 'نسيت كلمة المرور؟',
    },
    'gl9d4czg': {
      'en': 'click here',
      'ar': 'انقر هنا',
    },
    'biqq9jl4': {
      'en': 'change language/تغيير اللغة\n',
      'ar': 'تغيير اللغة/تغيير اللغة',
    },
    'j7e4p0xx': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // forget
  {
    'n684erlu': {
      'en': 'Back',
      'ar': 'خلف',
    },
    'qf86wpwn': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
    },
    '1wdck0hn': {
      'en':
          'We will send you an email with a link to reset your password, please enter the ID associated with your account below.',
      'ar':
          'سنرسل إليك بريدًا إلكترونيًا يحتوي على رابط لإعادة تعيين كلمة المرور الخاصة بك، يرجى إدخال المعرف المرتبط بحسابك أدناه.',
    },
    'wpilo1wk': {
      'en': 'Your ID....',
      'ar': 'هويتك....',
    },
    '4dum3rcq': {
      'en': 'Enter your ID...',
      'ar': 'أدخل المعرف...',
    },
    '9wcd9jc1': {
      'en': 'Send Link',
      'ar': 'أرسل الرابط',
    },
    'h3x2zw4b': {
      'en': 'Back',
      'ar': 'خلف',
    },
    'fic9ut71': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // homecoaches
  {
    'rgk54gqz': {
      'en': 'Welcome Coach!',
      'ar': 'مرحباً بالمدرب!',
    },
    'zb00c07m': {
      'en': 'Your upcoming sessions',
      'ar': 'جلساتك القادمة',
    },
    '6e3u2g96': {
      'en': 'View Schedule',
      'ar': 'عرض الجدول الزمني',
    },
    'zh07yheh': {
      'en': 'Notifications',
      'ar': '',
    },
    'l9kjybgm': {
      'en': 'New',
      'ar': '',
    },
    '1m4sy3xd': {
      'en': 'meeting at 7',
      'ar': '',
    },
    'bo7833ru': {
      'en': '3m ago',
      'ar': '',
    },
    '7foyd9yv': {
      'en': 'new client has been added',
      'ar': '',
    },
    '1tazd4f9': {
      'en': '3m ago',
      'ar': '',
    },
    'ylrj1rxx': {
      'en': 'new event is on the way',
      'ar': '',
    },
    'zz0gfbip': {
      'en': 'Sally Mandrus, viewed your product',
      'ar': '',
    },
    'ivks1t2i': {
      'en': '3m ago',
      'ar': '',
    },
    'f82bq1sh': {
      'en': 'All',
      'ar': '',
    },
    'if2ksw1z': {
      'en': 'New Product View',
      'ar': '',
    },
    'rawpen4f': {
      'en': 'Sally Mandrus, viewed your product',
      'ar': '',
    },
    'eoqhu33b': {
      'en': '3m ago',
      'ar': '',
    },
    '41vhc9t4': {
      'en': 'New Product View',
      'ar': '',
    },
    '5mjo7dza': {
      'en': 'Sally Mandrus, viewed your product',
      'ar': '',
    },
    'e1p295xj': {
      'en': '3m ago',
      'ar': '',
    },
    '2haatkb6': {
      'en': 'New Product View',
      'ar': '',
    },
    '3zel4bij': {
      'en': 'Sally Mandrus, viewed your product',
      'ar': '',
    },
    'hxvjpo8n': {
      'en': '3m ago',
      'ar': '',
    },
    '0z17w3tk': {
      'en': 'New Product View',
      'ar': '',
    },
    'geb0h9bd': {
      'en': 'Sally Mandrus, viewed your product',
      'ar': '',
    },
    'z0eoc44z': {
      'en': '3m ago',
      'ar': '',
    },
    'fr43vrsw': {
      'en': 'New Product View',
      'ar': '',
    },
    'kpxpnt9d': {
      'en': 'Sally Mandrus, viewed your product',
      'ar': '',
    },
    'obkrkrcs': {
      'en': '3m ago',
      'ar': '',
    },
    '5sc41087': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
    },
    'ytl6atf3': {
      'en': 'home',
      'ar': 'بيت',
    },
  },
  // Profilepage
  {
    '587vla5b': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
    'ehlqoqku': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
    },
    'gqgtuzbw': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
    },
    '9lfvsz3o': {
      'en': 'Log Out',
      'ar': 'تسجيل خروج',
    },
    '0hv4zuk5': {
      'en': '__',
      'ar': '__',
    },
  },
  // editprofile
  {
    'vbkrcla1': {
      'en': 'Your Name',
      'ar': 'اسمك',
    },
    'qs5lp4nj': {
      'en': 'Enter your email address',
      'ar': 'أدخل عنوان بريدك الالكتروني',
    },
    'mg25xsvq': {
      'en': 'Enter phone number',
      'ar': 'أدخل رقم الهاتف',
    },
    '615nmzz9': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
    '33cey4yk': {
      'en': 'edit profile',
      'ar': 'تعديل الملف الشخصي',
    },
  },
  // view1
  {
    'oskqeid9': {
      'en': 'gym clasess',
      'ar': '',
    },
  },
  // userview
  {
    'oxnfsie2': {
      'en': ' Information',
      'ar': '',
    },
    '2he747az': {
      'en': 'age',
      'ar': '',
    },
    'vtjckqdy': {
      'en': 'fate percantage',
      'ar': '',
    },
    'f3vhdq9c': {
      'en': 'weight',
      'ar': '',
    },
    '8gb4no2s': {
      'en': 'workout plan',
      'ar': '',
    },
    'fycrwja9': {
      'en': 'Profile',
      'ar': '',
    },
  },
  // workoutpla
  {
    '4vloxq6y': {
      'en': 'Monday: Chest & Back',
      'ar': '',
    },
    'v72479t7': {
      'en':
          '1-Bench Press - 4 sets of 8 reps\n2Pull-ups  3 sets of 10 reps\n3-Incline Dumbbell Press - 3 sets of 12 reps\n4-Bent-over Rows - 4 sets of 8 reps',
      'ar': '',
    },
    'fwvgpao8': {
      'en': 'Tuesday: Legs & Shoulders',
      'ar': '',
    },
    'sozgqpwh': {
      'en':
          '1-Squats - 4 sets of 10 reps\n2-Leg Press - 3 sets of 12 reps\n3-eg Curls - 3 sets of 15 reps\n4-Overhead Press - 4 sets of 8 reps',
      'ar': '',
    },
    '60c5fbln': {
      'en': 'Wednesday: Rest Day',
      'ar': '',
    },
    'tcagkx3c': {
      'en': 'Take a break, stretch, or do some light cardio.',
      'ar': '',
    },
    'eczpm6kz': {
      'en': 'Thursday: Arms & Abs',
      'ar': '',
    },
    'jwvoyzfs': {
      'en':
          '1-Bicep Curls - 3 sets of 10 reps\n2-Tricep Dips - 3 sets of 10 reps\n3-Crunches - 4 sets of 15 reps\\nPlank \n 4-3 sets of 60 seconds',
      'ar': '',
    },
    'pofn5737': {
      'en': 'Friday: Full Body',
      'ar': '',
    },
    'rf0o0x8o': {
      'en':
          '1-Deadlifts - 4 sets of 8 reps\n2-Push-ups - 4 sets of 12 reps\n3-Lunges - 3 sets of 10 reps per leg\n4-Lat Pulldowns - 3 sets of 10 reps',
      'ar': '',
    },
    'y7usyege': {
      'en': 'modify plan',
      'ar': '',
    },
    'qeudx814': {
      'en': 'Workout Details',
      'ar': '',
    },
  },
  // modifyplan
  {
    'p6pspvk1': {
      'en': 'Modify Plan',
      'ar': '',
    },
    'mucrb8xt': {
      'en': 'Adjust your workout plan to better fit your goals and schedule.',
      'ar': '',
    },
    '2icpityr': {
      'en': 'weight loss',
      'ar': '',
    },
    '0rkxs7a8': {
      'en': 'Fat-Burning  Fitness',
      'ar': '',
    },
    'rvd2cuc6': {
      'en': 'bodybulding Training',
      'ar': '',
    },
    'du4f18kd': {
      'en': 'healthy workout',
      'ar': '',
    },
    'w58g8f9y': {
      'en': 'please workout plan',
      'ar': '',
    },
    'z4p2tlri': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'unzmbbeb': {
      'en': '',
      'ar': '',
    },
    'xpbqa3xs': {
      'en': 'Beginner\'s Week: 3 days a week',
      'ar': '',
    },
    'gze2n2ie': {
      'en': 'Intermediate Intensity: 4 days a week\n',
      'ar': '',
    },
    'yyxk8gl0': {
      'en': 'Advanced Approach: 5 days a week\n',
      'ar': '',
    },
    'eh1xnchq': {
      'en': 'Please select days',
      'ar': '',
    },
    'voookctb': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'pbbm77mt': {
      'en': 'Update Plan',
      'ar': '',
    },
  },
  // List07UserSearch
  {
    'li3di0q5': {
      'en': 'Search for traniee',
      'ar': '',
    },
    '8y7c0uhf': {
      'en': 'Randie Mcmullens',
      'ar': '',
    },
    '82c00ehy': {
      'en': '(123) 456-7890',
      'ar': '',
    },
    '4duknxuh': {
      'en': 'name@domain.com',
      'ar': '',
    },
    'kw601xn9': {
      'en': 'Raney Bold',
      'ar': '',
    },
    'xsy64usb': {
      'en': '(123) 456-7890',
      'ar': '',
    },
    '4tazeb9c': {
      'en': 'name@domain.com',
      'ar': '',
    },
    '3j3dpjcv': {
      'en': 'Ragina Smith',
      'ar': '',
    },
    '0t6csdgv': {
      'en': '(123) 456-7890',
      'ar': '',
    },
    'r36waaxc': {
      'en': 'name@domain.com',
      'ar': '',
    },
    'ylw827ib': {
      'en': 'Ra Kuo',
      'ar': '',
    },
    '6d3axzid': {
      'en': '(123) 456-7890',
      'ar': '',
    },
    '7uvjnt8m': {
      'en': 'name@domain.com',
      'ar': '',
    },
    'h6w7j0gz': {
      'en': 'Raku Davis',
      'ar': '',
    },
    'jk6yzmjk': {
      'en': '(123) 456-7890',
      'ar': '',
    },
    '77cgp58b': {
      'en': 'name@domain.com',
      'ar': '',
    },
    'obt1r9fn': {
      'en': 'Search for traniee',
      'ar': '',
    },
    'srdsg2io': {
      'en': 'Home',
      'ar': '',
    },
  },
  // addexercies
  {
    '2lk62x8l': {
      'en': 'Add Exercise',
      'ar': '',
    },
    'rfjoacl4': {
      'en': 'Exercise Name',
      'ar': '',
    },
    '1pr59vek': {
      'en': 'Enter exercise name...',
      'ar': '',
    },
    '9cq1hrf8': {
      'en': 'excersice type plan',
      'ar': '',
    },
    '304tnf55': {
      'en': 'excersice type plan',
      'ar': '',
    },
    'w5tbulz5': {
      'en': 'Exercise url video\n',
      'ar': '',
    },
    'cupho9uz': {
      'en': 'Exercise url video\n',
      'ar': '',
    },
    'knvjn7zd': {
      'en': 'Add excercise',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    '1zhchouu': {
      'en': '',
      'ar': '',
    },
    'huke9ewu': {
      'en': '',
      'ar': '',
    },
    'my8asv09': {
      'en': '',
      'ar': '',
    },
    '9b9dq136': {
      'en': '',
      'ar': '',
    },
    'dvjw9fc7': {
      'en': '',
      'ar': '',
    },
    'miaczedh': {
      'en': '',
      'ar': '',
    },
    '5r3s727p': {
      'en': '',
      'ar': '',
    },
    'bfeu8e0m': {
      'en': '',
      'ar': '',
    },
    '2o98ayqb': {
      'en': '',
      'ar': '',
    },
    'qfmru4ri': {
      'en': '',
      'ar': '',
    },
    '2fg4uqgz': {
      'en': '',
      'ar': '',
    },
    '406sht3y': {
      'en': '',
      'ar': '',
    },
    'k0rjpsn1': {
      'en': '',
      'ar': '',
    },
    'c2mxpdmu': {
      'en': '',
      'ar': '',
    },
    '27ytbtvt': {
      'en': '',
      'ar': '',
    },
    'e6w9f86l': {
      'en': '',
      'ar': '',
    },
    'e386g2ws': {
      'en': '',
      'ar': '',
    },
    'sp160z5e': {
      'en': '',
      'ar': '',
    },
    'hvwrgato': {
      'en': '',
      'ar': '',
    },
    '99x40hzb': {
      'en': '',
      'ar': '',
    },
    'kdkfpv9q': {
      'en': '',
      'ar': '',
    },
    '5xriyejx': {
      'en': '',
      'ar': '',
    },
    'aklf1v1b': {
      'en': '',
      'ar': '',
    },
    'rp4g4dwm': {
      'en': '',
      'ar': '',
    },
    'q36njdqp': {
      'en': '',
      'ar': '',
    },
    '7pnhx2vd': {
      'en': '',
      'ar': '',
    },
    '4yrmk042': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
