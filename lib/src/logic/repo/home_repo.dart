import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/custom_dio_exception.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/response_type_def.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/data/login_response.dart';
import 'package:vendor_app/src/data/vendor_model.dart';
import 'package:vendor_app/src/logic/services/home_locator.dart';

class HomeRepo {
  final HomeService _homeService;

  HomeRepo(this._homeService);

  FutureResult<String> refreshToken(data, BuildContext context) async {
    try {
      var response = await _homeService.refresh_token(data);
      LoginResponse loginResponse = loginResponseFromJson(response.toString());

      if (loginResponse.accessToken != null) {
        print("chwckData ${loginResponse.accessToken}");
        await SharedPrefUtils.setToken(
            authToken: loginResponse.accessToken ?? "");
        await SharedPrefUtils.setRefreshToken(
            refresh_token: loginResponse.refreshToken ?? "");
      }

      final String model = response.toString();

      return right(model);
    } on DioException catch (e) {
      context.clearAndPush(routePath: MyRoutes.SELECTACCOUNT);

      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<VendorModel> getMe(data) async {
    try {
      var response = await _homeService.getMe(data);

      final VendorModel vendorModel = vendorModelFromJson(response.toString());

      if (vendorModel != null) 
      {
        SharedPrefUtils.USER_NAME =
            vendorModel.firstName + " " + vendorModel.lastName;
            SharedPrefUtils.PHONE = vendorModel.phone;

        print("dkfjhdkfhkfk  ${SharedPrefUtils.USER_NAME}");
        await SharedPrefUtils.setStoreId(storeId: vendorModel.storeId ?? "");
      
      }

      final String model = response.toString();

      return right(vendorModel);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }
}
