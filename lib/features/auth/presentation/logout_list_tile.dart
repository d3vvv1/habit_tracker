import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/auth/presentation/logout_modal_bottom_sheet.dart';

class LogoutListTile extends StatelessWidget {
  const LogoutListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: Adaptive.getWidth(20),
      leading: SizedBox(
          height: Adaptive.getHeight(40),
          child: const Icon(
            Icons.logout,
            color: Colors.red,
          )),
      title: Text(
        AppWords.of(context).logout,
        style: context.appText.header4.copyWith(color: Colors.red),
      ),
      onTap: () => showModalBottomSheet(
          context: context,
          builder: (context) => const LogoutModalBottomSheet()),
    );
  }
}
