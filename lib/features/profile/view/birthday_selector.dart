import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/profile/bloc/profile_bloc.dart';
import 'package:habit_tracker/features/profile/bloc/profile_event.dart';
import 'package:habit_tracker/features/profile/bloc/profile_state.dart';

class BirthdaySelector extends StatelessWidget {
  const BirthdaySelector({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<ProfileBloc>();
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) =>
          (current is InitProfile || current is BirthDateChanged),
      builder: (context, state) {
        DateTime? selectedDate;
        if (state is InitProfile) {
          selectedDate = state.birthDate;
        }
        if (state is BirthDateChanged) {
          selectedDate = state.newBirthDate;
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppWords.of(context).birthDate,
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
                  child: TextButton(
                      onPressed: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );

                        if (picked != null && picked != selectedDate) {
                          bloc.add(
                            ChangeBirthDate(newBirthDate: picked),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${selectedDate?.toLocal() ?? ''}".split(' ')[0],
                            style: context.appText.header4,
                          ),
                          Icon(
                            Icons.calendar_month,
                            color: context.appColors.base4,
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
