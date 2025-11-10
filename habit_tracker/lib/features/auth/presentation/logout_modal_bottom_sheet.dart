import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/widgets/cancel_button.dart';
import 'package:habit_tracker/core/views/widgets/separator.dart';
import 'package:habit_tracker/features/auth/presentation/logout_confirm_button.dart';

class LogoutModalBottomSheet extends StatelessWidget {
  const LogoutModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: context.appColors.base2,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )),
      child: SizedBox(
        height: Adaptive.getHeight(250),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Adaptive.getWidth(25),
            vertical: Adaptive.getHeight(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppWords.of(context).logout,
                style: context.appText.header3.copyWith(
                  color: Colors.red,
                ),
              ),
              const Separator(),
              Text(
                AppWords.of(context).logoutWarning,
                style: context.appText.header4,
              ),
              const Separator(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CancelButton(),
                  LogoutConfirmButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
