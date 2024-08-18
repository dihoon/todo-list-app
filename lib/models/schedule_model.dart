import 'package:flutter/material.dart';

class ScheduleModel with ChangeNotifier {
  DateTime date;
  DateTime startDate;
  DateTime endDate;
  DateTime createdAt;
  DateTime? updatedAt;
  String content;
  bool isCompleted;

  ScheduleModel(
      {required this.date,
      required this.startDate,
      required this.endDate,
      required this.content,
      this.isCompleted = false,
      required this.createdAt,
      this.updatedAt});
}
