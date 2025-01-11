import 'dart:convert';

import 'package:vendor_app/src/core/constant/api.dart';
import 'package:vendor_app/src/core/network_services/api_services.dart';

class HomeService extends ApiService {

   Future getMe(data) async {
    var response = await api.get(APIURL.getMe, data: jsonEncode(data));
    //response.statusCode

    return response;
  }

   Future refresh_token(data) async
    {
    var response = await api.post(APIURL.refresh_token, data: jsonEncode(data));
    //response.statusCode

    return response;
  }


  


}
