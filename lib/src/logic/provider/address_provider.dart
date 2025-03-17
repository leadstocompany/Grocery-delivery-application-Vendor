import 'package:flutter/material.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';

import 'package:vendor_app/src/logic/repo/home_repo.dart';

class AddressProvider extends ChangeNotifier {
  bool ischeckpin = false;
 final _homeRepo = getIt<HomeRepo>();
  Future<bool> checkPin(BuildContext context, pin) async {
   
    ischeckpin = true;
    notifyListeners();
    var data = {};
    try {
      var result = await _homeRepo.checkPin(data, pin);

      return result.fold(
        (error) {
          ischeckpin = false;
          ischeckpin = false;
          return false;
        },
        (response) {
          ischeckpin = false;
          notifyListeners();
          return true;
        },
      );
    } catch (e) {
      ischeckpin = false;
      notifyListeners();
      return false;
    }
  }



  Future<bool> addAddress(BuildContext context, name, pincode, phone,
      alternatePhoneNumber, address, landmark, addresstype) async 
      {
    ischeckpin = false;

 //   final _homeRepo = getIt<HomeRepo>();

    notifyListeners();
    var data = {
      "name": name,
      "pincode": pincode,
      "phoneNumber": "+91$phone",
      "alternatePhoneNumber": "+91$alternatePhoneNumber",
      "addressLine": address,
      "landmark": landmark,
      "addressType": addresstype,
      "isDefault": false,
      "additionalInstructions": "Please ring doorbell twice"
    };
    try {
      var result = await _homeRepo.addAddress(data);

      return result.fold(
        (error) {
          ischeckpin = false;

          return false;
        },
        (response)
         {
          ischeckpin = false;
          notifyListeners();
          return true;
        },
      );
    } catch (e) {
      ischeckpin = false;
      notifyListeners();
      return false;
    }
  }



}
