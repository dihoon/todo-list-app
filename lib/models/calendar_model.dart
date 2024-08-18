import 'package:flutter/material.dart';

class CalendarModel with ChangeNotifier {
  DateTime? _selectedDate;
  DateTime? _currentViewDate;

  CalendarModel(this._selectedDate, this._currentViewDate);

  DateTime? get selectedDate => _selectedDate;

  set selectedDate(DateTime? date) {
    if (_selectedDate != date) {
      _selectedDate = date;
      notifyListeners();
    }
  }

  DateTime? get currentViewDate => _currentViewDate;

  set currentViewDate(DateTime? date) {
    if (_currentViewDate != date) {
      _currentViewDate = date;
      notifyListeners();
    }
  }
}
