import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/core/utiils_lib/snack_bar.dart';
import 'package:vendor_app/src/data/store_model.dart';
import 'package:vendor_app/src/logic/repo/auth_repo.dart';
import 'package:vendor_app/src/logic/repo/product_repo.dart';
import 'package:vendor_app/src/logic/repo/store_repo.dart';

class DaySelectionProvider with ChangeNotifier {
  final List<String> _selectedDays = [];
  List<String> get selectedDays => _selectedDays;

  void toggleDay(String day) {
    if (_selectedDays.contains(day)) {
      _selectedDays.remove(day);
    } else {
      _selectedDays.add(day);
    }
    notifyListeners(); // VERY IMPORTANT 🚨
  }

  // List<String> get selectedDays => _selectedDays;
  final _storeRepo = getIt<StoreRepo>();

  // void toggleDay(String day) {
  //   if (_selectedDays.contains(day)) {
  //     _selectedDays.remove(day);
  //   } else {
  //     _selectedDays.add(day);
  //   }
  //   notifyListeners();
  // }

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

  bool _editStore = false;

  bool get editStore => _editStore;

  setEditStore(bool type) {
    _editStore = type;
    notifyListeners();
  }

  File? _image;

  File? get image => _image;

  void setImage(File? image) {
    _image = image;
    notifyListeners();
  }

  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  File? get selectedImage => _selectedImage;

  // Method to pick an image
  Future<void> pickImage(BuildContext context) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _selectedImage = File(pickedFile.path);
      uploadImage(context);
      notifyListeners();
    }
  }

  File? _selectedBarcodeImage;

  File? get selectedBarcodeImage => _selectedBarcodeImage;

  Future<void> pickbarCodeImage(BuildContext context) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _selectedBarcodeImage = File(pickedFile.path);

      print("ksfhgkdfgkjdfg  ${_selectedBarcodeImage}");
      uploadBarcodeImage(context);
      notifyListeners();
    }
  }

  final _productRepo = getIt<ProductRepo>();
  String uploadedBarCodeUrl = '';

  Future<bool> uploadBarcodeImage(BuildContext context) async {
    context.showLoader(show: true);
    _isImageLoading = false;
    final result = await _productRepo.uploadImage(selectedBarcodeImage!);
    context.showLoader(show: false);

    return result.fold(
      (error) {
        context.showLoader(show: false);
        _showSnackBar(context, error.message, Colors.red);
        return false;
      },
      (uploadImage) {
        _isImageLoading = true;
        uploadedBarCodeUrl = uploadImage.data!.url.toString();
        context.showLoader(show: false);
        notifyListeners();

        _showSnackBar(context, "Image uploaxded successfully!", Colors.green);
        return true;
      },
    );
  }

  ////  create store /////////////////////////////////////////////////////

  TextEditingController bankName = TextEditingController();
  TextEditingController accountHoldername = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController ifscCode = TextEditingController();
  TextEditingController upiID = TextEditingController();
  TextEditingController appwithdrawalPin = TextEditingController();

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
      "storePicture": _uploadedUrl,
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
        "upiId": upiID.text,
        "qrCode": uploadedBarCodeUrl,
        "appWithdrawalPin": '1234'
      }
    };

    try {
      var result = await _storeRepo.createStore(data);

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
          content: Text("$e"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  bool _isImageLoading = false;
  bool get isImageLoading => _isImageLoading;

  String _uploadedUrl = '';

  Future<bool> uploadImage(BuildContext context) async {
    context.showLoader(show: true);
    _isImageLoading = false;
    final result = await _productRepo.uploadImage(selectedImage!);
    context.showLoader(show: false);

    return result.fold(
      (error) {
        context.showLoader(show: false);
        _showSnackBar(context, error.message, Colors.red);
        return false;
      },
      (uploadImage) {
        _isImageLoading = true;
        _uploadedUrl = uploadImage.data!.url.toString();
        notifyListeners();
        context.showLoader(show: false);

        _showSnackBar(context, "Image uploaxded successfully!", Colors.green);
        return true;
      },
    );
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    showTopSnackBar(context, message, color);
  }

  Future<bool> updateSore(BuildContext context, String id) async {
    context.showLoader(show: true);

    print("lkjdshfgkjhdfkgfh   ${upiID.text}  ${bankName.text}");

    var data = {
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
        "upiId": upiID.text,
        "qrCode": uploadedBarCodeUrl,
        "appWithdrawalPin": confirmPin.toString()
      }
    };

    print("dfhgkjhg  ${data}");

    try {
      var result = await _storeRepo.updateStore(data, id);

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
          content: Text("$e"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  bool isLoading = false;

  StoreModel? store_model;
  Future<void> getStore() async {
    isLoading = true;
    notifyListeners();

    final result = await _storeRepo.getStore({});
    result.fold(
      (error) {
        // Handle error
        isLoading = false;
        notifyListeners();
      },
      (store) {
        setEditStore(false);
        print("lksjdfdkjf  ${store.createdAt}");
        isLoading = false;
        store_model = store;
        notifyListeners();
      },
    );
  }

  Future<bool> vendorLogOut(BuildContext context) async {
    context.showLoader(show: true);

    var data = {};

    try {
      var result = await _storeRepo.vendorLogOut(data);

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
        (response) async {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Store created successful!"),
              backgroundColor: Colors.green,
            ),
          );
          await SharedPrefUtils.clear();
          context.clearAndPush(routePath: MyRoutes.SELECTACCOUNT);

          return true;
        },
      );
    } catch (e) {
      context.showLoader(show: false);
      print("Unexpected error: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("$e"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }
}
