import 'package:flutter/material.dart';
import 'package:habit_tracker/features/habits_check/data/habit_basic_data.dart';

class HabitsMockdata {
  List<BasicHabit> unCompletedHabits = [
    BasicHabit(
        name: 'Читать книгу', icon: Icons.book, color: Colors.brown.shade200),
    BasicHabit(
        name: 'Медитировать',
        icon: Icons.medication,
        color: Colors.grey.shade300),
    BasicHabit(
        name: 'Выпивать стакан воды утром',
        icon: Icons.local_drink,
        color: Colors.blueGrey.shade100),
    BasicHabit(
        name: 'Делать зарядку',
        icon: Icons.fitness_center,
        color: Colors.lightBlue.shade100),
    BasicHabit(
        name: 'Отдыхать перед сном',
        icon: Icons.nightlight_round,
        color: Colors.deepPurpleAccent.shade100),
  ];
  List<BasicHabit> completedHabits = [
    BasicHabit(
        name: 'Ходить пешком',
        icon: Icons.directions_walk,
        color: Colors.green.shade100),
    BasicHabit(
        name: 'Заправлять кровать',
        icon: Icons.bedroom_child,
        color: Colors.pink.shade100),
    BasicHabit(
        name: 'Учить иностранный язык',
        icon: Icons.translate,
        color: Colors.indigo.shade100),
    BasicHabit(
        name: 'Размышлять', icon: Icons.person, color: Colors.amber.shade100),
    BasicHabit(
        name: 'Собирать рабочий стол',
        icon: Icons.clean_hands,
        color: Colors.teal.shade100),
  ];
}
