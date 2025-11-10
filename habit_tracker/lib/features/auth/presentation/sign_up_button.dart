import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/routing/app_route_names.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Adaptive.getHeight(60),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(context.appColors.base6),
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        ),
        onPressed: () {
          context.pushNamed(AppRouteNames.signUp);
        },
        child: Text(
          AppWords.of(context).signUp,
          style: context.appText.header4.copyWith(
            color: context.appColors.base1,
          ),
        ),
      ),
    );
  }
}
