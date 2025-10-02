import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/data/enums.dart';
import 'package:habit_tracker/features/profile/bloc/profile_bloc.dart';
import 'package:habit_tracker/features/profile/bloc/profile_event.dart';
import 'package:habit_tracker/features/profile/bloc/profile_state.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<ProfileBloc>();
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) =>
          (current is InitProfile || current is GenderChanged),
      builder: (context, state) {
        Genders? selectedGender;
        if (state is InitProfile) {
          selectedGender = state.gender;
        }
        if (state is GenderChanged) {
          selectedGender = state.newGender;
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppWords.of(context).gender,
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
                child: DropdownMenu<Genders>(
                  initialSelection: selectedGender,
                  textStyle: context.appText.header4,
                  trailingIcon: Icon(
                    Icons.keyboard_arrow_down,
                    color: context.appColors.base4,
                  ),
                  width: double.infinity,
                  inputDecorationTheme: InputDecorationTheme(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: Adaptive.getWidth(20),
                    ),
                  ),
                  menuStyle: MenuStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(context.appColors.base3)),
                  onSelected: (Genders? value) {
                    bloc.add(ChangeGender(newGender: value!));
                  },
                  dropdownMenuEntries: Genders.values.map((Genders gender) {
                    String label = '';
                    switch (gender) {
                      case Genders.male:
                        label = AppWords.of(context).male;
                      case Genders.female:
                        label = AppWords.of(context).female;
                    }
                    return DropdownMenuEntry<Genders>(
                      value: gender,
                      label: label,
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
