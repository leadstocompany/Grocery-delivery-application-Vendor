import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/logic/provider/crate_store_provider.dart';

class ProfileScreen extends StatefulWidget
 {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(10.h),
            Text(
              'Store Management',
              style: context.subTitleStyle,
            ),
            Gap(10.h),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: context.appColor.greyColor100),
                color: context.appColor.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          "",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              AppImages.Avatar,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            SharedPrefUtils.USER_NAME ?? "Hello Emekus",
                            style: context.subTitleStyle,
                          ),
                          Text(
                            SharedPrefUtils.PHONE ?? "",
                            style: context.subTitleTxtStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(20.h),
            Text(
              'Your store opening and closing hour',
              style: context.buttonTestStyle,
            ),
            Gap(10.h),
            _caardData()
          ],
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> productsC = [
    {
      'icon': Icons
          .description_outlined, // 'icon' is now treated as a dynamic field to handle IconData
      'title': "Business Details",
    },
    {
      'icon':
          Icons.storefront_outlined, // Handle image separately from the icon
      'title': "Store Management",
    },
    {
      'icon': Icons.settings,
      'title': "Settings",
    },
    {
      'icon': Icons.headphones_outlined,
      'title': "Live Support",
    },
    {
      'icon': Icons.login_outlined,
      'title': "Log Out",
    },
  ];

  Widget _caardData() {
    return Container(
        height: 300.h,
        decoration: BoxDecoration(
          border: Border.all(color: context.appColor.greyColor100),
          color: context.appColor.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: productsC.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    switch (index) {
                      case 0:
                        context.push(
                          // MyRoutes.SETUPBUSSINESS,
                          MyRoutes.DETAILSBUSSINESS,
                          extra: {'status': '0'},
                        );
                        break;
                      case 1:
                        context.push(
                          MyRoutes.STOREMANAGEMENT,
                          extra: {'status': '0'},
                        );
                        break;
                      case 2:
                        context.push(
                          MyRoutes.SETTING,
                        );
                        break;

                      case 4:
                        Provider.of<DaySelectionProvider>(context,
                                listen: false)
                            .vendorLogOut(context);

                        break;
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          productsC[index]['icon'],
                          size: 30.w,
                        ),
                        Gap(20.h),
                        Text(
                          productsC[index]['title'],
                          style: context.subTitleTextStyleBloack
                              .copyWith(fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
