import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.appColors.base6,
        borderRadius: BorderRadius.circular(36),
      ),
      child: SizedBox(
        height: Adaptive.getHeight(60),
        width: Adaptive.getWidth(180),
        child: TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            AppWords.of(context).cancel,
            style: context.appText.header4,
          ),
        ),
      ),
    );
  }
}
