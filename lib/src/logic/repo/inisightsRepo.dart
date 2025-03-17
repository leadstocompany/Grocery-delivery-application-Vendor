import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vendor_app/src/core/utiils_lib/custom_dio_exception.dart';
import 'package:vendor_app/src/core/utiils_lib/response_type_def.dart';
import 'package:vendor_app/src/data/insights.dart';
import 'package:vendor_app/src/data/most_populer_product.dart';
import 'package:vendor_app/src/data/prdouct_model.dart';
import 'package:vendor_app/src/data/total_calcel_product.dart';
import 'package:vendor_app/src/data/vendor_wallet.dart';
import 'package:vendor_app/src/logic/services/insights_service.dart';

class InsightsRepo {
  final InsightsService _insightsService;

  InsightsRepo(this._insightsService);

  FutureResult<InsightsTotalOrder> getInsights(data) async {
    try {
      var response = await _insightsService.getInsights(data);

      final InsightsTotalOrder prdouctModel =
          insightsTotalOrderFromJson(response.toString());

      return right(prdouctModel);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<VendorWallet> getWallet(data) async {
    try {
      var response = await _insightsService.getWallet(data);

      print("kjdkjfgjkjgghgg    ${response}");

      final VendorWallet prdouctModel =
          vendorWalletFromJson(response.toString());
      print("fdgrdgfdgfgdfghfghg    ${response}");
      return right(prdouctModel);
    } on DioException catch (e) {
      print("djfkgjgfkj  $e");
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<InsightsTotalOrder> insightsCompleteOrders(data) async {
    try {
      var response = await _insightsService.insightsCompleteOrders(data);

      final InsightsTotalOrder prdouctModel =
          insightsTotalOrderFromJson(response.toString());

      return right(prdouctModel);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<InsightsTotalCancelledOrder> insightsCancelledOrders(
      data) async {
    try {
      var response = await _insightsService.insightsCancelledOrders(data);

      final InsightsTotalCancelledOrder prdouctModel =
          insightsTotalCancelledOrderFromJson(response.toString());

      return right(prdouctModel);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<MostPopularProduct> insightsMostPopularItemOrders(data) async {
    try {
      var response = await _insightsService.insightsMostPopularItemOrders(data);

      final MostPopularProduct prdouctModel =
          mostPopularProductFromJson(response.toString());

      return right(prdouctModel);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }
}
