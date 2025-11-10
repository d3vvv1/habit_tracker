import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_bloc.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_event.dart';

class ColorPickerButton extends StatefulWidget {
  const ColorPickerButton({super.key});

  @override
  State<ColorPickerButton> createState() => _ColorPickerButtonState();
}

class _ColorPickerButtonState extends State<ColorPickerButton> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
          gradient: SweepGradient(
            startAngle: 0,
            endAngle: math.pi * 2,
            colors: [
              Colors.red,
              Colors.orange,
              Colors.yellow,
              Colors.green,
              Colors.blue,
              Colors.indigo,
              Colors.purple,
            ],
            center: Alignment.center,
          ),
          shape: BoxShape.circle,
        ),
        child: TextButton(
          style:
              const ButtonStyle(shape: WidgetStatePropertyAll(CircleBorder())),
          onPressed: () =>
              context.read<HabitEditingBloc>().add(OpenColorPicker()),
          child: const SizedBox.shrink(),
        ));
  }
}
