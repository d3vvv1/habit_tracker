import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/features/profile/bloc/profile_bloc.dart';
import 'package:habit_tracker/features/profile/bloc/profile_event.dart';
import 'package:habit_tracker/features/profile/bloc/profile_state.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) =>
          (current is InitProfile || current is AvatarChanged),
      builder: (context, state) {
        Uint8List? avatar;
        if (state is InitProfile) {
          avatar = state.avatar;
        }
        if (state is AvatarChanged) {
          avatar = state.newAvatar;
        }
        return InkWell(
          customBorder: const CircleBorder(),
          onTap: () => context.read<ProfileBloc>().add(ChangeAvatar()),
          child: CircleAvatar(
            backgroundColor: context.appColors.base3,
            radius: Adaptive.getHeight(80),
            child: ClipOval(
              child: avatar != null
                  ? Image.memory(
                      avatar,
                    )
                  : Icon(
                      Icons.camera_alt,
                      size: Adaptive.getHeight(70),
                      color: context.appColors.base4,
                    ),
            ),
          ),
        );
      },
    );
  }
}
