import 'package:flutter/material.dart';
import 'package:habit_tracker/data/enums.dart';

sealed class HabitEditingState {}

class InitialState extends HabitEditingState {}

class DataInit extends HabitEditingState {
  final HabitRegularity? habitRegularity;
  final HabitRepeat? repeatType;
  final List<DayNames>? days;
  final RunDayTime? runTime;
  final String? name;
  final String? icon;
  final Color? color;

  DataInit(
      {required this.habitRegularity,
      required this.repeatType,
      required this.days,
      required this.runTime,
      required this.name,
      required this.icon,
      required this.color});
}

class NameChanged extends HabitEditingState {
  final String name;

  NameChanged({required this.name});
}

class IconChanged extends HabitEditingState {
  final String icon;

  IconChanged({required this.icon});
}

class EmojiPickerOpened extends HabitEditingState {}

class ColorChnaged extends HabitEditingState {
  final Color color;

  ColorChnaged({required this.color});
}

class ColorPickerOpened extends HabitEditingState {}

class RepeatChanged extends HabitEditingState {
  final HabitRepeat repeat;

  RepeatChanged({required this.repeat});
}

class RepeatDaysChanged extends HabitEditingState {
  final List<DayNames> days;

  RepeatDaysChanged({required this.days});
}

class RegularityChanged extends HabitEditingState {
  final HabitRegularity regularity;

  RegularityChanged({required this.regularity});
}

class RunDayTimeChanged extends HabitEditingState {
  final RunDayTime dayTime;

  RunDayTimeChanged({required this.dayTime});
}

class ChangesSaved extends HabitEditingState {}
