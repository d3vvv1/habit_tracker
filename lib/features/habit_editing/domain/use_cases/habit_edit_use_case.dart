import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker/data/enums.dart';
import 'package:habit_tracker/data/habit_basic_data.dart';
import 'package:habit_tracker/features/habit_editing/domain/enities/habit_detailed.dart';
import 'package:habit_tracker/features/habits_check/domain/repositories/habit_repository_interface.dart';

class EditHabitUseCase {
  HabitDetailed? habit;

  EditHabitUseCase() {
    if (GetIt.instance<HabitRepositoryInterface>().currentHabit == null) {
      habit = HabitDetailed(
        habitRegularity: null,
        repeatType: null,
        runTime: null,
        days: [],
        id: GetIt.instance<HabitRepositoryInterface>().idForNewHabit,
        name: null,
        icon: null,
        color: null,
      );
    } else {
      habit = HabitDetailed.fromBasic(
        basicHabit: GetIt.instance<HabitRepositoryInterface>().currentHabit!,
        habitRegularity: null,
        repeatType: null,
        runTime: null,
        days: [],
      );
    }
  }

  void changeName(String name) {
    habit = habit?.copyWith(name: name);
  }

  void changeColor(Color color) {
    habit = habit?.copyWith(color: color);
  }

  void changeDays(List<DayNames> newDays) {
    habit = habit?.copyWith(days: newDays);
  }

  void changeRunTime(RunDayTime newRunTime) {
    habit = habit?.copyWith(runTime: newRunTime);
  }

  void changeIcon(String newIcon) {
    habit = habit?.copyWith(icon: newIcon);
  }

  void changeRepeat(HabitRepeat repeat) {
    habit = habit?.copyWith(repeatType: repeat);
  }

  void changeRegularity(HabitRegularity regularity) {
    habit = habit?.copyWith(habitRegularity: regularity);
  }

  void saveHabit() {
    if (habit != null) {
      GetIt.instance<HabitRepositoryInterface>().addNewHabit(
        HabitBasic(
          name: habit!.name,
          icon: habit!.icon,
          color: habit!.color,
          id: habit!.id,
        ),
      );
    }
  }
}
