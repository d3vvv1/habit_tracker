import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/routing/app_route_names.dart';
import 'package:habit_tracker/features/habits_check/domain/repositories/habit_repository_interface.dart';

class HabitCreateFloatingButton extends StatelessWidget {
  const HabitCreateFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        GetIt.instance<HabitRepositoryInterface>().selectCurrentHabit(null);
        context.pushNamed(
          AppRouteNames.editHabit,
          pathParameters: {
            'name': AppWords.of(context).createNewHabit,
          },
        );
      },
      backgroundColor: context.appColors.base1,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
