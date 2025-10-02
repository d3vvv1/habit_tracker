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

  /// No description provided for @viewAll.
  ///
  /// In ru, this message translates to:
  /// **'Посмотреть все'**
  String get viewAll;

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

  /// No description provided for @onTheseDay.
  ///
  /// In ru, this message translates to:
  /// **'В эти дни:'**
  String get onTheseDay;

  /// No description provided for @monday.
  ///
  /// In ru, this message translates to:
  /// **'Понедельник'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In ru, this message translates to:
  /// **'Вторник'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In ru, this message translates to:
  /// **'Среда'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In ru, this message translates to:
  /// **'Четверг'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In ru, this message translates to:
  /// **'Пятница'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In ru, this message translates to:
  /// **'Суббота'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In ru, this message translates to:
  /// **'Воскресенье'**
  String get sunday;

  /// No description provided for @fullName.
  ///
  /// In ru, this message translates to:
  /// **'Полное имя'**
  String get fullName;

  /// No description provided for @gender.
  ///
  /// In ru, this message translates to:
  /// **'Пол'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In ru, this message translates to:
  /// **'Мужчина'**
  String get male;

  /// No description provided for @female.
  ///
  /// In ru, this message translates to:
  /// **'Женщина'**
  String get female;

  /// No description provided for @birthDate.
  ///
  /// In ru, this message translates to:
  /// **'Дата рождения'**
  String get birthDate;

  /// No description provided for @appAppearance.
  ///
  /// In ru, this message translates to:
  /// **'Внешний вид приложения'**
  String get appAppearance;

  /// No description provided for @appLanguage.
  ///
  /// In ru, this message translates to:
  /// **'Язык приложения'**
  String get appLanguage;

  /// No description provided for @selectLanguage.
  ///
  /// In ru, this message translates to:
  /// **'Выберите язык'**
  String get selectLanguage;

  /// No description provided for @english.
  ///
  /// In ru, this message translates to:
  /// **'Английский'**
  String get english;

  /// No description provided for @russian.
  ///
  /// In ru, this message translates to:
  /// **'Русский'**
  String get russian;

  /// No description provided for @theme.
  ///
  /// In ru, this message translates to:
  /// **'Тема'**
  String get theme;

  /// No description provided for @light.
  ///
  /// In ru, this message translates to:
  /// **'Светлая'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In ru, this message translates to:
  /// **'Темная'**
  String get dark;

  /// No description provided for @chooseTheme.
  ///
  /// In ru, this message translates to:
  /// **'Выберите тему'**
  String get chooseTheme;

  /// No description provided for @systemDefault.
  ///
  /// In ru, this message translates to:
  /// **'Системная'**
  String get systemDefault;

  /// No description provided for @profile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profile;

  /// No description provided for @logout.
  ///
  /// In ru, this message translates to:
  /// **'Выйти из аккаунта'**
  String get logout;

  /// No description provided for @logoutWarning.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите выйти?'**
  String get logoutWarning;

  /// No description provided for @yesLogout.
  ///
  /// In ru, this message translates to:
  /// **'Да, выйти'**
  String get yesLogout;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancel;

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

  /// No description provided for @home.
  ///
  /// In ru, this message translates to:
  /// **'Домой'**
  String get home;

  /// No description provided for @account.
  ///
  /// In ru, this message translates to:
  /// **'Аккаунт'**
  String get account;

  /// No description provided for @email.
  ///
  /// In ru, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @moodChart.
  ///
  /// In ru, this message translates to:
  /// **'График настроения'**
  String get moodChart;

  /// No description provided for @welcomeBack.
  ///
  /// In ru, this message translates to:
  /// **'С возвращением!'**
  String get welcomeBack;

  /// No description provided for @signInText.
  ///
  /// In ru, this message translates to:
  /// **'Войдите, чтобы получить доступ к вашему персонализированному опыту отслеживания привычек.'**
  String get signInText;

  /// No description provided for @emailFull.
  ///
  /// In ru, this message translates to:
  /// **'Электронная почта'**
  String get emailFull;

  /// No description provided for @password.
  ///
  /// In ru, this message translates to:
  /// **'Пароль'**
  String get password;

  /// No description provided for @rememberMe.
  ///
  /// In ru, this message translates to:
  /// **'Запомнить меня'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In ru, this message translates to:
  /// **'Забыли пароль?'**
  String get forgotPassword;

  /// No description provided for @joinToday.
  ///
  /// In ru, this message translates to:
  /// **'Присоединяйтесь к нам сегодня'**
  String get joinToday;

  /// No description provided for @signUpMessage.
  ///
  /// In ru, this message translates to:
  /// **'Начните отслеживать свои привычки сегодня. Это быстро, просто и бесплатно!'**
  String get signUpMessage;

  /// No description provided for @termsAndConditions.
  ///
  /// In ru, this message translates to:
  /// **'Я согласен с Условиями и положениями.'**
  String get termsAndConditions;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In ru, this message translates to:
  /// **'Уже есть аккаунт?'**
  String get alreadyHaveAccount;

  /// No description provided for @error.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка!'**
  String get error;

  /// No description provided for @inCorrectPassword.
  ///
  /// In ru, this message translates to:
  /// **'Неправильный пароль! Пароль должен состоять минимум из 8 символов'**
  String get inCorrectPassword;

  /// No description provided for @inCorrectEmail.
  ///
  /// In ru, this message translates to:
  /// **'Неправильный email! Попробуйте еще раз'**
  String get inCorrectEmail;

  /// No description provided for @completed.
  ///
  /// In ru, this message translates to:
  /// **'Выполнено'**
  String get completed;

  /// No description provided for @complete.
  ///
  /// In ru, this message translates to:
  /// **'Выполнить'**
  String get complete;

  /// No description provided for @editHabit.
  ///
  /// In ru, this message translates to:
  /// **'Редактирование привычки'**
  String get editHabit;
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
