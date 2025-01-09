import 'dart:convert';

import 'package:vendor_app/src/core/constant/api.dart';
import 'package:vendor_app/src/core/network_services/api_services.dart';

class ProductService extends ApiService
 {
  // Future createStore(data) async 
  // {
  //   var response = await api.get(APIURL.createStore, data: jsonEncode(data));
  //   return response;
  // }

  Future getProduct(data) async 
  {
    var response = await api.get(APIURL.getProduct, data: jsonEncode(data));
    return response;
  }

  

 }
