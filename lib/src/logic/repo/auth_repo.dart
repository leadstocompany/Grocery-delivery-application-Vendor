import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vendor_app/src/core/utiils_lib/custom_dio_exception.dart';
import 'package:vendor_app/src/core/utiils_lib/response_type_def.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
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
}
