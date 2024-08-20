import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_list/database/database.dart';
import 'package:todo_list/screens/home_screen.dart';
import 'package:todo_list/styles/text_style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  final database = AppDatabase();

  GetIt.instance.registerSingleton<AppDatabase>(database);

  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: "Jua Regular"),
      home: DefaultTextStyle(
        style: AppTextStyle,
        child: HomeScreen(),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KR'),
      ],
    ),
  );
}
