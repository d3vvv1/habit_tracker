import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker/core/extensions/build_context_extension.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/widgets/custom_app_bar.dart';
import 'package:habit_tracker/data/habit_basic_data.dart';
import 'package:habit_tracker/features/habit_editing/presentation/habit_create_floating_button.dart';
import 'package:habit_tracker/features/habits_check/domain/repositories/habit_repository_interface.dart';
import 'package:habit_tracker/features/habits_check/view/habit_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HabitRepositoryInterface _habitRepository =
      GetIt.instance<HabitRepositoryInterface>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.appColors.base2,
        resizeToAvoidBottomInset: false,
        floatingActionButton: const HabitCreateFloatingButton(),
        appBar: CustomAppBar(
            backButton: null,
            title: Text(
              AppWords.of(context).home,
              style: context.appText.header3,
              textAlign: TextAlign.center,
            ),
            horizontalPadding: Adaptive.getWidth(20),
            backgroundColor: context.appColors.base2),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Adaptive.getWidth(20),
          ),
          child: FutureBuilder(
              future: _habitRepository.init(),
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: context.appColors.base3,
                      color: context.appColors.base1,
                    ),
                  );
                } else {
                  if (asyncSnapshot.hasError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          AppWords.of(context).error,
                          style: context.appText.header1
                              .copyWith(color: Colors.red),
                        ),
                        Text(
                          asyncSnapshot.error.toString(),
                          style: context.appText.header4,
                        ),
                      ],
                    );
                  } else {
                    List<HabitBasic> completedHabits =
                        _habitRepository.completedHabits;
                    List<HabitBasic> unCompletedHabits =
                        _habitRepository.unCompletedHabits;
                    return ValueListenableBuilder(
                        valueListenable: _habitRepository.valueNotifier,
                        builder: (context, value, child) {
                          return ListView(
                            children: [
                              //TODO: Сделать фильтр Сегодня / Неделя / Месяц
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: unCompletedHabits.length,
                                itemBuilder: (context, index) => HabitCard(
                                  id: unCompletedHabits[index].id,
                                  name: unCompletedHabits[index].name!,
                                  color: unCompletedHabits[index].color!,
                                  icon: unCompletedHabits[index].icon!,
                                  isCompleted: false,
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  height: Adaptive.getHeight(10),
                                ),
                              ),
                              SizedBox(
                                height: Adaptive.getHeight(25),
                              ),
                              Row(
                                children: [
                                  Text(
                                    AppWords.of(context).completed,
                                    style: context.appText.header6.copyWith(
                                        color: context.appColors.base4),
                                  ),
                                  SizedBox(
                                    width: Adaptive.getWidth(8),
                                  ),
                                  Expanded(
                                    child: ColoredBox(
                                      color: context.appColors.base4,
                                      child: SizedBox(
                                        height: Adaptive.getByMin(0.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Adaptive.getHeight(20),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: completedHabits.length,
                                itemBuilder: (context, index) => HabitCard(
                                  id: completedHabits[index].id,
                                  name: completedHabits[index].name!,
                                  color: completedHabits[index].color!,
                                  icon: completedHabits[index].icon!,
                                  isCompleted: true,
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  height: Adaptive.getHeight(15),
                                ),
                              ),
                            ],
                          );
                        });
                  }
                }
              }),
        ));
  }
}
