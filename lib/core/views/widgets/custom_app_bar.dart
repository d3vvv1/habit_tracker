import 'package:flutter/material.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? backButton;
  final Widget title;
  final double horizontalPadding;
  final Color backgroundColor;

  const CustomAppBar(
      {super.key,
      required this.backButton,
      required this.title,
      required this.horizontalPadding,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          // top: Adaptive.viewPaddingTop,
          left: horizontalPadding,
          right: horizontalPadding),
      child: SizedBox(
        width: preferredSize.width,
        height: preferredSize.height,
        child: ColoredBox(
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (backButton != null) backButton!,
              Expanded(child: title),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, Adaptive.getHeight(60));
}
