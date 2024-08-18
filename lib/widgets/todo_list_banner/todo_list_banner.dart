import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/calendar_model.dart';
import 'package:todo_list/styles/colors.dart';

class TodoListBanner extends StatefulWidget {
  const TodoListBanner({super.key});

  @override
  State<TodoListBanner> createState() => _TodoListBannerState();
}

class _TodoListBannerState extends State<TodoListBanner> {
  @override
  Widget build(BuildContext context) {
    final calendarModel = Provider.of<CalendarModel>(context);
    final selectedDate = calendarModel.selectedDate!;

    return Container(
      color: AppColors.primary,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                "${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일"),
            SizedBox(width: 100),
            Flexible(
              child: Text(
                '0개',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
