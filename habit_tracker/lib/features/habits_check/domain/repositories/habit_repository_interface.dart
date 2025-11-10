import 'package:flutter/widgets.dart';
import 'package:habit_tracker/data/habit_basic_data.dart';

abstract class HabitRepositoryInterface {
  HabitBasic? get currentHabit;
  void completeHabit(int id);
  List<HabitBasic> get unCompletedHabits;
  List<HabitBasic> get completedHabits;
  Future<void> init();
  void selectCurrentHabit(int? id);
  int get idForNewHabit;
  void addNewHabit(HabitBasic habit);
  ValueNotifier get valueNotifier;
}
