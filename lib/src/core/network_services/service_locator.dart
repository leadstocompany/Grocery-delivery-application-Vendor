

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vendor_app/src/core/network_services/dio_client.dart';
import 'package:vendor_app/src/logic/repo/auth_repo.dart';
import 'package:vendor_app/src/logic/repo/home_repo.dart';
import 'package:vendor_app/src/logic/repo/product_repo.dart';
import 'package:vendor_app/src/logic/repo/store_repo.dart';
import 'package:vendor_app/src/logic/services/home_locator.dart';
import 'package:vendor_app/src/logic/services/product_locator.dart';
import 'package:vendor_app/src/logic/services/service_locator.dart';
import 'package:vendor_app/src/logic/services/store_locator.dart';



GetIt getIt = GetIt.instance;

class ServiceLocator 
{
  static void setup() {
 
    // dio client
    getIt.registerSingleton(Dio());
    getIt.registerSingleton(DioClient(getIt<Dio>()));
    getIt.registerSingleton(AuthServices());
    getIt.registerSingleton(ProductService());
       getIt.registerSingleton(StoreService());
        getIt.registerSingleton(HomeService());

   // StoreRepo

    // getIt.registerSingleton(ContactApiService());
    // getIt.registerSingleton(BuzzService());
    // getIt.registerSingleton(CmsServices());
    // getIt.registerSingleton(SettingService());
    // getIt.registerSingleton(ActivityService());
  
    
    // Repos
    getIt.registerSingleton(AuthRepo(getIt<AuthServices>()));
     getIt.registerSingleton(ProductRepo(getIt<ProductService>()));
getIt.registerSingleton(StoreRepo(getIt<StoreService>()));
getIt.registerSingleton(HomeRepo(getIt<HomeService>()));
   
  }
}
