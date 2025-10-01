import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/auth/bloc/auth_bloc.dart';
import 'package:habit_tracker/features/auth/bloc/auth_event.dart';

class EmailInputField extends StatefulWidget {
  const EmailInputField({super.key});

  @override
  State<EmailInputField> createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  final _emailController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        context.read<AuthBloc>().add(EnterEmail(email: _emailController.text));
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppWords.of(context).emailFull,
          style: context.appText.header3,
        ),
        SizedBox(
          height: Adaptive.getHeight(10),
        ),
        SizedBox(
          width: double.infinity,
          height: Adaptive.getHeight(70),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: context.appColors.base3,
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Adaptive.getWidth(10)),
              child: Center(
                child: TextFormField(
                  controller: _emailController,
                  focusNode: focusNode,
                  keyboardType: TextInputType.emailAddress,
                  style: context.appText.header4,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email_outlined,
                      color: context.appColors.base4,
                    ),
                    hintText: AppWords.of(context).email,
                    hintStyle: context.appText.header4.copyWith(
                        color: context.appColors.base4.withAlpha(150)),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
