import 'package:flutter/material.dart';

class DaySelectionProvider with ChangeNotifier {
  List<String> _selectedDays = [];

  List<String> get selectedDays => _selectedDays;

  void toggleDay(String day) {
    if (_selectedDays.contains(day)) {
      _selectedDays.remove(day);
    } else {
      _selectedDays.add(day);
    }
    notifyListeners();
  }

  void removeDay(String day) {
    _selectedDays.remove(day);
    notifyListeners();
  }
}
