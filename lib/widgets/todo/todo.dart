import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/database/database.dart';

class Todo extends StatelessWidget {
  final int id;
  final String content;
  final bool isCompleted;

  const Todo({
    super.key,
    required this.id,
    required this.content,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    final database = GetIt.instance<AppDatabase>();

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: Colors.black,
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Text(content)),
                IconButton(
                  iconSize: 30,
                  color: Colors.black,
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    database.updateScheduleById(
                        id,
                        ScheduleTableCompanion(
                            isCompleted: Value(!isCompleted)));
                  },
                  icon: Icon(isCompleted
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank),
                ),
              ],
            ),
          ),
        ));
  }
}
