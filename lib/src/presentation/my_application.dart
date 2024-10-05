import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';

class MyApplication extends StatefulWidget {
  const MyApplication({super.key});

  @override
  State<MyApplication> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GlobalLoaderOverlay(
        overlayColor: context.appColor.whiteColor.withOpacity(0.5),
        useDefaultLoading: false,
        //  overlayWidgetBuilder: (progress) => const GlobalLoader(),
        child: MaterialApp.router(
          routerConfig: MyRoutes.router,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          //  title: AppString.appName,
          //    theme: CustomTheme.light(context),
          //   darkTheme: CustomTheme.dark(context),
        ),
      ),
    );
  }
}
