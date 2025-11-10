import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_event.dart';
import 'package:habit_tracker/features/habit_editing/bloc/habit_editing_state.dart';
import 'package:habit_tracker/features/habit_editing/domain/use_cases/habit_edit_use_case.dart';

class HabitEditingBloc extends Bloc<HabitEditingEvent, HabitEditingState> {
  final EditHabitUseCase _useCase = EditHabitUseCase();

  HabitEditingBloc() : super(InitialState()) {
    on<Init>(_onInit);
    on<SetRegularity>(_onSetRegularity);
    on<SetName>(_onSetName);
    on<SetIcon>(_onSetIcon);
    on<OpenEmojiPicker>(_onOpenEmojiPicker);
    on<SetColor>(_onSetColor);
    on<OpenColorPicker>(_onOpenColorPicker);
    on<SetRepeat>(_onSetRepeat);
    on<SetDayForRepeat>(_onSetDayForRepeat);
    on<SetHabitTime>(_onSetHabitTime);
    on<SaveChanges>(_onSaveChanges);

    add(Init());
  }

  Future<void> _onInit(
    Init event,
    Emitter<HabitEditingState> emit,
  ) async {
    log('HABIT IS NULL - ${_useCase.habit == null}');
    emit(DataInit(
      habitRegularity: _useCase.habit!.habitRegularity,
      repeatType: _useCase.habit!.repeatType,
      days: _useCase.habit!.days,
      runTime: _useCase.habit!.runTime,
      name: _useCase.habit!.name,
      icon: _useCase.habit!.icon,
      color: _useCase.habit!.color,
    ));
  }

  Future<void> _onSetRegularity(
    SetRegularity event,
    Emitter<HabitEditingState> emit,
  ) async {
    _useCase.changeRegularity(event.regulatity);
    emit(RegularityChanged(regularity: event.regulatity));
  }

  Future<void> _onSetName(
    SetName event,
    Emitter<HabitEditingState> emit,
  ) async {
    _useCase.changeName(event.name);
    emit(NameChanged(name: event.name));
  }

  Future<void> _onSetIcon(
    SetIcon event,
    Emitter<HabitEditingState> emit,
  ) async {
    _useCase.changeIcon(event.icon);
    emit(IconChanged(icon: event.icon));
  }

  Future<void> _onOpenEmojiPicker(
    OpenEmojiPicker event,
    Emitter<HabitEditingState> emit,
  ) async {
    emit(EmojiPickerOpened());
  }

  Future<void> _onSetColor(
    SetColor event,
    Emitter<HabitEditingState> emit,
  ) async {
    _useCase.changeColor(event.color);
    emit(ColorChnaged(color: event.color));
  }

  Future<void> _onOpenColorPicker(
    OpenColorPicker event,
    Emitter<HabitEditingState> emit,
  ) async {
    emit(ColorPickerOpened());
  }

  Future<void> _onSetRepeat(
    SetRepeat event,
    Emitter<HabitEditingState> emit,
  ) async {
    _useCase.changeRepeat(event.repeat);
    emit(RepeatChanged(repeat: event.repeat));
  }

  Future<void> _onSetDayForRepeat(
    SetDayForRepeat event,
    Emitter<HabitEditingState> emit,
  ) async {
    _useCase.changeDays(event.days);
  }

  Future<void> _onSetHabitTime(
    SetHabitTime event,
    Emitter<HabitEditingState> emit,
  ) async {
    _useCase.changeRunTime(event.dayTimeType);
    emit(RunDayTimeChanged(dayTime: event.dayTimeType));
  }

  Future<void> _onSaveChanges(
    SaveChanges event,
    Emitter<HabitEditingState> emit,
  ) async {
    _useCase.saveHabit();
    emit(ChangesSaved());
  }
}
