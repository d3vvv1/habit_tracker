import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';

class OkButton extends StatelessWidget {
  const OkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.appColors.base1,
        borderRadius: BorderRadius.circular(36),
      ),
      child: SizedBox(
        height: Adaptive.getHeight(60),
        width: Adaptive.getWidth(180),
        child: TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'OK', //TODO: Поменять хардкод
            style: context.appText.header4.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
