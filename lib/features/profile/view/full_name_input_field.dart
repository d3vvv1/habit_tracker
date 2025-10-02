import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/profile/bloc/profile_bloc.dart';
import 'package:habit_tracker/features/profile/bloc/profile_event.dart';
import 'package:habit_tracker/features/profile/bloc/profile_state.dart';

class FullNameInputField extends StatefulWidget {
  final String? name;
  const FullNameInputField({super.key, this.name});

  @override
  State<FullNameInputField> createState() => _FullNameInputFieldState();
}

class _FullNameInputFieldState extends State<FullNameInputField> {
  final _nameController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        context.read<ProfileBloc>().add(
              ChangeName(newName: _nameController.text),
            );
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) =>
          (current is InitProfile || current is NameChanged),
      builder: (context, state) {
        if (state is InitProfile) {
          _nameController.text = state.fullName ?? '';
        }
        if (state is NameChanged) {
          _nameController.text = state.newName;
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppWords.of(context).fullName,
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
                    controller: _nameController,
                    focusNode: _focusNode,
                    maxLength: 50,
                    style: context.appText.header4,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    onFieldSubmitted: (value) =>
                        context.read<ProfileBloc>().add(
                              ChangeName(newName: value),
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
