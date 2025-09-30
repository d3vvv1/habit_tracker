import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/habit_creation/data/enums.dart';

class HabitRegularityFilter extends StatefulWidget {
  const HabitRegularityFilter({super.key});

  @override
  State<HabitRegularityFilter> createState() => _HabitRegularityFilterState();
}

class _HabitRegularityFilterState extends State<HabitRegularityFilter> {
  final List<HabitRegularity> filters = [HabitRegularity.regular];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Adaptive.getHeight(30),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: context.appColors.base6,
            borderRadius: BorderRadius.circular(6)),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: Adaptive.getWidth(0),
          children: HabitRegularity.values.map(
            (HabitRegularity type) {
              return FilterChip(
                  label: Container(
                    alignment: Alignment.center,
                    height: Adaptive.getHeight(30),
                    width: Adaptive.width / 2 -
                        Adaptive.getWidth(52), //TODO: Посомтреть почему 52
                    child: Text(
                      type == HabitRegularity.regular
                          ? AppWords.of(context).regularHabit
                          : AppWords.of(context).oneTimeTask,
                      style: filters.contains(type)
                          ? Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: const Color.fromRGBO(255, 255, 255, 1))
                          : Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  selectedColor: context.appColors.base1,
                  showCheckmark: false,
                  backgroundColor: context.appColors.base6,
                  side: BorderSide(color: Colors.white.withValues(alpha: 0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
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
    );
  }
}
