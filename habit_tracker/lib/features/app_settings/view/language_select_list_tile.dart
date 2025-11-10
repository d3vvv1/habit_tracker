import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/app_settings/provider/locale_provider.dart';
import 'package:habit_tracker/features/app_settings/view/language_selector_modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class LanguageSelectListTile extends StatelessWidget {
  const LanguageSelectListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        AppWords.of(context).appLanguage,
        style: context.appText.header3,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            Provider.of<LocaleProvider>(context).locale == const Locale('en')
                ? AppWords.of(context).english
                : AppWords.of(context).russian,
            style: context.appText.header4,
          ),
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
          builder: (context) => const LanguageSelectorModalBottomSheet()),
    );
  }
}
