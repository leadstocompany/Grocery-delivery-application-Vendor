import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/logic/provider/create_product_provider.dart';
import 'package:vendor_app/src/logic/provider/home_provider.dart';
import 'package:vendor_app/src/presentation/dashboard/Insights_screen.dart';
import 'package:vendor_app/src/presentation/dashboard/order_screen.dart';
import 'package:vendor_app/src/presentation/dashboard/product_screen.dart';
import 'package:vendor_app/src/presentation/dashboard/profile_screen.dart';
import 'package:vendor_app/src/presentation/dashboard/wallet_screen.dart';

class DashboardScree extends StatefulWidget {
  const DashboardScree({super.key});

  @override
  State<DashboardScree> createState() => _DashboardScreeState();
}

class _DashboardScreeState extends State<DashboardScree> {
  PersistentTabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);

    Provider.of<HomeProvider>(context, listen: false).refreshToken();

    getvendordata();
  }

  getvendordata() {
    Future.delayed(const Duration(seconds: 10), () async 
    {
      Provider.of<HomeProvider>(context, listen: false).getMe();
    });
  }

  List<Widget> _buildScreens() {
    return [
      OrderScreen(),
      ProductScreen(),
      WalletScreen(),
      InsightsScreen(),
      ProfileScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Orders",
        activeColorPrimary: context.appColor.primarycolor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.grid_view_rounded),
        title: "Produc",
        activeColorPrimary: context.appColor.primarycolor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_balance_wallet_outlined),
        title: "Wallet",
        activeColorPrimary: context.appColor.primarycolor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.bar_chart),
        title: "Insights",
        activeColorPrimary: context.appColor.primarycolor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.portrait_outlined),
        title: "Profile",
        activeColorPrimary: context.appColor.primarycolor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style3, // Choose the style of the nav bar
      ),
    );
  }
}
