import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/widgets/custom_app_bar.dart';
import 'package:habit_tracker/features/app_settings/view/app_apearance_list_tile.dart';
import 'package:habit_tracker/features/auth/presentation/logout_list_tile.dart';
import 'package:habit_tracker/features/profile/view/profile_list_tile.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backButton: null,
        title: Text(
          AppWords.of(context).account,
          style: context.appText.header3,
          textAlign: TextAlign.center,
        ),
        horizontalPadding: 0,
        backgroundColor: context.appColors.base3,
      ),
      backgroundColor: context.appColors.base3,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Adaptive.getWidth(25),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.appColors.base2,
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            height: Adaptive.getHeight(800),
            child: Padding(
              padding: EdgeInsets.all(Adaptive.getHeight(8)),
              child: const Column(
                children: [
                  ProfileLitTile(),
                  AppApearanceListTile(),
                  LogoutListTile(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
