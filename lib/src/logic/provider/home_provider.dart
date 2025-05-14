import 'dart:io';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/core/utiils_lib/snack_bar.dart';
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
        getMe(context);

        print("dkjhssfdgdfgdfgfgjkdfkg");
        return true;
      },
    );
  }

  String _userName = '';
  String _phone = '';
  String _profile = "";

  String get userName => _userName;
  String get phone => _phone;
  String get profile => _profile;

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  setuserprofile(String profile) {
    _profile = profile;
  }

  void setPhone(String phoneNumber) {
    _phone = phoneNumber;
    notifyListeners();
  }

  Future<void> getMe(BuildContext context) async {
    var data = {};

    try {
      var result = await _homeRepo.getMe(data, context);

      return result.fold(
        (error) {},
        (response) {
          if (response.address!) {
            context.clearAndPush(routePath: MyRoutes.DASHBOARDSCREEN);
          } else {
            context.clearAndPush(routePath: MyRoutes.ADDRESSS);
          }

          setUserName(response.firstName + " " + response.lastName);
          setPhone(response.phone);
          setuserprofile(response.img);

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

  Future<void> getMyOrder(BuildContext context, String orderItemStatus) async {
    var data;

    if (orderItemStatus.isEmpty) {
      data = {};
    } else {
      data = {'orderItemStatus': orderItemStatus};
    }

    print("kjdfghkldfjhgkjdfkg ${data} $orderItemStatus");
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
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.warning,
                  title: "${error.message}",
                  text: ""));
          context.showLoader(show: false);
          return false;
        },
        (response) {
          print("kjfgkjdfjkjgkfdjkgkj");
          context.showLoader(show: false);
          getMyOrder(context, "");

          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.success,
                  title: "Status Update",
                  text: "Your product successfully picked up"));
          return true;
        },
      );
    } catch (e) {
      print("jksdfhgkjdhfjkgjdkfgjkdjg");
      context.showLoader(show: false);
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
              type: ArtSweetAlertType.success, title: "${e}", text: ""));

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
  ];
  bool _isImageLoading = false;
  bool get isImageLoading => _isImageLoading;
  String _uploadedUrl = '';

  Future<bool> uploadImage(BuildContext context, File? _selectedImage) async {
    context.showLoader(show: true);
    _isImageLoading = false;
    final result = await _homeRepo.uploadImage(_selectedImage!);
    context.showLoader(show: false);

    return result.fold(
      (error) {
        _showSnackBar(context, error.message, Colors.red);
        return false;
      },
      (uploadImage) {
        _isImageLoading = true;
        _uploadedUrl = uploadImage.data!.url.toString();
        notifyListeners();

        _showSnackBar(context, "Image uploaded successfully !", Colors.green);
        return true;
      },
    );
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    showTopSnackBar(context, message, color);
  }

  Future<bool> updateProfile(
      BuildContext context, String firstName, String lastName) async {
    context.showLoader(show: true);
    var data;
    if (_uploadedUrl.isEmpty) {
      data = {
        "firstName": firstName,
        "lastName": lastName,
      };
    } else 
    {
      data = {
        "firstName": firstName,
        "lastName": lastName,
        "img": _uploadedUrl
      };
    }

    try {
      var result = await _homeRepo.updateProfile(data);

      context.showLoader(show: false);

      return result.fold(
        (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.message),
              backgroundColor: Colors.red,
            ),
          );
          return false;
        },
        (response) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Profile updated"),
              backgroundColor: Colors.green,
            ),
          );
          return true;
        },
      );
    } catch (e) {
      context.showLoader(show: false);

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
