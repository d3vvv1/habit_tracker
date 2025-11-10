import 'package:flutter/material.dart';

class HabitBasic {
  final String? name;
  final String? icon;
  final Color? color;
  final int id;

  HabitBasic({
    required this.name,
    required this.icon,
    required this.color,
    required this.id,
  });

  HabitBasic copyWith({
    String? name,
    String? icon,
    Color? color,
  }) {
    return HabitBasic(
      name: name ?? this.name,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      id: id,
    );
  }
}
