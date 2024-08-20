import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:todo_list/tables/ScheduleTable.dart';

part 'database.g.dart';

@DriftDatabase(tables: [ScheduleTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  Future<List<ScheduleTableData>> getSchedules(DateTime date) {
    return (select(scheduleTable)..where((table) => table.date.equals(date)))
        .get();
  }

  Future<Map<DateTime, List<bool>>> getScheduleEvents(
      int year, int month) async {
    final firstDay = DateTime(year, month, 1);
    final lastDay = DateTime(year, month + 1, 0);

    final schedules = await (select(scheduleTable)
          ..where((table) => table.date.isBetweenValues(firstDay, lastDay)))
        .get();

    List<DateTime> dates = schedules
        .map((schedule) => DateTime.utc(
            schedule.date.year, schedule.date.month, schedule.date.day))
        .toSet()
        .toList();

    Map<DateTime, List<bool>> eventMap = {};

    for (DateTime event in dates) {
      eventMap[event] = [true];
    }
    return eventMap;
  }

  Stream<List<ScheduleTableData>> getStreamSchedulesByDate(DateTime date) {
    return (select(scheduleTable)..where((table) => table.date.equals(date)))
        .watch();
  }

  Future<int> createSchedule(ScheduleTableCompanion data) =>
      into(scheduleTable).insert(data);

  Future<int> updateScheduleById(int id, ScheduleTableCompanion data) {
    return (update(scheduleTable)..where((table) => table.id.equals(id)))
        .write(data);
  }

  Future<int> removeScheduleById(int id) {
    return (delete(scheduleTable)..where((table) => table.id.equals(id))).go();
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationCacheDirectory();

    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = await getTemporaryDirectory();

    sqlite3.tempDirectory = cachebase.path;

    return NativeDatabase.createInBackground(file);
  });
}
