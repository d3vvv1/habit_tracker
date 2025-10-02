import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_bloc.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_event.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Adaptive.getHeight(60),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(context.appColors.base1),
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),
        ),
        onPressed: () {
          context.read<HabitEditingBloc>().add(
                SaveChanges(),
              );
        },
        child: Text(
          AppWords.of(context).save,
          style: context.appText.header4.copyWith(
            color: context.appColors.base3,
          ),
        ),
      ),
    );
  }
}
