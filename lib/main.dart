import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_list/screens/home_screen.dart';
import 'package:todo_list/styles/theme.dart';

void main() async {
  await initializeDateFormatting();

  runApp(
    MaterialApp(
      theme: theme,
      home: HomeScreen(),
    ),
  );
}
