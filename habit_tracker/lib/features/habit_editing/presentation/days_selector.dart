import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/data/enums.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: DayNames.values.map((DayNames day) {
            return FilterChip(
              label: SizedBox(
                height: Adaptive.getHeight(50),
                width: Adaptive.getHeight(50),
                child: Center(
                  child: Text(
                    getLabel(day, context)[0],
                    style: selectedDays.contains(day)
                        ? context.appText.header4.copyWith(
                            color: const Color.fromRGBO(255, 255, 255, 1))
                        : context.appText.header4,
                  ),
                ),
              ),
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
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
