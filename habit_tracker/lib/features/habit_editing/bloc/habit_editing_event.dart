import 'package:flutter/material.dart';
import 'package:habit_tracker/data/enums.dart';

sealed class HabitEditingEvent {}

class Init extends HabitEditingEvent {}

class SetRegularity extends HabitEditingEvent {
  final HabitRegularity regulatity;

  SetRegularity({required this.regulatity});
}

class SetName extends HabitEditingEvent {
  final String name;

  SetName({required this.name});
}

class SetIcon extends HabitEditingEvent {
  final String icon;

  SetIcon({required this.icon});
}

class OpenEmojiPicker extends HabitEditingEvent {}

class SetColor extends HabitEditingEvent {
  final Color color;

  SetColor({required this.color});
}

class OpenColorPicker extends HabitEditingEvent {}

class SetRepeat extends HabitEditingEvent {
  final HabitRepeat repeat;

  SetRepeat({required this.repeat});
}

class SetDayForRepeat extends HabitEditingEvent {
  final List<DayNames> days;

  SetDayForRepeat({required this.days});
}

class SetHabitTime extends HabitEditingEvent {
  final RunDayTime dayTimeType;

  SetHabitTime({required this.dayTimeType});
}

class SaveChanges extends HabitEditingEvent {}
