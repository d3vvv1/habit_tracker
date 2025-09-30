import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/app_settings/view/theme_selector_modal_bottom_sheet.dart';

class ThemeSelectListTile extends StatelessWidget {
  const ThemeSelectListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        AppWords.of(context).theme,
        style: context.appText.header3,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Light',
            style: context.appText.header4,
          ), // TODO: Поменять хардкод
          SizedBox(
            width: Adaptive.getWidth(15),
          ),
          Icon(
            Icons.chevron_right,
            size: Adaptive.getHeight(40),
            color: context.appColors.base4,
          ),
        ],
      ),
      onTap: () => showModalBottomSheet(
          context: context,
          builder: (context) => const ThemeSelectorModalBottomSheet()),
    );
  }
}
