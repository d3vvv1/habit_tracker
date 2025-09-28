import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/features/profile/bloc/profile_event.dart';
import 'package:habit_tracker/features/profile/bloc/profile_state.dart';
import 'package:habit_tracker/features/profile/domain/profile_manager.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileManager _manager;
  ProfileBloc(super.initialState, {required ProfileManager manager})
      : _manager = manager {
    on<ChangeAvatar>(_onChangeAvatar);
    on<ChangeBirthDate>(_onChangeBirthDate);
    on<ChangeGender>(_onChangeGender);
    on<ChangeName>(_onChangeName);
    on<ChangeEmail>(_onChangeEmail);
  }

  Future<void> _onChangeAvatar(
    ChangeAvatar event,
    Emitter<ProfileState> emit,
  ) async {
    _manager.changeAvatar(event.newImage);
    emit(AvatarChanged(newAvatar: _manager.profile.avatar!));
  }

  Future<void> _onChangeName(
    ChangeName event,
    Emitter<ProfileState> emit,
  ) async {
    _manager.changeName(event.newName);
    emit(NameChanged(newName: _manager.profile.fullName!));
  }

  Future<void> _onChangeGender(
    ChangeGender event,
    Emitter<ProfileState> emit,
  ) async {
    _manager.changeGender(event.newGender);
    emit(GenderChanged(newGender: _manager.profile.gender!));
  }

  Future<void> _onChangeBirthDate(
    ChangeBirthDate event,
    Emitter<ProfileState> emit,
  ) async {
    _manager.changeBirthDate(event.newBirthDate);
    emit(BirthDateChanged(newBirthDate: _manager.profile.birthDate!));
  }

  Future<void> _onChangeEmail(
    ChangeEmail event,
    Emitter<ProfileState> emit,
  ) async {
    _manager.changeEmail(event.newEmail);
    emit(EmailChanged(newEmail: _manager.profile.email));
  }
}
