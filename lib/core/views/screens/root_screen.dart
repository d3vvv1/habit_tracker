import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';

class RootScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const RootScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: navigationShell),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: context.appColors.base2,
        selectedItemColor: context.appColors.base1,
        selectedLabelStyle:
            context.appText.header4.copyWith(color: context.appColors.base1),
        unselectedItemColor: context.appColors.base4,
        unselectedLabelStyle: context.appText.header4,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
            ),
            label: AppWords.of(context).home,
          ),
          // BottomNavigationBarItem(
          //   icon: const Icon(
          //     Icons.data_thresholding_outlined,
          //   ),
          //   label: AppWords.of(context).report,
          // ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.person,
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
