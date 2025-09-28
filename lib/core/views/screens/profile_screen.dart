import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/widgets/custom_app_bar.dart';
import 'package:habit_tracker/core/views/widgets/custom_back_button.dart';
import 'package:habit_tracker/features/profile/bloc/profile_bloc.dart';
import 'package:habit_tracker/features/profile/bloc/profile_state.dart';
import 'package:habit_tracker/features/profile/data/mock_profile.dart';
import 'package:habit_tracker/features/profile/domain/profile_manager.dart';
import 'package:habit_tracker/features/profile/view/birthday_selector.dart';
import 'package:habit_tracker/features/profile/view/email_input_field.dart';
import 'package:habit_tracker/features/profile/view/full_name_input_field.dart';
import 'package:habit_tracker/features/profile/view/gender_selector.dart';
import 'package:habit_tracker/features/profile/view/profile_avatar.dart';
import 'package:habit_tracker/main.dart';

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
        create: (context) => ProfileBloc(
          InitProfile(profile: MockProfile()),
          manager: ProfileManager(
            profileData: MockProfile(),
          ),
        ),
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
              // FULLNAME INPUT
              Text(
                AppWords.of(context).fullName,
                style: context.appText.header3,
              ),
              SizedBox(
                height: Adaptive.getHeight(10),
              ),
              const FullNameInputField(),
              // FULLNAME INPUT
              SizedBox(
                height: Adaptive.getHeight(20),
              ),
              // EMAIL INPUT
              Text(
                AppWords.of(context).email,
                style: context.appText.header3,
              ),
              SizedBox(
                height: Adaptive.getHeight(10),
              ),
              const EmailInputField(),
              // EMAIL INPUT
              SizedBox(
                height: Adaptive.getHeight(20),
              ),
              // GENDER SELECT
              Text(
                AppWords.of(context).gender,
                style: context.appText.header3,
              ),
              SizedBox(
                height: Adaptive.getHeight(10),
              ),
              const GenderSelector(),
              // GENDER SELECT
              SizedBox(
                height: Adaptive.getHeight(20),
              ),
              // BIRTHDAY INPUT
              Text(
                AppWords.of(context).birthDate,
                style: context.appText.header3,
              ),
              SizedBox(
                height: Adaptive.getHeight(10),
              ),
              BirthdaySelector(),
              // BIRTHDAY INPUT
            ],
          ),
        ),
      ),
    );
  }
}
