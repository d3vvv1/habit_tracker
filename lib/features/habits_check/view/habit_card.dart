import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';

class HabitCard extends StatelessWidget {
  final bool isCompleted;
  final int id;
  final String name;
  final Color color;
  final String icon; //TODO: Заменить на эмодзи
  const HabitCard(
      {super.key,
      required this.name,
      required this.color,
      required this.icon,
      required this.id,
      required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    if (isCompleted) {
      return SizedBox(
        height: Adaptive.getHeight(90),
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
          child: Center(
            child: ListTile(
                leading: Text(
                  icon,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                title: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.appText.header3.copyWith(color: Colors.black),
                ),
                trailing: Icon(
                  Icons.check_circle,
                  color: Colors.lightGreen.shade600,
                )),
          ),
        ),
      );
    } else {
      return Dismissible(
        key: Key(id.toString()),
        direction: DismissDirection.startToEnd,
        background: ColoredBox(
          color: Colors.lightGreen.shade600,
          child: Padding(
            padding: EdgeInsets.only(left: Adaptive.getWidth(10)),
            child: Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                AppWords.of(context).complete,
                style: context.appText.header3.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
        onDismissed: (direction) => log('COMPLETED'),
        child: SizedBox(
          height: Adaptive.getHeight(90),
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color,
            ),
            child: Center(
              child: ListTile(
                leading: Text(
                  icon,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                title: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.appText.header3.copyWith(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
