import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_bloc.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_event.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_state.dart';

class EmojiButton extends StatelessWidget {
  final String emoji;
  final HabitEditingBloc bloc;
  const EmojiButton({super.key, required this.emoji, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitEditingBloc, HabitEditingState>(
      bloc: bloc,
      buildWhen: (previous, current) =>
          current is IconChanged || current is DataInit,
      builder: (context, state) {
        String? selectedEmoji;
        if (state is DataInit) {
          selectedEmoji = state.icon;
        }
        if (state is IconChanged) {
          selectedEmoji = state.icon;
        }
        return SizedBox(
          width: Adaptive.getHeight(70),
          height: Adaptive.getHeight(70),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: (selectedEmoji != null && selectedEmoji == emoji)
                    ? context.appColors.base1
                    : context.appColors.base3,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: context.appColors.base4.withAlpha(100),
                )),
            child: TextButton(
              onPressed: () {
                bloc.add(SetIcon(icon: emoji));
              },
              style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
              )),
              child: Text(
                emoji,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
