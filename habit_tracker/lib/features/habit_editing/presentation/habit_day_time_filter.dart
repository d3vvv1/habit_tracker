import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/data/enums.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_bloc.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_event.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_state.dart';

class HabitDayTimeFilter extends StatefulWidget {
  const HabitDayTimeFilter({super.key});

  @override
  State<HabitDayTimeFilter> createState() => _HabitDayTimeFilterState();
}

class _HabitDayTimeFilterState extends State<HabitDayTimeFilter> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitEditingBloc, HabitEditingState>(
      buildWhen: (previous, current) =>
          current is RunDayTimeChanged || current is DataInit,
      builder: (context, state) {
        RunDayTime? dayTime;
        if (state is DataInit) {
          dayTime = state.runTime;
        }
        if (state is RunDayTimeChanged) {
          dayTime = state.dayTime;
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppWords.of(context).doItAt,
                style: context.appText.header3,
              ),
            ),
            SizedBox(
              height: Adaptive.getHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: RunDayTime.values.map(
                (RunDayTime type) {
                  String label = '';
                  switch (type) {
                    case RunDayTime.morning:
                      label = AppWords.of(context).morning;
                    case RunDayTime.afternoon:
                      label = AppWords.of(context).afternoon;
                    case RunDayTime.evening:
                      label = AppWords.of(context).evening;
                  }
                  return FilterChip(
                      label: SizedBox(
                        height: Adaptive.getHeight(30),
                        width: Adaptive.getWidth(80),
                        child: Center(
                          child: Text(
                            label,
                            style: dayTime == type
                                ? context.appText.header3
                                    .copyWith(color: Colors.white)
                                : context.appText.header3,
                          ),
                        ),
                      ),
                      selectedColor: context.appColors.base1,
                      showCheckmark: false,
                      backgroundColor: context.appColors.base2,
                      side: BorderSide(
                        width: Adaptive.getByMin(2),
                        color: context.appColors.base3,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      selected: dayTime == type,
                      onSelected: (bool selected) {
                        if (selected) {
                          context.read<HabitEditingBloc>().add(
                                SetHabitTime(dayTimeType: type),
                              );
                        }
                      });
                },
              ).toList(),
            ),
          ],
        );
      },
    );
  }
}
