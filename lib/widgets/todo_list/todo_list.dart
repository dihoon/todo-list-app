import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/database/database.dart';
import 'package:todo_list/models/calendar_model.dart';
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

    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: StreamBuilder<List<ScheduleTableData>>(
            stream: GetIt.instance<AppDatabase>()
                .getStreamSchedulesByDate(selectedDate!),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container();
              }

              final schedules = snapshot.data!;

              return ListView.builder(
                  itemBuilder: (context, index) {
                    if (index == schedules.length) {
                      return Padding(
                        padding: EdgeInsets.only(top: 50),
                      );
                    }
                    final schedule = schedules[index];

                    return Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Dismissible(
                        key: ObjectKey(schedule.id),
                        direction: DismissDirection.endToStart,
                        confirmDismiss: (DismissDirection direction) async {
                          await GetIt.instance<AppDatabase>()
                              .removeScheduleById(schedule.id);
                          return true;
                        },
                        child: Todo(
                            id: schedule.id,
                            content: schedule.content,
                            isCompleted: schedule.isCompleted),
                      ),
                    );
                  },
                  itemCount: schedules.length + 1);
            }),
      ),
    );
  }
}
