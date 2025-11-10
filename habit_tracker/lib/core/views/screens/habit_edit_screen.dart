import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/routing/app_route_names.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/widgets/custom_app_bar.dart';
import 'package:habit_tracker/core/views/widgets/custom_back_button.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_bloc.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_state.dart';
import 'package:habit_tracker/features/habit_editing/presentation/color_picker_dialog.dart';
import 'package:habit_tracker/features/habit_editing/presentation/emoji_select_dialog.dart';
import 'package:habit_tracker/features/habit_editing/presentation/habit_color_picker.dart';
import 'package:habit_tracker/features/habit_editing/presentation/habit_day_time_filter.dart';
import 'package:habit_tracker/features/habit_editing/presentation/habit_name_input.dart';
import 'package:habit_tracker/features/habit_editing/presentation/habit_regularity_filter.dart';
import 'package:habit_tracker/features/habit_editing/presentation/habit_repeat_filter.dart';
import 'package:habit_tracker/features/habit_editing/presentation/emoji_selector.dart';
import 'package:habit_tracker/features/habit_editing/presentation/save_button.dart';

class HabitCreationScreen extends StatelessWidget {
  final String name;
  const HabitCreationScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HabitEditingBloc(),
      lazy: false,
      child: BlocListener<HabitEditingBloc, HabitEditingState>(
        listenWhen: (previous, current) =>
            current is ColorPickerOpened ||
            current is EmojiPickerOpened ||
            current is ChangesSaved,
        listener: (context, state) {
          if (state is ColorPickerOpened) {
            var bloc = context.read<HabitEditingBloc>();
            showDialog(
              context: context,
              builder: (context) => ColorPickerDialog(
                bloc: bloc,
              ),
            );
          }
          if (state is EmojiPickerOpened) {
            var bloc = context.read<HabitEditingBloc>();
            showModalBottomSheet(
              context: context,
              builder: (context) => EmojiSelectDialog(
                bloc: bloc,
              ),
            );
          }
          if (state is ChangesSaved) {
            context.goNamed(AppRouteNames.home);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: CustomAppBar(
            backgroundColor: context.appColors.base2,
            backButton: const CustomBackButton(),
            title: Text(
              name,
              style: context.appText.header3,
              textAlign: TextAlign.center,
            ),
            horizontalPadding: Adaptive.getWidth(20),
          ),
          backgroundColor: context.appColors.base2,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Adaptive.getWidth(20),
              ),
              child: ListView(
                children: [
                  const HabitRegularityFilter(),
                  SizedBox(
                    height: Adaptive.getHeight(30),
                  ),
                  const HabitNameInputField(),
                  SizedBox(
                    height: Adaptive.getHeight(20),
                  ),
                  const EmojiSelector(),
                  SizedBox(
                    height: Adaptive.getHeight(20),
                  ),
                  const HabitColorPicker(),
                  SizedBox(
                    height: Adaptive.getHeight(20),
                  ),
                  const HabitRepeatFilter(),
                  SizedBox(
                    height: Adaptive.getHeight(50),
                  ),
                  const HabitDayTimeFilter(),
                  SizedBox(
                    height: Adaptive.getHeight(30),
                  ),
                  const SaveButton(),
                  SizedBox(
                    height: Adaptive.getHeight(20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
