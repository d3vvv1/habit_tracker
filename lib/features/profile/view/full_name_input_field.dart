import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/profile/bloc/profile_bloc.dart';
import 'package:habit_tracker/features/profile/bloc/profile_event.dart';
import 'package:habit_tracker/features/profile/bloc/profile_state.dart';
import 'package:habit_tracker/main.dart';

//TODO: Спиздить фокус нод из слр
class FullNameInputField extends StatefulWidget {
  final String? name;
  const FullNameInputField({super.key, this.name});

  @override
  State<FullNameInputField> createState() => _FullNameInputFieldState();
}

class _FullNameInputFieldState extends State<FullNameInputField> {
  final _nameController = TextEditingController();

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Имя обязательно должно быть заполнено';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) =>
          (current is InitProfile || current is NameChanged),
      builder: (context, state) {
        if (state is InitProfile) {
          _nameController.text = state.profile.fullName ?? '';
        }
        if (state is NameChanged) {
          _nameController.text = state.newName;
        }
        return SizedBox(
          width: double.infinity,
          height: Adaptive.getHeight(55),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: context.appColors.base3,
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Adaptive.getWidth(10)),
              child: TextFormField(
                controller: _nameController,
                maxLength: 50,
                style: context.appText.header4,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterText: '',
                ),
                validator: _validateName,
                onFieldSubmitted: (value) => context.read<ProfileBloc>().add(
                      ChangeName(newName: value),
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
