import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/services/auth/auth_service.dart';
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
          onPressed: () async {
            await GetIt.instance<AuthService>().logout();
            if (context.mounted) {
              context.pop();
            }
          },
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
