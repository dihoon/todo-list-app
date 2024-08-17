import 'package:flutter/material.dart';

class CalendarModel with ChangeNotifier {
  DateTime? _selectedDate;
  DateTime? _currentViewDate;

  DateTime? get selectedDate => _selectedDate;

  set selectedDate(DateTime? date) {
    _selectedDate = date;
    notifyListeners();
  }

  DateTime? get currentViewDate => _currentViewDate;

  set currentViewDate(DateTime? date) {
    _currentViewDate = date;
    notifyListeners();
  }
}
