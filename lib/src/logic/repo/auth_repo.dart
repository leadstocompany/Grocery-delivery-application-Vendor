import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vendor_app/src/core/utiils_lib/custom_dio_exception.dart';
import 'package:vendor_app/src/core/utiils_lib/response_type_def.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/data/createStoreModel.dart';
import 'package:vendor_app/src/data/login_response.dart';
import 'package:vendor_app/src/data/password_model.dart';
import 'package:vendor_app/src/data/vendor_otpModel.dart';
import 'package:vendor_app/src/logic/services/service_locator.dart';

class AuthRepo {
  final AuthServices _authServices;

  AuthRepo(this._authServices);

  FutureResult<String> sendOtp(data) async {
    try {
      var response = await _authServices.sendOtp(data);
      final String model = response.toString();
      return right(model);
    } on DioException catch (e) {
      print("dhfgfdgjdhfgfgh  ${e}");
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<VendorOtpModel> verifyOtp(data) async {
    try {
      var response = await _authServices.verifyOtp(data);

      final VendorOtpModel vendorOtpModel =
          vendorOtpModelFromJson(response.toString());

      if (vendorOtpModel.data != null) {
        await SharedPrefUtils.setToken(
            authToken: vendorOtpModel.data!.accessToken ?? "");
      }

      //  final String model = response.toString();

      return right(vendorOtpModel);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<LoginResponse> login(data) async {
    try {
      var response = await _authServices.login(data);

      LoginResponse loginResponse = loginResponseFromJson(response.toString());
      if (loginResponse.accessToken != null) {
        await SharedPrefUtils.setToken(
            authToken: loginResponse.accessToken ?? "");
      }

      print("Response status code: ${response.statusCode}");

      return right(loginResponse);
    } on DioException catch (e) {
      print("DioException occurred: $e");

      if (e.response != null) {
        int statusCode = e.response!.statusCode ?? 0;
        var errorData = e.response!.data; // Error body from the server

        String errorMessage =
            errorData['message']['message'] ?? 'Unknown error';

        print("Error: $errorMessage (Status Code: $statusCode)");

        // Custom error handling
        var error = CustomDioExceptions.handleError(e);
        return left(error);
      } else {
        // Handle other DioExceptions without a response (e.g., network issues)
        var error = CustomDioExceptions.handleError(e);
        return left(error);
      }
    }
  }

  FutureResult<String> vendorRegister(data) async {
    try {
      var response = await _authServices.vendorRegister(data);
      final String model = response.toString();
      return right(model);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<String> createStore(data) async {
    try {
      var response = await _authServices.createStore(data);

      final String model = response.toString();
      return right(model);
    } on DioException catch (e) {
      print("kdjfgkjfg ${e}");
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<String> forgetPassword(data) async {
    try {
      var response = await _authServices.forgetPassword(data);
      final String model = response.toString();
      return right(model);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<String> verifyForgetPassword(data) async {
    try {
      var response = await _authServices.verifyForgetPassword(data);

      PasswordModel passwordModel = passwordModelFromJson(response.toString());
      if (passwordModel.data != null) {
        print("JHGhjhg   ${passwordModel.data!.resetToken}");
        await SharedPrefUtils.setResetToken(
            resetToken: passwordModel.data!.resetToken ?? "");
      }

      final String model = response.toString();
      return right(model);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<String> reset_password(data) async {
    try {
      var response = await _authServices.reset_password(data);
      final String model = response.toString();
      return right(model);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }
}
