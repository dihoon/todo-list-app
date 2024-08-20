import 'package:drift/drift.dart';

class ScheduleTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get date => dateTime()();

  TextColumn get content => text()();

  BoolColumn get isCompleted => boolean()();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();
}
