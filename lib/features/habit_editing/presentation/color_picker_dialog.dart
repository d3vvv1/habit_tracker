import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_bloc.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_event.dart';

class ColorPickerDialog extends StatelessWidget {
  final HabitEditingBloc bloc;
  const ColorPickerDialog({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: context.appColors.base3,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        child: SizedBox(
          height: Adaptive.getHeight(500),
          child: Center(
            child: ColorPicker(
              pickerColor: context.appColors.base4,
              onColorChanged: (selectedColor) {
                bloc.add(SetColor(color: selectedColor));
              },
              labelTypes: const [],
              pickerAreaBorderRadius: BorderRadius.circular(8),
              paletteType: PaletteType.hueWheel,
              colorPickerWidth: Adaptive.getWidth(300),
            ),
          ),
        ));
  }
}
