import 'dart:convert';

import 'package:vendor_app/src/core/constant/api.dart';
import 'package:vendor_app/src/core/network_services/api_services.dart';

class InsightsService extends ApiService {
  Future getInsights(data) async {
    var response = await api.get(APIURL.insightsTotalOrders,
        data: jsonEncode(data), queryParameters: data);

    return response;
  }

 Future getWallet(data) async {
    var response = await api.get(APIURL.getWallet,
        data: jsonEncode(data), queryParameters: data);

    return response;
  }

  

  Future insightsCompleteOrders(data) async {
    var response = await api.get(APIURL.insightsCompleteOrders,
        data: jsonEncode(data), queryParameters: data);

    return response;
  }
    Future insightsCancelledOrders(data) async {
    var response = await api.get(APIURL.insightsCancelledOrders,
        data: jsonEncode(data), queryParameters: data);

    return response;
  }
  Future insightsMostPopularItemOrders(data) async {
    var response = await api.get(APIURL.insightsMostPopularItemOrders,
        data: jsonEncode(data));
    return response;
  }
  



}
