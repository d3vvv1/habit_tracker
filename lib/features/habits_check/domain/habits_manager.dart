import 'package:habit_tracker/data/habit.dart';

class HabitsManager {
  final List<Habit> unCompletedHabits = List.empty(growable: true);
  final List<Habit> completedHabits = List.empty(growable: true);
}
