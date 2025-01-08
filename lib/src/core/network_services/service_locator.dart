

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vendor_app/src/core/network_services/dio_client.dart';
import 'package:vendor_app/src/logic/repo/auth_repo.dart';
import 'package:vendor_app/src/logic/repo/product_repo.dart';
import 'package:vendor_app/src/logic/services/product_locator.dart';
import 'package:vendor_app/src/logic/services/service_locator.dart';



GetIt getIt = GetIt.instance;

class ServiceLocator 
{
  static void setup() {
 
    // dio client
    getIt.registerSingleton(Dio());
    getIt.registerSingleton(DioClient(getIt<Dio>()));
    getIt.registerSingleton(AuthServices());
    getIt.registerSingleton(ProductService());

    // getIt.registerSingleton(ContactApiService());
    // getIt.registerSingleton(BuzzService());
    // getIt.registerSingleton(CmsServices());
    // getIt.registerSingleton(SettingService());
    // getIt.registerSingleton(ActivityService());
  
    
    // Repos
    getIt.registerSingleton(AuthRepo(getIt<AuthServices>()));
     getIt.registerSingleton(ProductRepo(getIt<ProductService>()));

    // getIt.registerSingleton(BuzzRepo(getIt<BuzzService>()));
    // getIt.registerSingleton(CmsRepo(getIt<CmsServices>()));
    // getIt.registerSingleton(ActivityRepository(getIt<ActivityService>()));
    // getIt.registerSingleton(SettingRepository(getIt<SettingService>()));
    // getIt.registerSingleton(ContactRepository(getIt<ContactApiService>()));
  }
}
