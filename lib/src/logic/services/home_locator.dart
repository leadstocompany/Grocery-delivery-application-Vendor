import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vendor_app/src/core/constant/api.dart';
import 'package:vendor_app/src/core/network_services/api_services.dart';

class HomeService extends ApiService 
{
  Future getMe(data) async {
    var response = await api.get(APIURL.getMe, data: jsonEncode(data));
    //response.statusCode

    return response;
  }

   Future addAddress(data) async {
    var response = await api.post(APIURL.addAddress, data: jsonEncode(data));

    return response;
  }

    Future checkPin(data, pin) async {
    var response = await api.get(APIURL.checkPin + pin, data: jsonEncode(data));

    return response;
  }

  Future refresh_token(data) async {
    var response = await api.post(APIURL.refresh_token, data: jsonEncode(data));
    //response.statusCode

    return response;
  }

  Future getOrder(data) async {
    print("kjsdhgjdfg  $data");
    var response;
    if (data is Map && data.isEmpty) {
      // Check if data is an empty map
      print("kgjfnhkjfghfgfg  ${data}");
      response = await api.get(APIURL.myOrder, data: jsonEncode(data));
    } else {
      response = await api.get(APIURL.myOrder,
          data: jsonEncode(data), queryParameters: data);
    }

    //response.statusCode

    return response;
  }

  Future getAssignedOtp(data) async {
    var response =
        await api.post(APIURL.vendorOtpSubmit, data: jsonEncode(data));
    //response.statusCode

    return response;
  }

  Future updateStatus(data, orderItemId) async {
    var response = await api.patch(
        APIURL.updateStatus + orderItemId + "/status",
        data: jsonEncode(data));

    return response;
  }


      Future<Response> uploadImage(File imageFile,
      {Map<String, dynamic>? additionalFields}) async {
    const String url = APIURL.uploadImage;
    return await api.uploadImage(
      url,
      imageFile,
      additionalFields: additionalFields,
    );
  }

   Future updateProfile(data) async {
    var response =
        await api.patch(APIURL.updateProfile, data: jsonEncode(data));
    return response;
  }
}
