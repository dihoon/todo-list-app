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
          createdAt: DateTime.now().toUtc())
    ];

    return Expanded(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Todo(
                startTime: schedules[index].startTime,
                endTime: schedules[index].endTime,
                content: schedules[index].content,
                isCompleted: schedules[index].isCompleted);
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 8);
          },
          itemCount: schedules.length),
    ));
  }
}
