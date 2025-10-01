import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.pop();
      },
      icon: Icon(
        Icons.arrow_back,
        color: context.appColors.base4,
      ),
    );
  }
}
