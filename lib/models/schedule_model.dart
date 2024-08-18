import 'package:flutter/material.dart';

class ScheduleModel with ChangeNotifier {
  DateTime date;
  DateTime startTime;
  DateTime endTime;
  DateTime createdAt;
  DateTime? updatedAt;
  String content;
  bool isCompleted;

  ScheduleModel(
      {required this.date,
      required this.startTime,
      required this.endTime,
      required this.content,
      this.isCompleted = false,
      required this.createdAt,
      this.updatedAt});
}
