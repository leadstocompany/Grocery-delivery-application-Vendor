import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/logic/provider/home_provider.dart';

import '../core/routes/routes.dart';

/// Splash screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      if (await SharedPrefUtils.isFreshInstall()) {
        context.clearAndPush(routePath: MyRoutes.ONBOARDING);
      } else {
        if (await SharedPrefUtils.getToken() == "1" ||
            await SharedPrefUtils.getToken() == null)
             {
          context.clearAndPush(routePath: MyRoutes.SELECTACCOUNT);
        } else {
          Provider.of<HomeProvider>(context, listen: false)
              .refreshToken(context);
          Provider.of<HomeProvider>(context, listen: false).getMe();

          // context.clearAndPush(routePath: MyRoutes.DASHBOARDSCREEN);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/splashscreen.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
