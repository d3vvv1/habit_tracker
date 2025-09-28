import 'package:flutter/material.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/core/views/widgets/custom_app_bar.dart';
import 'package:habit_tracker/core/views/widgets/separator.dart';
import 'package:habit_tracker/features/habits_check/data/habits_mockdata.dart';
import 'package:habit_tracker/features/habits_check/view/habit_card.dart';
import 'package:habit_tracker/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HabitsMockdata data = HabitsMockdata();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.appColors.base2,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            backButton: null,
            title: Text(
              AppWords.of(context).home,
              style: context.appText.header3,
            ),
            horizontalPadding: Adaptive.getWidth(20),
            actions: [],
            backgroundColor: context.appColors.base2),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Adaptive.getWidth(20),
          ),
          child: ListView(
            children: [
              //TODD: Сделать фильтр Сегодня / Неделя / Месяц
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.unCompletedHabits.length,
                itemBuilder: (context, index) => HabitCard(
                  id: index,
                  name: data.unCompletedHabits[index].name,
                  color: data.unCompletedHabits[index].color,
                  icon: data.unCompletedHabits[index].icon,
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
                    'Completed',
                    // AppWords.of(context).completed,
                    style: context.appText.header6
                        .copyWith(color: context.appColors.base4),
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
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.completedHabits.length,
                itemBuilder: (context, index) => HabitCard(
                  id: null,
                  name: data.completedHabits[index].name,
                  color: data.completedHabits[index].color,
                  icon: data.completedHabits[index].icon,
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: Adaptive.getHeight(15),
                ),
              ),
            ],
          ),
        ));
  }
}
