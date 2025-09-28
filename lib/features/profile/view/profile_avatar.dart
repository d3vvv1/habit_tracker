import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/profile/bloc/profile_bloc.dart';
import 'package:habit_tracker/features/profile/bloc/profile_state.dart';

//TODO: Сделать смену аватрки из галереи
class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) =>
          (current is InitProfile || current is AvatarChanged),
      builder: (context, state) {
        Image? avatar;
        if (state is InitProfile) {
          avatar = state.profile.avatar;
        }
        if (state is AvatarChanged) {
          avatar = state.newAvatar;
        }
        return CircleAvatar(
          radius: Adaptive.getHeight(80),
          child: ClipOval(
            child: avatar ??
                Icon(
                  Icons.camera_alt,
                  size: Adaptive.getHeight(70),
                  color: Colors.white,
                ),
          ),
        );
      },
    );
  }
}
