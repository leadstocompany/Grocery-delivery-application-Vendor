import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/data/myOrder.dart';
import 'package:vendor_app/src/logic/repo/home_repo.dart';

class HomeProvider extends ChangeNotifier {
  final _homeRepo = getIt<HomeRepo>();

  Future<bool> refreshToken(BuildContext context) async {
    var data = {"refresh_token": "${await SharedPrefUtils.getRefreshToken()}"};

    var result = await _homeRepo.refreshToken(data, context);
    return result.fold(
      (error) {
        print("dkjhsfgjkdfkg");
        return true;
      },
      (response) {
        print("dkjhssfdgdfgdfgfgjkdfkg");
        return true;
      },
    );
  }

  String _userName = '';
  String _phone = '';

  String get userName => _userName;
  String get phone => _phone;

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void setPhone(String phoneNumber) {
    _phone = phoneNumber;
    notifyListeners();
  }

  Future<void> getMe() async {
    var data = {};

    try {
      var result = await _homeRepo.getMe(data);

      return result.fold(
        (error) {},
        (response) {
          setUserName(response.firstName + " " + response.lastName);
          setPhone(response.phone);

          SharedPrefUtils.USER_NAME =
              response.firstName + " " + response.lastName;
          SharedPrefUtils.PHONE = response.phone;
          notifyListeners();
        },
      );
    } catch (e) {}
  }

  List<DatumOrder> orderList = [];
  bool isloading = true;

  Future<void> getMyOrder(BuildContext context) async {
    print("kjdfghkldfjhgkjdfkg");
    var data = {};
    try {
      var result = await _homeRepo.getOrder(data);

      return result.fold(
        (error) {
          isloading = false;
          notifyListeners();
        },
        (response) {
          orderList = response.data!;
          isloading = false;
          notifyListeners();
        },
      );
    } catch (e) {
      isloading = false;
      notifyListeners();
    }
  }

  bool isSendOtp = false;

  Future<bool> getAssignedOtp(
      BuildContext context, String orderItemId, String otpCode) async {
    context.showLoader(show: true);

    var data = {"orderItemId": orderItemId, "otpCode": otpCode};
    try {
      var result = await _homeRepo.getAssignedOtp(data);

      return result.fold(
        (error) {
          context.showLoader(show: false);
          return false;
        },
        (response) {
          context.showLoader(show: false);
          return true;
        },
      );
    } catch (e) {
      context.showLoader(show: false);
      return false;
    }
  }

  Future<bool> updateStatus(
      BuildContext context, String orderStatus, String orderItemId) async {
    context.showLoader(show: true);

    var data = {"status": orderStatus, "comment": "string"};
    try {
      var result = await _homeRepo.updateStatus(data, orderItemId);

      return result.fold(
        (error) {
          context.showLoader(show: false);
          return false;
        },
        (response) {
          context.showLoader(show: false);
          Fluttertoast.showToast(
            msg: "Product Shipped successfully!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 14.0,
          );
          orderStatus = orderStatus;
          notifyListeners();

          return true;
        },
      );
    } catch (e) {
      context.showLoader(show: false);

      print("lkjdgkfjhfdkg");

      Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );

      return false;
    }
  }

  String orderStatus = '';

  String? _selectedStatus;

  String? get selectedStatus => _selectedStatus;

  void updateselectedStatus(
      BuildContext context, String newValue, String orderItemId) {
    _selectedStatus = newValue;
    notifyListeners(); // Notify UI to update
  }

  final List<String> statusOptions = [
    "SHIPPED",
    "CANCELLED",
  ];
}
