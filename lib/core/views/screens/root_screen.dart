import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/main.dart';

class RootScreen extends StatelessWidget {
  /// Контейнер для навигационного бара.
  final StatefulNavigationShell navigationShell;
  const RootScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        /// Лист элементов для нижнего навигационного бара.
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: navigationShell.currentIndex == 0
                  ? context.appColors.base1
                  : context.appColors.base4,
            ),
            label: AppWords.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.data_thresholding_outlined,
              color: navigationShell.currentIndex == 1
                  ? context.appColors.base1
                  : context.appColors.base4,
            ),
            label: AppWords.of(context).report,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: navigationShell.currentIndex == 2
                  ? context.appColors.base1
                  : context.appColors.base4,
            ),
            label: AppWords.of(context).account,
          ),
        ],

        /// Текущий индекс нижнего навигационного бара.
        currentIndex: navigationShell.currentIndex,

        /// Обработчик нажатия на элемент нижнего навигационного бара.
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }
}
