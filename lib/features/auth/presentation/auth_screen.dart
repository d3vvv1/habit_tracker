import 'package:flutter/material.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/custom_app_bar.dart';
import 'package:habit_tracker/features/auth/presentation/sign_in_button.dart';
import 'package:habit_tracker/features/auth/presentation/sign_up_button.dart';
import 'package:habit_tracker/main.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.base3,
      appBar: const CustomAppBar(
          backButton: SizedBox.shrink(),
          title: SizedBox.shrink(),
          horizontalPadding: 20,
          actions: []),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.getWidth(25),
            vertical: Adaptive.getHeight(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_box_rounded,
              size: Adaptive.getHeight(80),
              color: context.appColors.base1,
            ),
            SizedBox(
              height: Adaptive.getHeight(30),
            ),
            Text(
              AppWords.of(context).letsGetStarted,
              style: context.appText.header1,
            ),
            Text(
              AppWords.of(context).letsDiveInIntoYourAccount,
              style: context
                  .appText.header4, //TODO: Поменять хэдер на менее жирный шрфит
            ),
            SizedBox(
              height: Adaptive.getHeight(80),
            ),
            const SignInButton(),
            SizedBox(
              height: Adaptive.getHeight(20),
            ),
            const SignUpButton(),
          ],
        ),
      ),
    );
  }
}
