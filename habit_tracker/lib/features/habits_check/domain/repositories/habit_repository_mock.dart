import 'package:flutter/material.dart';
import 'package:habit_tracker/data/habit_basic_data.dart';
import 'package:habit_tracker/data/habits_mockdata.dart';
import 'package:habit_tracker/features/habits_check/domain/repositories/habit_repository_interface.dart';

class HabitRepositoryMock implements HabitRepositoryInterface {
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
        haveChanges.value = !haveChanges.value;
      }
    }
  }

  @override
  List<HabitBasic> get completedHabits => _completedHabits;

  @override
  HabitBasic? get currentHabit => _selectedHabit;

  @override
  Future<void> init() async {
    _userHabits.clear();
    _unCompletedHabits.clear();
    _completedHabits.clear();
    for (var habit in HabitsMockdata.habits) {
      _userHabits.add(habit);
    }
    for (var habit in _userHabits) {
      if (habit.id < 5) {
        _unCompletedHabits.add(habit);
      } else {
        _completedHabits.add(habit);
      }
    }
    await Future.delayed(
      const Duration(seconds: 1),
    );
  }

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
  List<HabitBasic> get unCompletedHabits => _unCompletedHabits;

  @override
  int get idForNewHabit => _userHabits.last.id + 1;

  @override
  void addNewHabit(HabitBasic habit) {
    for (var userHabit in _userHabits) {
      if (userHabit.id == habit.id) {
        userHabit = habit;
        haveChanges.value = !haveChanges.value;
        return;
      }
    }
    _userHabits.add(habit);
    _unCompletedHabits.add(habit);
    haveChanges.value = !haveChanges.value;
  }

  @override
  // TODO: REMOVE KOSTYL
  ValueNotifier get valueNotifier => haveChanges;
}
