import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Adaptive.getHeight(35),
      width: Adaptive.getHeight(35),
      child: IconButton(
        onPressed: () {
          context.pop();
        },
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.arrow_back,
          size: Adaptive.getHeight(35),
          color: context.appColors.base4,
        ),
      ),
    );
  }
}
