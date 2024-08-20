import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/database/database.dart';
import 'package:todo_list/models/calendar_model.dart';
import 'package:todo_list/styles/colors.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? content;

  @override
  Widget build(BuildContext context) {
    final database = GetIt.instance<AppDatabase>();

    final calendarModel = Provider.of<CalendarModel>(context);

    return Form(
      key: formkey,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: '오늘의 할 일',
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.primary, width: 2)),
                  ),
                  onSaved: (content) {
                    this.content = content;
                  },
                ),
              ),
              IconButton(
                  onPressed: () async {
                    formkey.currentState!.save();
                    if (content!.isNotEmpty) {
                      database.createSchedule(ScheduleTableCompanion(
                        date: Value(calendarModel.selectedDate!),
                        content: Value(content!),
                        isCompleted: Value(false),
                      ));
                    }
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_circle_up))
            ],
          ),
        ),
      ),
    );
  }
}
