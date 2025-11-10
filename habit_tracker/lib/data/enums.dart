enum Genders {
  male,
  female;

  @override
  String toString() {
    switch (this) {
      case Genders.male:
        return 'male';
      case Genders.female:
        return 'female';
    }
  }

  static Genders fromString(String gender) {
    if (gender == 'male') {
      return Genders.male;
    } else if (gender == 'female') {
      return Genders.female;
    } else {
      throw Exception('UNDEFINED GENDER');
    }
  }
}

enum HabitRegularity {
  regularHabit,
  oneTimeTask,
}

enum HabitRepeat {
  daily,
  weekly,
  monthly,
}

enum DayNames {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

enum RunDayTime {
  morning,
  afternoon,
  evening,
}
