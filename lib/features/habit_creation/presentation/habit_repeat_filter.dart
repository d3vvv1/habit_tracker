import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/habit_creation/data/enums.dart';
import 'package:habit_tracker/main.dart';

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
      children: [
        SizedBox(
          width: double.infinity,
          height: Adaptive.getHeight(30),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: Adaptive.getWidth(20),
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
                    label: Container(
                      alignment: Alignment.center,
                      height: Adaptive.getHeight(30),
                      width: Adaptive.getWidth(80),
                      child: Text(
                        label,
                        style: filters.contains(type)
                            ? Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: const Color.fromRGBO(255, 255, 255, 1))
                            : Theme.of(context).textTheme.titleMedium,
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

class DaysSelector extends StatefulWidget {
  const DaysSelector({super.key});

  @override
  State<DaysSelector> createState() => _DaysSelectorState();
}

class _DaysSelectorState extends State<DaysSelector> {
  List<DayNames> selectedDays = [];

  String getLabel(DayNames day, BuildContext context) {
    switch (day) {
      case DayNames.monday:
        return AppWords.of(context).monday;
      case DayNames.tuesday:
        return AppWords.of(context).tuesday;
      case DayNames.wednesday:
        return AppWords.of(context).wednesday;
      case DayNames.thursday:
        return AppWords.of(context).thursday;
      case DayNames.friday:
        return AppWords.of(context).friday;
      case DayNames.saturday:
        return AppWords.of(context).saturday;
      case DayNames.sunday:
        return AppWords.of(context).sunday;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppWords.of(context).onTheseDay,
              style: context.appText.header3,
            ),
            // Text(),
          ],
        ),
        SizedBox(
          height: Adaptive.getHeight(15),
          width: double.infinity,
        ),
        Wrap(
          spacing: Adaptive.getWidth(0),
          children: DayNames.values.map((DayNames day) {
            return FilterChip(
              label: Container(
                alignment: Alignment.center,
                height: Adaptive.getHeight(30),
                width: Adaptive.getHeight(30),
                child: Text(
                  getLabel(day, context)[0],
                  style: selectedDays.contains(day)
                      ? context.appText.header4.copyWith(
                          color: const Color.fromRGBO(255, 255, 255, 1))
                      : context.appText.header4,
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
                borderRadius: BorderRadius.circular(5),
              ),
              selected: selectedDays.contains(day),
              onSelected: (bool selected) {
                if (selectedDays.contains(day)) {
                  selectedDays.remove(day);
                } else {
                  selectedDays.add(day);
                }
                setState(() {});
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
