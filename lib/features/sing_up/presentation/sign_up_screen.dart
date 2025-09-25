import 'package:flutter/material.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/custom_app_bar.dart';
import 'package:habit_tracker/core/views/custom_back_button.dart';
import 'package:habit_tracker/main.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backButton: const CustomBackButton(),
        title: Text(
          AppWords.of(context).signIn,
          style: context.appText.header3,
        ),
        horizontalPadding: Adaptive.getWidth(25),
        actions: const [],
      ),
      backgroundColor: context.appColors.base1,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: Adaptive.getWidth(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('AAA'), //JOIN HABITLY NOW
            Text('BBB'), //Start you bla bla bla

            //Text email
            //Email textformField

            //Text Password
            //Password textformfield

            // CheckBox agree to terms

            // Already have acc

            // SignUp button
          ],
        ),
      ),
    );
  }
}
