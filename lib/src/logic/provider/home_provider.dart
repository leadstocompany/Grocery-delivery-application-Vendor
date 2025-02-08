import 'package:flutter/material.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
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

  Future<void> getMyOrder(BuildContext context) async 
  {
    var data = {};
    try {
      var result = await _homeRepo.getOrder(data);

      return result.fold(
        (error) {
          isloading = false;
          notifyListeners();
        },
        (response) 
        {
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
}
