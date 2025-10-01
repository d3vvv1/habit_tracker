import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/routing/app_route_names.dart';
import 'package:habit_tracker/core/services/auth/auth_service.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/widgets/error_modal_bottom_sheet.dart';
import 'package:habit_tracker/features/auth/bloc/auth_bloc.dart';
import 'package:habit_tracker/features/auth/bloc/auth_state.dart';
import 'package:habit_tracker/features/auth/presentation/complete_sign_in_button.dart';
import 'package:habit_tracker/core/views/widgets/custom_app_bar.dart';
import 'package:habit_tracker/core/views/widgets/custom_back_button.dart';
import 'package:habit_tracker/features/auth/presentation/email_input_field.dart';
import 'package:habit_tracker/features/auth/presentation/password_input_filed.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        backgroundColor: context.appColors.base2,
        backButton: const CustomBackButton(),
        title: const SizedBox.shrink(),
        horizontalPadding: Adaptive.getWidth(25),
      ),
      backgroundColor: context.appColors.base2,
      body: BlocProvider(
        create: (context) => AuthBloc(
          authService: GetIt.instance<AuthService>(),
        ),
        lazy: false,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SuccessLogin) {
              context.goNamed(AppRouteNames.home);
            } else if (state is! InitialState) {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  String errorText = '';
                  if (state is InCorrectEmail) {
                    errorText = AppWords.of(context).inCorrectEmail;
                  } else if (state is InCorrectPassword) {
                    errorText = AppWords.of(context).inCorrectPassword;
                  } else if (state is AuthError) {
                    errorText = state.errorText;
                  }
                  return ErrorModalBottomSheet(errorText: errorText);
                },
              );
            }
          },
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: Adaptive.getWidth(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    AppWords.of(context).welcomeBack,
                    style: context.appText.header2,
                  ),
                ),
                SizedBox(
                  height: Adaptive.getHeight(10),
                ),
                Text(
                  AppWords.of(context).signInText,
                  style: context.appText.header4,
                ), //Start you bla bla bla
                SizedBox(
                  height: Adaptive.getHeight(40),
                ),
                const EmailInputField(),
                SizedBox(
                  height: Adaptive.getHeight(20),
                ),
                const PasswordInputFiled(),
                SizedBox(
                  height: Adaptive.getHeight(40),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       AppWords.of(context).alreadyHaveAccount,
                //       style: context.appText.header4,
                //     ),
                //     TextButton(
                //       onPressed: () {
                //         //context.pushNamed(AppRouteNames.signIn);
                //       },
                //       child: Text(
                //         AppWords.of(context).signIn,
                //         style: context.appText.header4
                //             .copyWith(color: context.appColors.base1),
                //       ),
                //     ),
                //   ],
                // ),
                const Expanded(
                  child: SizedBox(),
                ),
                const CompleteSignInButton(),
                SizedBox(
                  height: Adaptive.getHeight(20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
