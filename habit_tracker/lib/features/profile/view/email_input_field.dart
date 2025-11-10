import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/profile/bloc/profile_bloc.dart';
import 'package:habit_tracker/features/profile/bloc/profile_event.dart';
import 'package:habit_tracker/features/profile/bloc/profile_state.dart';

class EmailInputField extends StatefulWidget {
  const EmailInputField({
    super.key,
  });

  @override
  State<EmailInputField> createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  final _emailController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        context.read<ProfileBloc>().add(
              ChangeEmail(newEmail: _emailController.text),
            );
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) =>
          (current is InitProfile || current is EmailChanged),
      builder: (context, state) {
        if (state is InitProfile) {
          _emailController.text = state.email;
        }
        if (state is EmailChanged) {
          _emailController.text = state.newEmail;
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppWords.of(context).email,
              style: context.appText.header3,
            ),
            SizedBox(
              height: Adaptive.getHeight(10),
            ),
            SizedBox(
              width: double.infinity,
              height: Adaptive.getHeight(55),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: context.appColors.base3,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Adaptive.getWidth(10)),
                  child: TextFormField(
                    readOnly: true,
                    focusNode: _focusNode,
                    controller: _emailController,
                    style: context.appText.header4,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email_outlined,
                        color: context.appColors.base4,
                      ),
                      border: InputBorder.none,
                    ),
                    // validator: _validateEmail,
                    onFieldSubmitted: (value) =>
                        context.read<ProfileBloc>().add(
                              ChangeEmail(newEmail: value),
                            ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
