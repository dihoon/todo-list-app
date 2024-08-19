import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/calendar_model.dart';
import 'package:todo_list/models/schedule_model.dart';
import 'package:todo_list/widgets/todo/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final selectedDate = Provider.of<CalendarModel>(context).selectedDate;

    final schedules = [
      ScheduleModel(
          date: DateTime(2024, 8, 16),
          startTime: DateTime(2024, 8, 16, 12),
          endTime: DateTime(2024, 8, 16, 13),
          content: 'test',
          isCompleted: false,
          createdAt: DateTime.now().toUtc()),
      ScheduleModel(
          date: DateTime(2024, 8, 16),
          startTime: DateTime(2024, 8, 16, 12),
          endTime: DateTime(2024, 8, 16, 13),
          content: 'test',
          isCompleted: false,
          createdAt: DateTime.now().toUtc()),
      ScheduleModel(
          date: DateTime(2024, 8, 16),
          startTime: DateTime(2024, 8, 16, 12),
          endTime: DateTime(2024, 8, 16, 13),
          content: 'test',
          isCompleted: false,
          createdAt: DateTime.now().toUtc()),
      ScheduleModel(
          date: DateTime(2024, 8, 16),
          startTime: DateTime(2024, 8, 16, 12),
          endTime: DateTime(2024, 8, 16, 13),
          content: 'test',
          isCompleted: false,
          createdAt: DateTime.now().toUtc())
    ];

    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ListView.builder(
            itemBuilder: (context, index) {
              if (index == schedules.length) {
                return Padding(
                  padding: EdgeInsets.only(top: 50),
                );
              }
              return Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Todo(
                    startTime: schedules[index].startTime,
                    endTime: schedules[index].endTime,
                    content: schedules[index].content,
                    isCompleted: schedules[index].isCompleted),
              );
            },
            itemCount: schedules.length + 1),
      ),
    );
  }
}
