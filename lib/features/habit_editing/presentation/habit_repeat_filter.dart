import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/data/enums.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_bloc.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_event.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_state.dart';
import 'package:habit_tracker/features/habit_editing/presentation/days_selector.dart';

class HabitRepeatFilter extends StatelessWidget {
  const HabitRepeatFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitEditingBloc, HabitEditingState>(
      buildWhen: (previous, current) =>
          current is RepeatChanged || current is DataInit,
      builder: (context, state) {
        HabitRepeat? repeat;
        if (state is DataInit) {
          repeat = state.repeatType;
        }
        if (state is RepeatChanged) {
          repeat = state.repeat;
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppWords.of(context).repeat,
                style: context.appText.header3,
              ),
            ),
            SizedBox(
              height: Adaptive.getHeight(20),
            ),
            SizedBox(
              width: double.infinity,
              // height: Adaptive.getHeight(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: HabitRepeat.values.map(
                  (HabitRepeat type) {
                    String label = '';
                    switch (type) {
                      case HabitRepeat.daily:
                        label = AppWords.of(context).daily;
                      case HabitRepeat.weekly:
                        label = AppWords.of(context).weekly;
                      case HabitRepeat.monthly:
                        label = AppWords.of(context).monthly;
                    }
                    return FilterChip(
                        label: SizedBox(
                          height: Adaptive.getHeight(30),
                          width: Adaptive.getWidth(105),
                          child: Center(
                            child: Text(
                              label,
                              style: repeat == type
                                  ? context.appText.header4.copyWith(
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1))
                                  : context.appText.header4,
                            ),
                          ),
                        ),
                        selectedColor: context.appColors.base1,
                        showCheckmark: false,
                        backgroundColor: context.appColors.base2,
                        labelPadding: EdgeInsets.zero,
                        side: BorderSide(
                          width: Adaptive.getByMin(2),
                          color: context.appColors.base3,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        selected: repeat == type,
                        onSelected: (bool selected) {
                          if (selected) {
                            context
                                .read<HabitEditingBloc>()
                                .add(SetRepeat(repeat: type));
                          }
                        });
                  },
                ).toList(),
              ),
            ),
            if (repeat == HabitRepeat.daily) ...[
              SizedBox(
                height: Adaptive.getHeight(30),
              ),
              const DaysSelector(),
            ],
          ],
        );
      },
    );
  }
}
