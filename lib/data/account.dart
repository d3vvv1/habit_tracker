import 'package:habit_tracker/data/report.dart';

class Account {
  final String email;
  final String password;
  final String profilePhoto;
  final Report report;

  Account(
      {required this.email,
      required this.password,
      required this.profilePhoto,
      required this.report});
}
