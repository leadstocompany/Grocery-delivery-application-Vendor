import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/presentation/onboarding/widget/first_screen.dart';
import 'package:vendor_app/src/presentation/onboarding/widget/second_screen.dart';
import 'package:vendor_app/src/presentation/onboarding/widget/third_screen.dart';

import '../../core/routes/routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController(keepPage: true);
    int selectedIndex = 0;
    return Scaffold(
      extendBody: true,
      backgroundColor: context.appColor.onSecondary,
      body: PageView(
        onPageChanged: (val) {
          selectedIndex = val;
        },
        controller: controller,
        children: const [
          FirstScreen(),
          SecondScreen(),
          ThirdScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 25.h),
        height: 90.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Align(
                alignment: Alignment
                    .centerLeft, // Aligns the SmoothPageIndicator to the left
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 9,
                    dotColor: Color(0xff81C14B),
                    activeDotColor: Color(0xff07393C),
                    dotWidth: 9,
                  ),
                ),
              ),
            ),
            // SmoothPageIndicator(
            //   controller: controller,
            //   count: 3,
            //   effect: const ExpandingDotsEffect(
            //     dotHeight: 9,
            //     dotColor: Color(0xff81C14B), activeDotColor: Color(0xff07393C),
            //     dotWidth: 9,
            //     // type: WormType.thinUnderground,
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 14.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text(
                      AppString.skip,
                      style: context.smallTxtStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      SharedPrefUtils.setFreshInstall(isFresh: false).then(
                        (value) => context.clearAndPush(
                            routePath: MyRoutes.SELECTACCOUNT, args: 0),
                      );
                    },
                  ),
                  Container(
                    height: 42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color(0xff380835),
                              Color(0xff894585),
                            ])),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          backgroundColor: Colors.transparent),
                      onPressed: () {
                        if (selectedIndex == 2) {
                          SharedPrefUtils.setFreshInstall(isFresh: false).then(
                            (value) => context.clearAndPush(
                                routePath: MyRoutes.SELECTACCOUNT, args: 0),
                          );
                        }
                        controller.animateToPage(selectedIndex + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                      child: Row(
                        children: 
                        [
                          Text(
                            AppString.next,
                            style: context.smallTxtStyle.copyWith(
                                fontSize: 14,
                                color: context.appColor.whiteColor),
                          ),
                          //const Gap(6),
                          Icon(
                            Icons.arrow_forward,
                            size: 18.sp,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
