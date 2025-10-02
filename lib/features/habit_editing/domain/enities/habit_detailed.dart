import 'package:flutter/material.dart';
import 'package:habit_tracker/data/enums.dart';
import 'package:habit_tracker/data/habit_basic_data.dart';

class HabitDetailed extends HabitBasic {
  final HabitRegularity? habitRegularity;
  final HabitRepeat? repeatType;
  final List<DayNames>? days;
  final RunDayTime? runTime;

  HabitDetailed({
    required this.habitRegularity,
    required this.repeatType,
    required this.runTime,
    required this.days,
    required super.id,
    required super.name,
    required super.icon,
    required super.color,
  });

  HabitDetailed.fromBasic({
    required HabitBasic basicHabit,
    required this.habitRegularity,
    required this.repeatType,
    required this.runTime,
    required this.days,
  }) : super(
            color: basicHabit.color,
            id: basicHabit.id,
            name: basicHabit.name,
            icon: basicHabit.icon);

  @override
  HabitDetailed copyWith({
    HabitRegularity? habitRegularity,
    HabitRepeat? repeatType,
    List<DayNames>? days,
    RunDayTime? runTime,
    String? name,
    String? icon,
    Color? color,
  }) {
    return HabitDetailed(
      habitRegularity: habitRegularity ?? this.habitRegularity,
      repeatType: repeatType ?? this.repeatType,
      runTime: runTime ?? this.runTime,
      name: name ?? super.name,
      icon: icon ?? super.icon,
      color: color ?? super.color,
      days: days ?? this.days,
      id: id,
    );
  }
}
