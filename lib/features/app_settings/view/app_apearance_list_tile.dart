import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/routing/app_route_names.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';

class AppApearanceListTile extends StatelessWidget {
  const AppApearanceListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: Adaptive.getWidth(20),
      leading: SizedBox(
          height: Adaptive.getHeight(40),
          child: Icon(
            Icons.remove_red_eye_outlined,
            color: context.appColors.base4,
          )),
      title: Text(
        AppWords.of(context).appAppearance,
        style: context.appText.header4,
      ),
      trailing: SizedBox(
        height: Adaptive.getHeight(40),
        child: Icon(
          Icons.chevron_right,
          color: context.appColors.base4,
        ),
      ),
      onTap: () => context.pushNamed(AppRouteNames.settings),
    );
  }
}
