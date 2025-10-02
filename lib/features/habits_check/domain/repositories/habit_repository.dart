import 'package:flutter/material.dart';
import 'package:habit_tracker/data/habit_basic_data.dart';
import 'package:habit_tracker/features/habits_check/domain/repositories/habit_repository_interface.dart';

class HabitRepository implements HabitRepositoryInterface {
  final List<HabitBasic> _userHabits = List.empty(growable: true);
  final List<HabitBasic> _completedHabits = List.empty(growable: true);
  final List<HabitBasic> _unCompletedHabits = List.empty(growable: true);
  HabitBasic? _selectedHabit;
  ValueNotifier<bool> haveChanges = ValueNotifier(false);

  @override
  void completeHabit(int id) {
    for (var habit in _userHabits) {
      if (habit.id == id) {
        completedHabits.add(habit);
        unCompletedHabits.remove(habit);
      }
    }
  }

  @override
  List<HabitBasic> get completedHabits => _completedHabits;

  @override
  HabitBasic? get currentHabit => _selectedHabit; //TODO: Поправить

  @override
  Future<void> init() async {
    // TODO: get habits from database or local
  }

  @override
  List<HabitBasic> get unCompletedHabits => _unCompletedHabits;

  @override
  void selectCurrentHabit(int? id) {
    for (var habit in _userHabits) {
      if (habit.id == id) {
        _selectedHabit = habit;
        return;
      }
    }
    _selectedHabit = null;
  }

  @override
  int get idForNewHabit => _userHabits.last.id + 1;

  @override
  void addNewHabit(HabitBasic habit) {
    _userHabits.add(habit);
    _unCompletedHabits.add(habit);
  }

  @override
  // TODO: REMOVE KOSTYL
  ValueNotifier get valueNotifier => haveChanges;
}
