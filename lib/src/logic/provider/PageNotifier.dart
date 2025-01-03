import 'package:flutter/material.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/data/vendor_otpModel.dart';
import 'package:vendor_app/src/logic/repo/auth_repo.dart';

class PageNotifier extends ChangeNotifier {
  int _currentIndex = 0;
  final int _totalPages = 4; // Set total number of pages
  final PageController _pageController = PageController();

  final TextEditingController name = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =TextEditingController();

  

  int get currentIndex => _currentIndex;
  PageController get pageController => _pageController;

  

  // Calculate progress as a percentage
  double get progress => (_currentIndex + 1) / _totalPages;

  final _authRepo = getIt<AuthRepo>();
  String numberwithCode = '';

  Future<bool> sendOtp(
      String number, BuildContext context, String country_code) async {
    context.showLoader(show: true);

    var data = {"phone": country_code + number};

    numberwithCode = country_code + number;

    try {
      var response = await _authRepo.sendOtp(data);
      print("check response ${response}");
      context.showLoader(show: false);
      return true;
    } catch (e) 
    {
      print("Error sending OTP: $e");
      context.showLoader(show: false);
      return false;
    }
  }

  Future<bool> verifiOtp(String otp, BuildContext context) async {
    context.showLoader(show: true);
    var data = {
      "phone": numberwithCode,
      "otp": otp,
    };

    print("check response ${data}");

    try {
      var response = await _authRepo.verifyOtp(data);

      context.showLoader(show: false);
      return true;
    } catch (e) 
    {
      context.showLoader(show: false);
      print("Error sending OTP: $e");
      return false;
    }
  }

  //vendorRegister

  Future<bool> vendorRegister(BuildContext context) async {
    context.showLoader(show: true);
    var data = 
    {
      "firstName": await SharedPrefUtils.getFirstName(),
      "lastName": await SharedPrefUtils.getLastName(),
      "email": await SharedPrefUtils.getEmail(),
      "password": await SharedPrefUtils.getPassword(),
      "vendorType": "individual",
      "vendorTermsAccepted": _isChecked
    };

   

    try {
      
      var response = await _authRepo.vendorRegister(data);
      print("check response ${response}");
      context.showLoader(show: false);
      return true;
    } catch (e) 
    {
       context.showLoader(show: false);
      print("Error sending OTP: $e");
      return false;
    }
  }

  void goToNextPage() {
    // Ensure that the current index is updated correctly
    if (_currentIndex < _totalPages - 1) {
      _currentIndex++; // Increment the index here
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      notifyListeners(); // Notify listeners to update the view
    }
  }

  void goToPage(int index) {
    if (index >= 0 && index < _totalPages) {
      _currentIndex = index;
      print("Navigating to page: $_currentIndex"); // Debug print
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool _isChecked = false;

  bool get isChecked => _isChecked;

  void toggleCheckbox(bool value) {
    _isChecked = value;
    notifyListeners();
  }
}
