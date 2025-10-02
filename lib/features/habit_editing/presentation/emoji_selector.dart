import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/data/emoji_list.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_bloc.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_event.dart';
import 'package:habit_tracker/features/habit_editing/presentation/emoji_button.dart';

class EmojiSelector extends StatelessWidget {
  const EmojiSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppWords.of(context).icon,
              style: context.appText.header3,
            ),
            TextButton(
                onPressed: () {
                  context.read<HabitEditingBloc>().add(OpenEmojiPicker());
                },
                child: Row(
                  children: [
                    Text(
                      AppWords.of(context).viewAll,
                      style: context.appText.header4.copyWith(
                        color: context.appColors.base1,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: Adaptive.getHeight(30),
                      color: context.appColors.base1,
                    )
                  ],
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: EmojiList.emojiList.sublist(0, 5).map((String emoji) {
            return EmojiButton(
              emoji: emoji,
              bloc: context.read<HabitEditingBloc>(),
            );
          }).toList(),
        ),
      ],
    );
  }
}
