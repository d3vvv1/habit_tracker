import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/widgets/custom_app_bar.dart';
import 'package:habit_tracker/core/views/widgets/custom_back_button.dart';
import 'package:habit_tracker/features/profile/bloc/profile_bloc.dart';
import 'package:habit_tracker/features/profile/view/birthday_selector.dart';
import 'package:habit_tracker/features/profile/view/email_input_field.dart';
import 'package:habit_tracker/features/profile/view/full_name_input_field.dart';
import 'package:habit_tracker/features/profile/view/gender_selector.dart';
import 'package:habit_tracker/features/profile/view/profile_avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        backgroundColor: context.appColors.base2,
        backButton: const CustomBackButton(),
        title: Text(
          AppWords.of(context).profile,
          style: context.appText.header2,
        ),
        horizontalPadding: Adaptive.getWidth(20),
        actions: const [],
      ),
      backgroundColor: context.appColors.base2,
      body: BlocProvider(
        create: (context) => ProfileBloc(),
        lazy: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Adaptive.getWidth(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Adaptive.getHeight(20),
              ),
              const Center(
                child: ProfileAvatar(),
              ),
              SizedBox(
                height: Adaptive.getHeight(20),
              ),
              const FullNameInputField(),
              SizedBox(
                height: Adaptive.getHeight(20),
              ),
              const EmailInputField(),
              SizedBox(
                height: Adaptive.getHeight(20),
              ),
              const GenderSelector(),
              SizedBox(
                height: Adaptive.getHeight(20),
              ),
              const BirthdaySelector(),
            ],
          ),
        ),
      ),
    );
  }
}
