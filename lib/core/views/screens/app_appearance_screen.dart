import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/widgets/custom_app_bar.dart';
import 'package:habit_tracker/core/views/widgets/custom_back_button.dart';
import 'package:habit_tracker/features/app_settings/view/language_select_list_tile.dart';
import 'package:habit_tracker/features/app_settings/view/theme_select_list_tile.dart';

class AppAppearanceScreen extends StatelessWidget {
  const AppAppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: context.appColors.base2,
        backButton: const CustomBackButton(),
        title: Text(
          AppWords.of(context).appAppearance,
          style: context.appText.header3,
          textAlign: TextAlign.center,
        ),
        horizontalPadding: Adaptive.getWidth(10),
      ),
      backgroundColor: context.appColors.base2,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Adaptive.getWidth(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Adaptive.getHeight(20),
            ),
            const ThemeSelectListTile(),
            SizedBox(
              height: Adaptive.getHeight(10),
            ),
            const LanguageSelectListTile(),
          ],
        ),
      ),
    );
  }
}
