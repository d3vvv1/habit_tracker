import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/habit_creation/data/enums.dart';
import 'package:habit_tracker/features/habit_creation/presentation/days_selector.dart';

class HabitRepeatFilter extends StatefulWidget {
  const HabitRepeatFilter({super.key});

  @override
  State<HabitRepeatFilter> createState() => _HabitRepeatFilterState();
}

class _HabitRepeatFilterState extends State<HabitRepeatFilter> {
  final List<HabitRepeat> filters = [HabitRepeat.daily];
  @override
  Widget build(BuildContext context) {
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
                      width: Adaptive.getWidth(80),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          label,
                          style: filters.contains(type)
                              ? Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1))
                              : Theme.of(context).textTheme.titleMedium,
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
                    selected: filters.contains(type),
                    onSelected: (bool selected) {
                      if (selected) {
                        filters[0] = type;
                      }
                      setState(() {});
                    });
              },
            ).toList(),
          ),
        ),
        if (filters.contains(HabitRepeat.daily)) ...[
          SizedBox(
            height: Adaptive.getHeight(30),
          ),
          const DaysSelector(),
        ],
      ],
    );
  }
}
