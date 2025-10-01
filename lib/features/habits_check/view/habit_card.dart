import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';

class HabitCard extends StatelessWidget {
  final int? id;
  final String name;
  final Color color;
  final IconData icon; //TODO: Заменить на эмодзи
  const HabitCard(
      {super.key,
      required this.name,
      required this.color,
      required this.icon,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id.toString() ?? '20'),
      direction: DismissDirection.startToEnd,
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
              leading: Icon(icon),
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
