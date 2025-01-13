import 'package:flutter/material.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/logic/repo/home_repo.dart';

class HomeProvider extends ChangeNotifier {
  final _homeRepo = getIt<HomeRepo>();
  
  
  
  Future<void> refreshToken(BuildContext context) async {
    var data = {
      "refresh_token": "${await SharedPrefUtils.getRefreshToken()}"
    };

    var result = await _homeRepo.refreshToken(data,context);
  }

    Future<void> getMe() async {
    var data = {};

    var result = await _homeRepo.getMe(data);
  }
}
