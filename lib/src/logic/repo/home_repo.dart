import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vendor_app/src/core/constant/api.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/custom_dio_exception.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/response_type_def.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/data/check_pin_response.dart';
import 'package:vendor_app/src/data/login_response.dart';
import 'package:vendor_app/src/data/myOrder.dart';
import 'package:vendor_app/src/data/upload_image.dart';
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
        // context.clearAndPush(routePath: MyRoutes.DASHBOARDSCREEN);
      }

      final String model = response.toString();

      return right(model);
    } on DioException catch (e) {
      context.clearAndPush(routePath: MyRoutes.SELECTACCOUNT);

      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<MyOrder> getOrder(data) async {
    try {
      var response = await _homeService.getOrder(data);
      MyOrder productCategory = myOrderFromJson(response.toString());
      return right(productCategory);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<String> getAssignedOtp(data) async {
    try {
      var response = await _homeService.getAssignedOtp(data);

      final String model = response.toString();
      return right(model);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);

      print("kjhgkjdfhgkdfgkjfdg   ${error}");
      return left(error);
    }
  }

  FutureResult<String> updateStatus(data, orderItemId) async {
    try {
      var response = await _homeService.updateStatus(data, orderItemId);

      final String model = response.toString();
      return right(model);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<VendorModel> getMe(data, context) async {
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

        await SharedPrefUtils.setFistName(firstName: vendorModel.name ?? "");

        await SharedPrefUtils.setLastName(LastName: vendorModel.lastName ?? "");

            await SharedPrefUtils.setProfilePicUrl(
    profileUrl: vendorModel.img?? "");
      }

      final String model = response.toString();

      return right(vendorModel);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<String> addAddress(data) async {
    try {
      var response = await _homeService.addAddress(data);

      final String model = response.toString();

      return right(model);
    } on DioException catch (e) {
      print("djhgfjdfhjg  ${e}");
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<CheckPinResponse> checkPin(data, pin) async {
    try {
      var response = await _homeService.checkPin(data, pin);
      CheckPinResponse allCartItems =
          checkPinResponseFromJson(response.toString());

      return right(allCartItems);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<UploadImage> uploadImage(File imageFile) async {
    try {
      final response = await _homeService.uploadImage(imageFile);
      UploadImage upload = uploadImageFromJson(response.toString());
      return right(upload);
    } on DioException catch (e) {
      final error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<String> updateProfile(data) async {
    try {
      var response = await _homeService.updateProfile(data);

      final String model = response.toString();
      return right(model);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }
}
