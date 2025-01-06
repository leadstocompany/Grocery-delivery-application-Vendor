import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/logic/repo/auth_repo.dart';

class DaySelectionProvider with ChangeNotifier {
  List<String> _selectedDays = [];

  List<String> get selectedDays => _selectedDays;
  final _authRepo = getIt<AuthRepo>();

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

  final TextEditingController bankName = TextEditingController();
  final TextEditingController accountHoldername = TextEditingController();
  final TextEditingController accountNumber = TextEditingController();
  final TextEditingController ifscCode = TextEditingController();
  final TextEditingController appwithdrawalPin = TextEditingController();

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

  String _pin = '';
  String _confirmPin = '';
  bool _isMatch = true;

  String get pin => _pin;
  String get confirmPin => _confirmPin;
  bool get isMatch => _isMatch;

  void setPin(String pin) {
    _pin = pin;
    _validatePins();
  }

  void setConfirmPin(String confirmPin) {
    _confirmPin = confirmPin;
    _validatePins();
  }

  void _validatePins() {
    _isMatch = _pin == _confirmPin;
    notifyListeners();
  }

  void reset() {
    _pin = '';
    _confirmPin = '';
    _isMatch = true;
    notifyListeners();
  }

  // create store

  // Dynamically build the operateDates map
  Map<String, bool> getOperateDates(List<String> selectedDays) {
    // Define all possible days
    List<String> allDays = [
      'monday',
      'tuesday',
      'wednesday',
      'thursday',
      'friday',
      'saturday',
      'sunday'
    ];

    // Create the operateDates map
    Map<String, bool> operateDates = {
      for (var day in allDays)
        day: selectedDays.map((e) => e.toLowerCase()).contains(day)
    };

    return operateDates;
  }

  Future<bool> createStore(BuildContext context) async {
    context.showLoader(show: true);

    var data = {
      "storeName": storeName.text,
      "storeDescription": storeDescription.text,
      "officialPhoneNumber": officialPhoneNumber.text,
      "storeAddress": storeAddress.text,
      "gstNumber": storeGSTNumber.text,
      "gumastaNumber": storeGumastaNumber.text,
      "storePicture": image!.path.split('/').last,
      "operateDates": getOperateDates(selectedDays),
      "operateTimes": {
        "startTime": selectedTime,
        "endTime": selectedClosedTime
      },
      "paymentDetails": {
        "bankName": bankName.text,
        "accountHolder": accountHoldername.text,
        "accountNumber": accountNumber.text,
        "ifscCode": ifscCode.text,
        "appWithdrawalPin": confirmPin.toString()
      }
    };

    try {
      var result = await _authRepo.createStore(data);

      context.showLoader(show: false);

      return result.fold(
        (error) {
          // Show error Snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.message),
              backgroundColor: Colors.red,
            ),
          );
          return false; // Login failed
        },
        (response) {
          // Login success
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Store created successful!"),
              backgroundColor: Colors.green,
            ),
          );
          return true;
        },
      );
    } catch (e) {
      context.showLoader(show: false);
      print("Unexpected error: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Something went wrong. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }
}
