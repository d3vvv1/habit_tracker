// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get letsGetStarted => 'Давайте начнем!';

  @override
  String get letsDiveInIntoYourAccount => 'Давайте войдем в ваш аккаунт';

  @override
  String get continueWithGoogle => 'Продолжить с Google';

  @override
  String get continueWithApple => 'Продолжить с Apple';

  @override
  String get continueWithFacebook => 'Продолжить с Facebook';

  @override
  String get continueWithTwitter => 'Продолжить с Twitter';

  @override
  String get signUp => 'Зарегистрироваться';

  @override
  String get signIn => 'Войти';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get termsOfService => 'Условия использования';

  @override
  String get createNewHabit => 'Создать новую привычку';

  @override
  String get regularHabit => 'Обычная привычка';

  @override
  String get oneTimeTask => 'Одноразовая задача';

  @override
  String get habitName => 'Название привычки';

  @override
  String get studyArt => 'Изучать искусство';

  @override
  String get icon => 'Иконка';

  @override
  String get color => 'Цвет';

  @override
  String get repeat => 'Повторять';

  @override
  String get daily => 'Ежедневно';

  @override
  String get weekly => 'Еженедельно';

  @override
  String get monthly => 'Ежемесячно';

  @override
  String get everyMonthOn => 'Каждый месяц в';

  @override
  String get doItAt => 'Выполнять в:';

  @override
  String get morning => 'Утро';

  @override
  String get afternoon => 'День';

  @override
  String get evening => 'Вечер';

  @override
  String get endHabitOn => 'Завершить привычку';

  @override
  String get save => 'Сохранить';

  @override
  String get report => 'Отчет';

  @override
  String nDays(int days) {
    return '$days дней';
  }

  @override
  String get streak => 'Серия';

  @override
  String get completionRate => 'Процент выполнения';

  @override
  String get totalHabitsCompleted => 'Всего выполнено привычек';

  @override
  String get totalHabitsCompletedThisWeek =>
      'Всего выполнено привычек на этой неделе';

  @override
  String get habitsCompleted => 'Выполненные привычки';

  @override
  String get thisWeek => 'На этой неделе';

  @override
  String get habitCompletionRate => 'Процент выполнения привычек';

  @override
  String get last6Months => 'Последние 6 месяцев';

  @override
  String get calendarStats => 'Статистика календаря';

  @override
  String get thisMonth => 'Этот месяц';

  @override
  String get moodChart => 'График настроения';
}
