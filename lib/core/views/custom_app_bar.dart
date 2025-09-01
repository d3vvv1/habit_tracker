import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? backButton;
  final List<Widget> actions;
  final Widget title;
  final double horizontalPadding;

  const CustomAppBar(
      {super.key,
      required this.backButton,
      required this.title,
      required this.horizontalPadding,
      required this.actions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          //top: mediaQuery.viewPadding.top,
          left: horizontalPadding,
          right: horizontalPadding),
      child: SizedBox(
        width: preferredSize.width,
        height: preferredSize.height,
        child: ColoredBox(
          color: Theme.of(context).scaffoldBackgroundColor,
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
  Size get preferredSize => Size(double.infinity, 50);
}
