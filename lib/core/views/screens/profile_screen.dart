import 'package:flutter/material.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/widgets/custom_app_bar.dart';
import 'package:habit_tracker/core/views/widgets/custom_back_button.dart';
import 'package:habit_tracker/main.dart';

//TODO: Сделать инпут поля ввода данных
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: context.appColors.base2,
        backButton: const CustomBackButton(),
        title: Text(
          AppWords.of(context).profile,
          style: context.appText.header2,
        ),
        horizontalPadding: Adaptive.getWidth(20),
        actions: const [],
      ),
      backgroundColor: context.appColors.base2,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Adaptive.getWidth(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Adaptive.getHeight(20),
            ),
            Center(
              child: SizedBox(
                height: Adaptive.getHeight(100),
                width: Adaptive.getHeight(100),
                child: CircleAvatar(), //TODO: Сделать выбор автарки из галереи
              ),
            ),
            SizedBox(
              height: Adaptive.getHeight(20),
            ),
            // FULLNAME INPUT
            Text(
              AppWords.of(context).fullName,
              style: context.appText.header3,
            ),
            SizedBox(
              height: Adaptive.getHeight(10),
            ),
            Container(
              width: double.infinity,
              height: Adaptive.getHeight(55),
              color: context.appColors.base3,
            ),
            // FULLNAME INPUT
            SizedBox(
              height: Adaptive.getHeight(20),
            ),
            // EMAIL INPUT
            Text(
              AppWords.of(context).fullName,
              style: context.appText.header3,
            ),
            SizedBox(
              height: Adaptive.getHeight(10),
            ),
            Container(
              width: double.infinity,
              height: Adaptive.getHeight(55),
              color: context.appColors.base3,
            ),
            // EMAIL INPUT
            SizedBox(
              height: Adaptive.getHeight(20),
            ),
            // GENDER SELECT
            Text(
              AppWords.of(context).gender,
              style: context.appText.header3,
            ),
            SizedBox(
              height: Adaptive.getHeight(10),
            ),
            Container(
              width: double.infinity,
              height: Adaptive.getHeight(55),
              color: context.appColors.base3,
            ),
            // GENDER SELECT
            SizedBox(
              height: Adaptive.getHeight(20),
            ),
            // BIRTHDAY INPUT
            Text(
              AppWords.of(context).birthDate,
              style: context.appText.header3,
            ),
            SizedBox(
              height: Adaptive.getHeight(10),
            ),
            Container(
              width: double.infinity,
              height: Adaptive.getHeight(55),
              color: context.appColors.base3,
            ),
            // BIRTHDAY INPUT
          ],
        ),
      ),
    );
  }
}
