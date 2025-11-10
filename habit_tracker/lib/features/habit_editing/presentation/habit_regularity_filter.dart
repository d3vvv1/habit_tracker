import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/data/enums.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_bloc.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_event.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_state.dart';

class HabitRegularityFilter extends StatelessWidget {
  const HabitRegularityFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitEditingBloc, HabitEditingState>(
      buildWhen: (previous, current) =>
          current is RegularityChanged || current is DataInit,
      builder: (context, state) {
        HabitRegularity? regularity;
        if (state is DataInit) {
          regularity = state.habitRegularity;
        }
        if (state is RegularityChanged) {
          regularity = state.regularity;
        }
        return DecoratedBox(
          decoration: BoxDecoration(
              color: context.appColors.base6,
              borderRadius: BorderRadius.circular(6)),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: HabitRegularity.values.map(
                (HabitRegularity type) {
                  return Expanded(
                    child: FilterChip(
                        padding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.zero,
                        label: SizedBox(
                          height: Adaptive.getHeight(50),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              type == HabitRegularity.regularHabit
                                  ? AppWords.of(context).regularHabit
                                  : AppWords.of(context).oneTimeTask,
                              style: regularity == type
                                  ? context.appText.header4.copyWith(
                                      color: Colors.white,
                                    )
                                  : context.appText.header4,
                            ),
                          ),
                        ),
                        selectedColor: context.appColors.base1,
                        showCheckmark: false,
                        backgroundColor: context.appColors.base6,
                        side: BorderSide(
                            color: Colors.white.withValues(alpha: 0)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        selected: regularity == HabitRegularity.regularHabit,
                        onSelected: (bool selected) {
                          if (selected) {
                            context.read<HabitEditingBloc>().add(
                                  SetRegularity(regulatity: type),
                                );
                          }
                        }),
                  );
                },
              ).toList(),
            ),
          ),
        );
      },
    );
  }
}
