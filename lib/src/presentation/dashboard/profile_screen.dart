import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/logic/provider/crate_store_provider.dart';
import 'package:vendor_app/src/logic/provider/home_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _picker = ImagePicker();

  String? profile;
  File? _image;
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profile = pickedFile.path;
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var userName = Provider.of<HomeProvider>(context).userName;
    var profile = Provider.of<HomeProvider>(context).profile;
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
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      backgroundImage: (NetworkImage(profile!)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
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
      'icon': Icons.edit_square,
      'title': "Update Profile",
    },
    {
      'icon': Icons.description_outlined,
      'title': "Business Details",
    },
    {
      'icon': Icons.storefront_outlined,
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
    return Expanded(
      child: Container(
          //height: 300.h,
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
                          context.push(MyRoutes.EDITPROFILE);
                          break;

                        case 1:
                          context.push(
                            // MyRoutes.SETUPBUSSINESS,
                            MyRoutes.DETAILSBUSSINESS,
                            extra: {'status': '0'},
                          );
                          break;
                        case 2:
                          context.push(
                            MyRoutes.STOREMANAGEMENT,
                            extra: {'status': '0'},
                          );
                          break;
                        case 3:
                          context.push(
                            MyRoutes.SETTING,
                          );
                          break;

                        case 4:
                          context.push(
                            MyRoutes.LIVESUPPORT,
                          );
                          break;
                        case 5:
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
          )),
    );
  }
}
