import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/auth/bloc/auth_bloc.dart';
import 'package:habit_tracker/features/auth/bloc/auth_event.dart';

class PasswordInputFiled extends StatefulWidget {
  const PasswordInputFiled({super.key});

  @override
  State<PasswordInputFiled> createState() => _PasswordInputFiledState();
}

class _PasswordInputFiledState extends State<PasswordInputFiled> {
  final _passwordController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        context
            .read<AuthBloc>()
            .add(EnterPassword(password: _passwordController.text));
      }
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppWords.of(context).password,
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
                  focusNode: _focusNode,
                  controller: _passwordController,
                  obscureText: _obscureText,
                  style: context.appText.header4,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock_outline,
                        color: context.appColors.base4,
                      ),
                      hintText: AppWords.of(context).password,
                      hintStyle: context.appText.header4.copyWith(
                          color: context.appColors.base4.withAlpha(150)),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      border: InputBorder.none),
                  textInputAction: TextInputAction.done,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
