import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/widgets/separator.dart';

class ErrorModalBottomSheet extends StatelessWidget {
  final String errorText;
  const ErrorModalBottomSheet({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: context.appColors.base2,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )),
      child: SizedBox(
        height: Adaptive.getHeight(250),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Adaptive.getWidth(25),
            vertical: Adaptive.getHeight(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppWords.of(context).error,
                style: context.appText.header3.copyWith(
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: Adaptive.getHeight(10),
              ),
              const Separator(),
              SizedBox(
                height: Adaptive.getHeight(10),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    errorText,
                    style: context.appText.header4,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
