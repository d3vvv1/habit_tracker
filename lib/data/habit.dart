import 'package:flutter/material.dart';

class Habit {
  final String name;
  final Image icon;
  final Color color;
  final HabitType habittype;
  final RepeatType repeatType;
  final DoTime doTime;
  //TODO: Добавить дни когда надо делать
  //TODO: Добавить дни когда сделано
  Habit(
      {required this.name,
      required this.icon,
      required this.color,
      required this.habittype,
      required this.repeatType,
      required this.doTime});
}

enum HabitType {
  regularHabit,
  oneTimeTask,
}

enum RepeatType {
  daily,
  weekly,
  monthly,
}

enum DoTime {
  morning,
  afternoon,
  evening,
}
