import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.appColors.base4,
      child: SizedBox(
        width: double.infinity,
        height: Adaptive.getByMin(0.5),
      ),
    );
  }
}
