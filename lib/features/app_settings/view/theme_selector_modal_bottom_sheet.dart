import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/widgets/cancel_button.dart';
import 'package:habit_tracker/core/views/widgets/separator.dart';
import 'package:habit_tracker/core/views/widgets/ok_button.dart';

class ThemeSelectorModalBottomSheet extends StatefulWidget {
  const ThemeSelectorModalBottomSheet({super.key});

  @override
  State<ThemeSelectorModalBottomSheet> createState() =>
      _ThemeSelectorModalBottomSheetState();
}

class _ThemeSelectorModalBottomSheetState
    extends State<ThemeSelectorModalBottomSheet> {
  ThemeMode currentThemeMode = ThemeMode.light;
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
        height: Adaptive.getHeight(360),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Adaptive.getWidth(25),
            vertical: Adaptive.getHeight(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppWords.of(context).chooseTheme,
                style: context.appText.header3,
              ),
              const Separator(),
              Column(
                children: ThemeMode.values.map((ThemeMode themeType) {
                  String label = '';
                  switch (themeType) {
                    case ThemeMode.system:
                      label = AppWords.of(context).systemDefault;
                    case ThemeMode.light:
                      label = AppWords.of(context).light;
                    case ThemeMode.dark:
                      label = AppWords.of(context).dark;
                  }
                  return RadioListTile<ThemeMode>(
                    activeColor: context.appColors.base1,
                    title: Text(
                      label,
                      style: context.appText.header4,
                    ),
                    value: themeType,
                    groupValue: currentThemeMode,
                    onChanged: (newMode) {
                      setState(() {
                        if (newMode != null) {
                          currentThemeMode = newMode;
                        }
                      });
                    },
                  );
                }).toList(),
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
