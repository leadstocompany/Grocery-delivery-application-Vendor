import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/logic/provider/PageNotifier.dart';
import 'package:vendor_app/src/logic/provider/crate_store_provider.dart';
import 'package:vendor_app/src/logic/provider/create_product_provider.dart';
import 'package:vendor_app/src/logic/provider/home_provider.dart';
import 'package:vendor_app/src/logic/provider/login_provider.dart';

class MyApplication extends StatefulWidget {
  const MyApplication({super.key});

  @override
  State<MyApplication> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  @override
  Widget build(BuildContext context) {
    return 
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GlobalLoaderOverlay(
        overlayColor: context.appColor.whiteColor.withOpacity(0.5),
        useDefaultLoading: false,
        //  overlayWidgetBuilder: (progress) => const GlobalLoader(),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => PageNotifier()),
            ChangeNotifierProvider(create: (_) => DaySelectionProvider()),
            ChangeNotifierProvider(create: (_) => LoginProvider()),
            ChangeNotifierProvider(create: (_) => ProductProvider()),
            ChangeNotifierProvider(create: (_) => HomeProvider()),
          ],
          child: MaterialApp.router(
            routerConfig: MyRoutes.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              canvasColor: const Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'GoogleSans',
              primarySwatch: Colors.blue,
            ),
            themeMode: ThemeMode.light,
            title: AppString.appName,
          ),
        ),
      ),
    );
 
 
  }
}
