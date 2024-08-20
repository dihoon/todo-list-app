import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/calendar_model.dart';
import 'package:todo_list/screens/home_controller.dart';
import 'package:todo_list/styles/colors.dart';
import 'package:todo_list/widgets/calendar/calendar.dart';
import 'package:todo_list/widgets/todo_list/todo_list.dart';
import 'package:todo_list/widgets/todo_list_banner/todo_list_banner.dart';

class HomeScreen extends StatelessWidget with HomeController {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return ChangeNotifierProvider(
      create: (BuildContext context) => CalendarModel(
          DateTime.utc(now.year, now.month, now.day),
          DateTime.utc(now.year, now.month, now.day)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () => onFloatingButtonPressed(context),
              child: Icon(Icons.add, color: Colors.white),
              backgroundColor: AppColors.primary,
            );
          },
        ),
        body: SafeArea(
          child: Column(
            children: [
              Calendar(),
              TodoListBanner(),
              TodoList(),
            ],
          ),
        ),
      ),
    );
  }
}
