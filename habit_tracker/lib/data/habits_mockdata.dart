import 'package:flutter/material.dart';
import 'package:habit_tracker/data/emoji_list.dart';
import 'package:habit_tracker/data/habit_basic_data.dart';

class HabitsMockdata {
  static List<HabitBasic> habits = [
    HabitBasic(
        name: 'Читать книгу',
        icon: EmojiList.emojiList[0],
        color: Colors.brown.shade200,
        id: 0),
    HabitBasic(
        name: 'Медитировать',
        icon: EmojiList.emojiList[1],
        color: Colors.grey.shade300,
        id: 1),
    HabitBasic(
        name: 'Выпивать стакан воды утром',
        icon: EmojiList.emojiList[2],
        color: Colors.blueGrey.shade100,
        id: 2),
    HabitBasic(
        name: 'Делать зарядку',
        icon: EmojiList.emojiList[3],
        color: Colors.lightBlue.shade100,
        id: 3),
    HabitBasic(
        name: 'Отдыхать перед сном',
        icon: EmojiList.emojiList[4],
        color: Colors.deepPurpleAccent.shade100,
        id: 4),
    HabitBasic(
        name: 'Ходить пешком',
        icon: EmojiList.emojiList[5],
        color: Colors.green.shade100,
        id: 5),
    HabitBasic(
        name: 'Заправлять кровать',
        icon: EmojiList.emojiList[6],
        color: Colors.pink.shade100,
        id: 6),
    HabitBasic(
        name: 'Учить иностранный язык',
        icon: EmojiList.emojiList[7],
        color: Colors.indigo.shade100,
        id: 7),
    HabitBasic(
        name: 'Размышлять',
        icon: EmojiList.emojiList[8],
        color: Colors.amber.shade100,
        id: 8),
    HabitBasic(
        name: 'Собирать рабочий стол',
        icon: EmojiList.emojiList[9],
        color: Colors.teal.shade100,
        id: 9),
  ];
}
