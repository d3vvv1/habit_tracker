import 'package:habit_tracker/data/enums.dart';
import 'package:habit_tracker/features/habits_check/data/habit_basic_data.dart';

class Habit extends BasicHabit {
  final HabitRegularity habitRegularity;
  final HabitRepetition repeatType;
  final RunTime runTime;
  final bool isDone;
  //TODO: Добавить дни когда надо делать
  //TODO: Добавить дни когда сделано
  Habit({
    required this.habitRegularity,
    required this.repeatType,
    required this.runTime,
    required this.isDone,
    required super.name,
    required super.icon,
    required super.color,
  });
}
