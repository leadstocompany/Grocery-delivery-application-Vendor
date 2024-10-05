import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 340.h,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                AppImages.onboarding3,
              )),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.9), // Shadow color with opacity
              // offset: Offset(0, 4), // Horizontal and vertical offset
              blurRadius: 15, // Increase blur radius for a softer edge
              spreadRadius: 2, // Spread radius
            ),
          ],
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 1.0, sigmaY: 1.0), // Adjust blur values as needed
          child: Container(
            height: 340.h,
            color: Colors.black.withOpacity(
                0.3), // Optional overlay for better text readability

            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80.h,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    width: MediaQuery.sizeOf(context).width - 18.w,
                    bottom: 120.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppString.connectPingShine,
                          style: context.titleStyle.copyWith(
                              fontSize: 25.sp, height: 1, color: Colors.white),
                        ),
                        Text(
                          AppString.getInstantAlertForPing,
                          style: context.subTitleTextStyle
                              .copyWith(fontSize: 15.sp, color: Colors.white),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
