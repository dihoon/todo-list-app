import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/calendar_model.dart';
import 'package:todo_list/widgets/calendar/calendar.dart';
import 'package:todo_list/widgets/todo_list_banner/todo_list_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (BuildContext context) => CalendarModel(
            DateTime.utc(now.year, now.month, now.day),
            DateTime.utc(now.year, now.month, now.day),
          ),
          child: Column(
            children: [
              Calendar(),
              TodoListBanner(),
            ],
          ),
        ),
      ),
    );
  }
}
