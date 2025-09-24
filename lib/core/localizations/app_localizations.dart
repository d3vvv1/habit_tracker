import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localizations/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @letsGetStarted.
  ///
  /// In ru, this message translates to:
  /// **'Давайте начнем!'**
  String get letsGetStarted;

  /// No description provided for @letsDiveInIntoYourAccount.
  ///
  /// In ru, this message translates to:
  /// **'Давайте войдем в ваш аккаунт'**
  String get letsDiveInIntoYourAccount;

  /// No description provided for @continueWithGoogle.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить с Google'**
  String get continueWithGoogle;

  /// No description provided for @continueWithApple.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить с Apple'**
  String get continueWithApple;

  /// No description provided for @continueWithFacebook.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить с Facebook'**
  String get continueWithFacebook;

  /// No description provided for @continueWithTwitter.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить с Twitter'**
  String get continueWithTwitter;

  /// No description provided for @signUp.
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрироваться'**
  String get signUp;

  /// No description provided for @signIn.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get signIn;

  /// No description provided for @privacyPolicy.
  ///
  /// In ru, this message translates to:
  /// **'Политика конфиденциальности'**
  String get privacyPolicy;

  /// No description provided for @termsOfService.
  ///
  /// In ru, this message translates to:
  /// **'Условия использования'**
  String get termsOfService;

  /// No description provided for @createNewHabit.
  ///
  /// In ru, this message translates to:
  /// **'Создать новую привычку'**
  String get createNewHabit;

  /// No description provided for @regularHabit.
  ///
  /// In ru, this message translates to:
  /// **'Обычная привычка'**
  String get regularHabit;

  /// No description provided for @oneTimeTask.
  ///
  /// In ru, this message translates to:
  /// **'Одноразовая задача'**
  String get oneTimeTask;

  /// No description provided for @habitName.
  ///
  /// In ru, this message translates to:
  /// **'Название привычки'**
  String get habitName;

  /// No description provided for @studyArt.
  ///
  /// In ru, this message translates to:
  /// **'Изучать искусство'**
  String get studyArt;

  /// No description provided for @icon.
  ///
  /// In ru, this message translates to:
  /// **'Иконка'**
  String get icon;

  /// No description provided for @color.
  ///
  /// In ru, this message translates to:
  /// **'Цвет'**
  String get color;

  /// No description provided for @repeat.
  ///
  /// In ru, this message translates to:
  /// **'Повторять'**
  String get repeat;

  /// No description provided for @daily.
  ///
  /// In ru, this message translates to:
  /// **'Ежедневно'**
  String get daily;

  /// No description provided for @weekly.
  ///
  /// In ru, this message translates to:
  /// **'Еженедельно'**
  String get weekly;

  /// No description provided for @monthly.
  ///
  /// In ru, this message translates to:
  /// **'Ежемесячно'**
  String get monthly;

  /// No description provided for @everyMonthOn.
  ///
  /// In ru, this message translates to:
  /// **'Каждый месяц в'**
  String get everyMonthOn;

  /// No description provided for @doItAt.
  ///
  /// In ru, this message translates to:
  /// **'Выполнять в:'**
  String get doItAt;

  /// No description provided for @morning.
  ///
  /// In ru, this message translates to:
  /// **'Утро'**
  String get morning;

  /// No description provided for @afternoon.
  ///
  /// In ru, this message translates to:
  /// **'День'**
  String get afternoon;

  /// No description provided for @evening.
  ///
  /// In ru, this message translates to:
  /// **'Вечер'**
  String get evening;

  /// No description provided for @endHabitOn.
  ///
  /// In ru, this message translates to:
  /// **'Завершить привычку'**
  String get endHabitOn;

  /// No description provided for @save.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get save;

  /// No description provided for @report.
  ///
  /// In ru, this message translates to:
  /// **'Отчет'**
  String get report;

  /// wordForm
  ///
  /// In ru, this message translates to:
  /// **'{days} дней'**
  String nDays(int days);

  /// No description provided for @streak.
  ///
  /// In ru, this message translates to:
  /// **'Серия'**
  String get streak;

  /// No description provided for @completionRate.
  ///
  /// In ru, this message translates to:
  /// **'Процент выполнения'**
  String get completionRate;

  /// No description provided for @totalHabitsCompleted.
  ///
  /// In ru, this message translates to:
  /// **'Всего выполнено привычек'**
  String get totalHabitsCompleted;

  /// No description provided for @totalHabitsCompletedThisWeek.
  ///
  /// In ru, this message translates to:
  /// **'Всего выполнено привычек на этой неделе'**
  String get totalHabitsCompletedThisWeek;

  /// No description provided for @habitsCompleted.
  ///
  /// In ru, this message translates to:
  /// **'Выполненные привычки'**
  String get habitsCompleted;

  /// No description provided for @thisWeek.
  ///
  /// In ru, this message translates to:
  /// **'На этой неделе'**
  String get thisWeek;

  /// No description provided for @habitCompletionRate.
  ///
  /// In ru, this message translates to:
  /// **'Процент выполнения привычек'**
  String get habitCompletionRate;

  /// No description provided for @last6Months.
  ///
  /// In ru, this message translates to:
  /// **'Последние 6 месяцев'**
  String get last6Months;

  /// No description provided for @calendarStats.
  ///
  /// In ru, this message translates to:
  /// **'Статистика календаря'**
  String get calendarStats;

  /// No description provided for @thisMonth.
  ///
  /// In ru, this message translates to:
  /// **'Этот месяц'**
  String get thisMonth;

  /// No description provided for @moodChart.
  ///
  /// In ru, this message translates to:
  /// **'График настроения'**
  String get moodChart;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
