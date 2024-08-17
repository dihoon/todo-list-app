import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/models/calendar_model.dart';
import 'package:todo_list/styles/colors.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    final calendarModel = Provider.of<CalendarModel>(context);

    return TableCalendar(
      locale: 'ko_KR',
      headerStyle: const HeaderStyle(formatButtonVisible: false),
      calendarStyle: CalendarStyle(
          isTodayHighlighted: false,
          defaultDecoration: const BoxDecoration(color: Colors.transparent),
          selectedDecoration: BoxDecoration(
            color: AppColors.primary,
            border: Border.all(
              width: 1.0,
              color: AppColors.primary,
            ),
          ),
          selectedTextStyle: const TextStyle(
            color: Colors.white,
          )),
      daysOfWeekHeight: 20,
      focusedDay: calendarModel.currentViewDate ?? DateTime.now(),
      firstDay: DateTime(1900),
      lastDay: DateTime(3000),
      pageJumpingEnabled: true,
      selectedDayPredicate: (DateTime date) =>
          calendarModel.selectedDate == date,
      onDaySelected: (selectedDay, focusedDay) {
        calendarModel.selectedDate = selectedDay;
        calendarModel.currentViewDate = focusedDay;
      },
    );
  }
}
