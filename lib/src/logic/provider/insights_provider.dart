import 'package:flutter/material.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
import 'package:vendor_app/src/data/insights.dart';
import 'package:vendor_app/src/data/most_populer_product.dart';
import 'package:vendor_app/src/data/total_calcel_product.dart';
import 'package:vendor_app/src/data/vendor_wallet.dart';
import 'package:vendor_app/src/logic/repo/home_repo.dart';
import 'package:vendor_app/src/logic/repo/inisightsRepo.dart';

class InsightsProvider extends ChangeNotifier {
  final _insightsRepo = getIt<InsightsRepo>();

  InsightsTotalOrder orderList = InsightsTotalOrder();
  bool isloading = true;
  int _totalOrder = 0;

  String _growth = "0";

  int get totalOrder => _totalOrder;
  String get growth => _growth;

  Future<void> getTotalOrder(BuildContext context) async {
    var now = DateTime.now();
    var data = {
      "periodType": "month",
      "year": now.year.toString(),
      "month": now.month.toString().padLeft(2, '0')
    };

    print("ksjfhgsdjhfg ${data}");

    try {
      var result = await _insightsRepo.getInsights(data);

      return result.fold(
        (error) {
          isloading = false;
          notifyListeners();
        },
        (response) {
          orderList = response;
          _totalOrder = response.totalOrders!;
          _growth = response.growthPercentage ?? "0";
          isloading = false;
          notifyListeners();
        },
      );
    } catch (e) {
      isloading = false;
      notifyListeners();
    }
  }

  int _totalCompletedOrder = 0;

  String _growthCompleted = "0";

  int get totalCompletedOrder => _totalCompletedOrder;
  String get growthCompleted => _growthCompleted;

  Future<void> getTotalcompletedOrder(BuildContext context) async {
    var now = DateTime.now();
    var data = {
      "periodType": "month",
      "year": now.year.toString(),
      "month": now.month.toString().padLeft(2, '0')
    };

    print("ksjfhgsdjhfg ${data}");

    try {
      var result = await _insightsRepo.insightsCompleteOrders(data);

      return result.fold(
        (error) {
          isloading = false;
          notifyListeners();
        },
        (response) {
          _totalCompletedOrder = response.totalOrders!;
          _growthCompleted = response.growthPercentage ?? "0";
          isloading = false;
          notifyListeners();
        },
      );
    } catch (e) {
      isloading = false;
      notifyListeners();
    }
  }

  int _totalcancelledOrder = 0;

  String _growthCancelled = "0";

  int get totalcancelledOrder => _totalcancelledOrder;
  String get growthCancelled => _growthCancelled;

  Future<void> getTotalCancelledOrder(BuildContext context) async {
    var now = DateTime.now();
    var data = {
      "periodType": "month",
      "year": now.year.toString(),
      "month": now.month.toString().padLeft(2, '0')
    };

    print("ksjfhgsdjhfg ${data}");

    try {
      var result = await _insightsRepo.insightsCancelledOrders(data);

      return result.fold(
        (error) {
          isloading = false;
          notifyListeners();
        },
        (response) {
          print("dfhgkjfjg  ${response.totalCancelledOrders}");
          _totalcancelledOrder = response.totalCancelledOrders!;
          _growthCancelled = response.growthPercentage ?? "0";
          isloading = false;
          notifyListeners();
        },
      );
    } catch (e) {
      isloading = false;
      notifyListeners();
    }
  }

  // String _totalcancelledOrder = '0';

  // String _growthCancelled = "0";

  // String get totalcancelledOrder => _totalcancelledOrder;
  // String get growthCancelled => _growthCancelled;

  List<Datum> mostpopulerproductlist = [];
  bool productLoading = true;

  Future<void> getMostPopularProduct(BuildContext context) async {
    var now = DateTime.now();
    var data = {};

    print("ksjfhgsdjhfg ${data}");

    try {
      var result = await _insightsRepo.insightsMostPopularItemOrders(data);

      return result.fold(
        (error) {
          productLoading = false;
          notifyListeners();
        },
        (response) {
          mostpopulerproductlist = response.data!;
          // _totalcancelledOrder = response.totalOrders.toString();
          // _growthCancelled = response.growthPercentage ?? "0";
          productLoading = false;
          notifyListeners();
        },
      );
    } catch (e) {
      productLoading = false;
      notifyListeners();
    }
  }

  List<WalletData> walletList = [];
  bool productLisLoadingWallet = true;

  Future<void> getVendorWallet(BuildContext context) async {
    var now = DateTime.now();
    var data = {"week": true};

    print("ksjfhgsdjhfg ${data}");

    try {
      var result = await _insightsRepo.getWallet(data);

      return result.fold(
        (error) {
          productLisLoadingWallet = false;
          notifyListeners();
        },
        (response) {
          walletList = response.data!;

          print("kjdhfgkjhjg  ${walletList}");
          // _totalcancelledOrder = response.totalOrders.toString();
          // _growthCancelled = response.growthPercentage ?? "0";
          productLisLoadingWallet = false;
          notifyListeners();
        },
      );
    } catch (e) {
      productLisLoadingWallet = false;
      notifyListeners();
    }
  }



}
