import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  final TextEditingController storeName = TextEditingController();
  final TextEditingController storeDescription = TextEditingController();
  final TextEditingController officialPhoneNumber = TextEditingController();
  final TextEditingController storeAddress = TextEditingController();
  final TextEditingController storeGSTNumber = TextEditingController();
  final TextEditingController storeGumastaNumber = TextEditingController();

  File? _image;

  File? get image => _image;

  void setImage(File? image) {
    _image = image;
    notifyListeners();
  }
 
 
 
  ////  create store /////////////////////////////////////////////////////

  String _selectedTime = 'Open';

  String _selectedClosedTime = 'Close';

  String get selectedTime => _selectedTime;

  String get selectedClosedTime => _selectedClosedTime;

  Future<void> Opening(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      _selectedTime = pickedTime.format(context);
      notifyListeners();
    }
  }

  Future<void> closedTiming(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      _selectedClosedTime = pickedTime.format(context);
      notifyListeners();
    }
  }
}
