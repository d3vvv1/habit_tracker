import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/data/emoji_list.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_bloc.dart';
import 'package:habit_tracker/features/habit_editing/presentation/emoji_button.dart';

class EmojiSelectDialog extends StatelessWidget {
  final HabitEditingBloc bloc;
  const EmojiSelectDialog({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Adaptive.getHeight(370),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.appColors.base2,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        child: Padding(
          padding: EdgeInsets.all(Adaptive.getHeight(20)),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: Adaptive.getWidth(15),
              mainAxisSpacing: Adaptive.getHeight(15),
            ),
            itemCount: EmojiList.emojiList.length,
            itemBuilder: (context, index) => EmojiButton(
              emoji: EmojiList.emojiList[index],
              bloc: bloc,
            ),
          ),
        ),
      ),
    );
  }
}
