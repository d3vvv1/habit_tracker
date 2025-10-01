import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/screens/emoji_selector.dart';
import 'package:habit_tracker/core/views/widgets/custom_app_bar.dart';
import 'package:habit_tracker/core/views/widgets/custom_back_button.dart';
import 'package:habit_tracker/features/habit_creation/presentation/habit_color_picker.dart';
import 'package:habit_tracker/features/habit_creation/presentation/habit_day_time_filter.dart';
import 'package:habit_tracker/features/habit_creation/presentation/habit_regularity_filter.dart';
import 'package:habit_tracker/features/habit_creation/presentation/habit_repeat_filter.dart';

class HabitCreationScreen extends StatelessWidget {
  const HabitCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        backgroundColor: context.appColors.base2,
        backButton: const CustomBackButton(),
        title: Text(
          AppWords.of(context).createNewHabit,
          style: context.appText.header3,
        ),
        horizontalPadding: Adaptive.getWidth(20),
        actions: const [],
      ),
      backgroundColor: context.appColors.base2,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Adaptive.getWidth(20),
          ),
          child: ListView(
            children: [
              const HabitRegularityFilter(),
              SizedBox(
                height: Adaptive.getHeight(30),
              ),
              // EmojiSelector(),
              SizedBox(
                height: Adaptive.getHeight(20),
              ),
              const HabitColorPicker(),
              SizedBox(
                height: Adaptive.getHeight(20),
              ),
              const HabitRepeatFilter(),
              SizedBox(
                height: Adaptive.getHeight(50),
              ),
              const HabitDayTimeFilter(),
            ],
          ),
        ),
      ),
    );
  }
}
