import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/auth/bloc/auth_bloc.dart';
import 'package:habit_tracker/features/auth/bloc/auth_event.dart';

class CompleteSignInButton extends StatelessWidget {
  const CompleteSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Adaptive.getHeight(60),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(context.appColors.base1),
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        ),
        onPressed: () {
          context.read<AuthBloc>().add(SignIn());
        },
        child: Text(
          AppWords.of(context).signIn,
          style: context.appText.header4.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
