import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/features/profile/bloc/profile_event.dart';
import 'package:habit_tracker/features/profile/bloc/profile_state.dart';
import 'package:habit_tracker/features/profile/domain/image_picker_manager.dart';
import 'package:habit_tracker/features/profile/domain/profile_use_case.dart';
import 'package:image_picker/image_picker.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCase _useCase = ProfileUseCase();
  ProfileBloc() : super(InitalState()) {
    on<Initialize>(_onInitialize);
    on<ChangeAvatar>(_onChangeAvatar);
    on<ChangeBirthDate>(_onChangeBirthDate);
    on<ChangeGender>(_onChangeGender);
    on<ChangeName>(_onChangeName);
    on<ChangeEmail>(_onChangeEmail);

    add(Initialize());
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<ProfileState> emit,
  ) async {
    emit(Loading());
    bool res = await _useCase.getAvatar();
    log('Avatar load success? - $res');
    emit(
      InitProfile(
        fullName: _useCase.name,
        gender: _useCase.gender,
        birthDate: _useCase.birthDate,
        avatar: _useCase.avatar,
        email: _useCase.email,
      ),
    );
  }

  Future<void> _onChangeAvatar(
    ChangeAvatar event,
    Emitter<ProfileState> emit,
  ) async {
    XFile? res = await ImagePickerManager.pickImageFromGallery();
    if (res != null) {
      var bytes = await res.readAsBytes();
      _useCase.setAvatar(bytes);
      emit(AvatarChanged(newAvatar: bytes));
    }
  }

  Future<void> _onChangeName(
    ChangeName event,
    Emitter<ProfileState> emit,
  ) async {
    _useCase.setName(event.newName);
    if (_useCase.name != null) {
      emit(NameChanged(newName: _useCase.name!));
    }
  }

  Future<void> _onChangeGender(
    ChangeGender event,
    Emitter<ProfileState> emit,
  ) async {
    _useCase.setGender(event.newGender);
    if (_useCase.gender != null) {
      emit(GenderChanged(newGender: _useCase.gender!));
    }
  }

  Future<void> _onChangeBirthDate(
    ChangeBirthDate event,
    Emitter<ProfileState> emit,
  ) async {
    _useCase.setBirthday(event.newBirthDate);
    if (_useCase.birthDate != null) {
      emit(BirthDateChanged(newBirthDate: _useCase.birthDate!));
    }
  }

  Future<void> _onChangeEmail(
    ChangeEmail event,
    Emitter<ProfileState> emit,
  ) async {
    _useCase.setEmail(event.newEmail);
    emit(EmailChanged(newEmail: _useCase.email));
  }
}
