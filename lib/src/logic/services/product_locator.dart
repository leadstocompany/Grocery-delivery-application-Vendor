import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vendor_app/src/core/constant/api.dart';
import 'package:vendor_app/src/core/network_services/api_services.dart';
import 'package:vendor_app/src/data/upload_image.dart';

class ProductService extends ApiService {
  // Future createStore(data) async
  // {
  //   var response = await api.get(APIURL.createStore, data: jsonEncode(data));
  //   return response;
  // }

  Future getProduct(data) async {
    var response = await api.get(APIURL.getProduct, data: jsonEncode(data));
    return response;
  }

  Future createProduct(data) async {
    var response = await api.post(APIURL.createProduct, data: jsonEncode(data));
    return response;
  }

  Future deleteProduct(data, id) async {
    var response =
        await api.delete(APIURL.deleteProduct + id, data: jsonEncode(data));
    return response;
  }

  Future updateProduct(data, id) async {
    var response =
        await api.patch(APIURL.updateProduct + id, data: jsonEncode(data));
    return response;
  }

  Future getCategoryByLevel(data) async {
    var response =
        await api.get(APIURL.getCategoryByLevel, data: jsonEncode(data));
    return response;
  }

  Future productTags(data) async
  {
    var response = await api.get(APIURL.productTags, data: jsonEncode(data));
    return response;
  }

  Future<Response> uploadImage(File imageFile,
      {Map<String, dynamic>? additionalFields}) async
       {
    const String url = APIURL.uploadImage;
    return await api.uploadImage(
      url,
      imageFile,
      additionalFields: additionalFields,
    );
  }


Future<Response> uploadImages(List<File> imageFiles,
      {Map<String, dynamic>? additionalFields}) async 
      {
    const String url = APIURL.uploadImages;
    return await api.uploadImages(
      url,
      imageFiles,
      additionalFields: additionalFields,
    );
  }




  
}
