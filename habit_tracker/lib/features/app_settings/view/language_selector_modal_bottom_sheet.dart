import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/widgets/cancel_button.dart';
import 'package:habit_tracker/core/views/widgets/separator.dart';
import 'package:habit_tracker/core/views/widgets/ok_button.dart';
import 'package:habit_tracker/features/app_settings/provider/locale_provider.dart';
import 'package:provider/provider.dart';

class LanguageSelectorModalBottomSheet extends StatelessWidget {
  const LanguageSelectorModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    return DecoratedBox(
      decoration: BoxDecoration(
          color: context.appColors.base2,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )),
      child: SizedBox(
        height: Adaptive.getHeight(360),
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
                AppWords.of(context).appLanguage,
                style: context.appText.header3,
              ),
              const Separator(),
              RadioGroup(
                onChanged: (locale) => localeProvider.locale = locale!,
                groupValue: localeProvider.locale,
                child: Column(
                  children: AppWords.supportedLocales.map((Locale locale) {
                    String label = '';
                    if (locale == const Locale('en')) {
                      label = AppWords.of(context).english;
                    } else if (locale == const Locale('ru')) {
                      label = AppWords.of(context).russian;
                    }
                    return RadioListTile<Locale>(
                      activeColor: context.appColors.base1,
                      title: Text(
                        label,
                        style: context.appText.header4,
                      ),
                      value: locale,
                    );
                  }).toList(),
                ),
              ),
              const Separator(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CancelButton(),
                  OkButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
