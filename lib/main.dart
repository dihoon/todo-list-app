import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_list/screens/home_screen.dart';
import 'package:todo_list/styles/text_style.dart';

void main() async {
  await initializeDateFormatting();

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
