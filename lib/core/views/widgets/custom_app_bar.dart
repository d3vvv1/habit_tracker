import 'package:flutter/material.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? backButton;
  final List<Widget> actions;
  final Widget title;
  final double horizontalPadding;
  final Color backgroundColor;

  const CustomAppBar(
      {super.key,
      required this.backButton,
      required this.title,
      required this.horizontalPadding,
      required this.actions,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Adaptive.viewPaddingTop,
          left: horizontalPadding,
          right: horizontalPadding),
      child: SizedBox(
        width: preferredSize.width,
        height: preferredSize.height,
        child: ColoredBox(
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (backButton != null) Flexible(child: backButton!),
                ],
              )),
              Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(child: title),
                    ],
                  )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions,
              )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, Adaptive.getHeight(60));
}
