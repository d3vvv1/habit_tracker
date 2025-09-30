import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';

class LogoutConfirmButton extends StatelessWidget {
  const LogoutConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.appColors.base1,
        borderRadius: BorderRadius.circular(36),
      ),
      child: SizedBox(
        height: Adaptive.getHeight(60),
        width: Adaptive.getWidth(180),
        child: TextButton(
          onPressed: () {},
          child: Text(
            AppWords.of(context).yesLogout,
            style: context.appText.header4.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
