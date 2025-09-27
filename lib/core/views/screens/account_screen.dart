import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/routing/app_route_names.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/widgets/custom_app_bar.dart';
import 'package:habit_tracker/core/views/widgets/separator.dart';
import 'package:habit_tracker/main.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          backButton: null,
          title: Text(
            'Account',
            style: context.appText.header2,
          ),
          horizontalPadding: 0,
          actions: const [],
          backgroundColor: context.appColors.base3),
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
                  ProfileButton(),
                  AppApearanceButton(),
                  LogoutButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: Adaptive.getWidth(20),
      leading: SizedBox(
          height: Adaptive.getHeight(40),
          child: Icon(
            Icons.person,
            color: context.appColors.base4,
          )),
      title: Text(
        AppWords.of(context).profile,
        style: context.appText.header4,
      ),
      trailing: SizedBox(
        height: Adaptive.getHeight(40),
        child: Icon(
          Icons.chevron_right,
          color: context.appColors.base4,
        ),
      ),
      onTap: () => context.pushNamed(AppRouteNames.profile),
    );
  }
}

class AppApearanceButton extends StatelessWidget {
  const AppApearanceButton({super.key});

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
      onTap: () => context.pushNamed(AppRouteNames.profile),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: Adaptive.getWidth(20),
      leading: SizedBox(
          height: Adaptive.getHeight(40),
          child: const Icon(
            Icons.logout,
            color: Colors.red,
          )),
      title: Text(
        AppWords.of(context).logout,
        style: context.appText.header4.copyWith(color: Colors.red),
      ),
      onTap: () => showModalBottomSheet(
          context: context,
          builder: (context) => const LogoutModalBottomSheet()),
    );
  }
}

class LogoutModalBottomSheet extends StatelessWidget {
  const LogoutModalBottomSheet({super.key});

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
        height: Adaptive.getHeight(250),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Adaptive.getWidth(25),
            vertical: Adaptive.getHeight(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppWords.of(context).logout,
                style: context.appText.header2.copyWith(
                  color: Colors.red,
                ),
              ),
              const Separator(),
              Text(
                AppWords.of(context).logoutWarning,
                style: context.appText.header4,
              ),
              const Separator(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppWords.of(context).cancel,
                      style: context.appText.header4,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppWords.of(context).yesLogout,
                      style: context.appText.header4,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
