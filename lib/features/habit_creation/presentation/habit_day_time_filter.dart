import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/habit_creation/data/enums.dart';

class HabitDayTimeFilter extends StatefulWidget {
  const HabitDayTimeFilter({super.key});

  @override
  State<HabitDayTimeFilter> createState() => _HabitDayTimeFilterState();
}

class _HabitDayTimeFilterState extends State<HabitDayTimeFilter> {
  final List<DayTimeType> filters = [DayTimeType.afternoon];
  @override
  Widget build(BuildContext context) {
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
          children: DayTimeType.values.map(
            (DayTimeType type) {
              String label = '';
              switch (type) {
                case DayTimeType.morning:
                  label = AppWords.of(context).morning;
                case DayTimeType.afternoon:
                  label = AppWords.of(context).afternoon;
                case DayTimeType.evening:
                  label = AppWords.of(context).evening;
              }
              return FilterChip(
                  label: SizedBox(
                    height: Adaptive.getHeight(30),
                    width: Adaptive.getWidth(80),
                    child: Center(
                      child: Text(
                        label,
                        style: filters.contains(type)
                            ? Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: const Color.fromRGBO(255, 255, 255, 1))
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
      ],
    );
  }
}
