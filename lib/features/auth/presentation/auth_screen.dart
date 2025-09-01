import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:habit_tracker/core/theme/app_text_styles.dart';
import 'package:habit_tracker/core/views/custom_app_bar.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.base3,
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
              color: AppColors.base1,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Давайте начнем!',
              style: AppTextStyles.header1,
            ),
            Text(
              'Необходимо войти в ваш аккаунт',
              style: AppTextStyles.header3,
            ),
            //Expanded(child: SizedBox()),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.base1),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                ),
                onPressed: () {},
                child: Text('Войти',
                    style: AppTextStyles.header2.copyWith(
                      color: AppColors.base3,
                    )),
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
                  backgroundColor: WidgetStatePropertyAll(AppColors.base6),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                ),
                onPressed: () {},
                child: Text('Зарегестрироваться',
                    style: AppTextStyles.header2.copyWith(
                      color: AppColors.base1,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
