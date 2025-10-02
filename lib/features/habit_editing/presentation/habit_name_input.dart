import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_bloc.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_event.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_state.dart';

class HabitNameInputField extends StatefulWidget {
  const HabitNameInputField({
    super.key,
  });

  @override
  State<HabitNameInputField> createState() => _HabitNameInputFieldState();
}

class _HabitNameInputFieldState extends State<HabitNameInputField> {
  final _nameController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        context.read<HabitEditingBloc>().add(
              SetName(name: _nameController.text),
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
    return BlocListener<HabitEditingBloc, HabitEditingState>(
      listenWhen: (previous, current) =>
          current is NameChanged || current is DataInit,
      listener: (context, state) {
        if (state is DataInit) {
          _nameController.text = state.name ?? '';
        }
        if (state is NameChanged) {
          _nameController.text = state.name;
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppWords.of(context).habitName,
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
                        context.read<HabitEditingBloc>().add(
                              SetName(name: _nameController.text),
                            )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
