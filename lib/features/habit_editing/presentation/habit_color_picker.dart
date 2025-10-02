import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_bloc.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_event.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_state.dart';
import 'package:habit_tracker/features/habit_editing/presentation/color_picker_button.dart';
import 'package:habit_tracker/features/habit_editing/presentation/color_picker_dialog.dart';

class HabitColorPicker extends StatefulWidget {
  const HabitColorPicker({super.key});

  @override
  State<HabitColorPicker> createState() => _HabitColorPickerState();
}

class _HabitColorPickerState extends State<HabitColorPicker> {
  List<Color> colors = [
    Colors.pink,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.lime,
    Colors.red,
    Colors.blueGrey,
    Colors.purpleAccent,
    Colors.tealAccent,
    Colors.limeAccent,
    Colors.deepPurple,
    Colors.purple.shade200,
    Colors.deepOrangeAccent,
    Colors.amberAccent,
    Colors.transparent,
  ];

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HabitEditingBloc>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppWords.of(context).color,
            style: context.appText.header3,
          ),
        ),
        SizedBox(
          height: Adaptive.getHeight(20),
        ),
        BlocConsumer<HabitEditingBloc, HabitEditingState>(
          listenWhen: (previous, current) =>
              current is ColorChnaged || current is ColorPickerOpened,
          listener: (context, state) {
            if (state is ColorPickerOpened) {
              showDialog(
                  context: context,
                  builder: (context) => ColorPickerDialog(bloc: bloc));
            }
          },
          builder: (context, state) {
            Color? selectedColor;
            if (state is ColorChnaged) {
              if (colors.contains(state.color)) {
                colors.remove(state.color);
                colors.insert(0, state.color);
              } else {
                colors[0] = state.color;
              }
              selectedColor = state.color;
            }
            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: Adaptive.getHeight(10),
              crossAxisSpacing: Adaptive.getWidth(10),
              crossAxisCount: 5,
              children: colors.map((Color color) {
                if (color == Colors.transparent) {
                  return const ColorPickerButton();
                } else {
                  return GestureDetector(
                    onTap: () {
                      bloc.add(SetColor(color: color));
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                      child: selectedColor == color
                          ? Padding(
                              padding: EdgeInsets.all(Adaptive.getByMin(10)),
                              child: const FittedBox(
                                fit: BoxFit.contain,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          : null,
                    ),
                  );
                }
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
