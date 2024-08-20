import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/calendar_model.dart';
import 'package:todo_list/widgets/custom_bottom_sheet/custom_bottom_sheet.dart';

mixin HomeController {
  void onFloatingButtonPressed(BuildContext context) async {
    final calendarModel = Provider.of<CalendarModel>(context, listen: false);

    showModalBottomSheet(
        context: context,
        builder: (_) {
          return ListenableProvider.value(
              value: calendarModel, child: CustomBottomSheet());
        });
  }
}
