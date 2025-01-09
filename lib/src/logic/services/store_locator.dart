import 'dart:convert';

import 'package:vendor_app/src/core/constant/api.dart';
import 'package:vendor_app/src/core/network_services/api_services.dart';

class StoreService extends ApiService {
  Future createStore(data) async {
    var response = await api.post(APIURL.createStore, data: jsonEncode(data));
    return response;
  }

  Future getStore(data) async 
  {
    var response = await api.get(APIURL.getStore, data: jsonEncode(data));
    return response;
  }
}
