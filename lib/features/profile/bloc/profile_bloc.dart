import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/features/profile/bloc/profile_event.dart';
import 'package:habit_tracker/features/profile/bloc/profile_state.dart';
import 'package:habit_tracker/features/profile/domain/image_picker_manager.dart';
import 'package:habit_tracker/features/profile/domain/profile_interface.dart';
import 'package:habit_tracker/features/profile/domain/profile_manager.dart';
import 'package:image_picker/image_picker.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  // final ProfileInterface _manager = GetIt.instance<>();
  final ProfileInterface _manager = ProfileManager();
  ProfileBloc() : super(Test()) {
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
    XFile? res = await ImagePickerManager.pickImageFromGallery();
    if (res != null) {
      var bytes = await res.readAsBytes();
      _manager.setAvatar(bytes);
      emit(AvatarChanged(newAvatar: bytes));
    }

    emit(AvatarChanged(newAvatar: _manager.avatar));
  }

  Future<void> _onChangeName(
    ChangeName event,
    Emitter<ProfileState> emit,
  ) async {
    _manager.setName(event.newName);
    emit(NameChanged(newName: _manager.name));
  }

  Future<void> _onChangeGender(
    ChangeGender event,
    Emitter<ProfileState> emit,
  ) async {
    _manager.setGender(event.newGender);
    emit(GenderChanged(newGender: _manager.gender));
  }

  Future<void> _onChangeBirthDate(
    ChangeBirthDate event,
    Emitter<ProfileState> emit,
  ) async {
    _manager.setBirthday(event.newBirthDate);
    emit(BirthDateChanged(newBirthDate: _manager.birthDate));
  }

  Future<void> _onChangeEmail(
    ChangeEmail event,
    Emitter<ProfileState> emit,
  ) async {
    _manager.setEmail(event.newEmail);
    emit(EmailChanged(newEmail: _manager.email));
  }
}
