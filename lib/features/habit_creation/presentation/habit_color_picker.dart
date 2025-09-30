import 'package:flutter/material.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';
import 'package:habit_tracker/main.dart';

//TODO: Сделать диалог с выбором цвета из палитры
class HabitColorPicker extends StatefulWidget {
  const HabitColorPicker({super.key});

  @override
  State<HabitColorPicker> createState() => _HabitColorPickerState();
}

class _HabitColorPickerState extends State<HabitColorPicker> {
  List<Color> colors = [
    Colors.pink,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.lime,
    Colors.red,
    Colors.blueGrey,
    Colors.purpleAccent,
    Colors.tealAccent,
    Colors.limeAccent,
    Colors.deepPurple,
    Colors.brown,
    Colors.deepOrangeAccent,
    Colors.amberAccent,
  ];

  late Color selectedColor = colors.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppWords.of(context).color,
            style: context.appText.header3,
          ),
        ),
        SizedBox(
          height: Adaptive.getHeight(20),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: Adaptive.getHeight(10),
          crossAxisSpacing: Adaptive.getWidth(10),
          crossAxisCount: 5,
          children: colors.map((Color color) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedColor = color;
                });
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: selectedColor == color
                    ? Padding(
                        padding: EdgeInsets.all(Adaptive.getByMin(10)),
                        child: const FittedBox(
                          fit: BoxFit.contain,
                          child: Icon(
                            Icons.check,
                            color: Colors.black,
                          ),
                        ),
                      )
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
