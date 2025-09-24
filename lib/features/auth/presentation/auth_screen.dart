import 'package:flutter/material.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/views/custom_app_bar.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_box_rounded,
              size: 64,
              color: context.appColors.base1,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              AppWords.of(context).letsGetStarted,
              style: context.appText.header1,
            ),
            Text(
              AppWords.of(context).letsDiveInIntoYourAccount,
              style: context.appText.header3,
            ),
            //Expanded(child: SizedBox()),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(context.appColors.base1),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                ),
                onPressed: () {},
                child: Text(
                  AppWords.of(context).signIn,
                  style: context.appText.header2.copyWith(
                    color: context.appColors.base3,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(context.appColors.base6),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                ),
                onPressed: () {},
                child: Text(
                  AppWords.of(context).signUp,
                  style: context.appText.header2.copyWith(
                    color: context.appColors.base1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
