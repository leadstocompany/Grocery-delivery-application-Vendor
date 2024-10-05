import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/logic/provider/PageNotifier.dart';


import 'widget/create_password.dart';
import 'widget/otp_screen.dart';
import 'widget/user_name_screen.dart';
import 'widget/phone_screen.dart';


class LoginHostScreen extends StatefulWidget {
  const LoginHostScreen({super.key});

  @override
  State<LoginHostScreen> createState() => _LoginHostScreenState();
}

class _LoginHostScreenState extends State<LoginHostScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageNotifier(),
      child: WillPopScope(
        onWillPop: () async {
          // System back button handling
          final pageNotifier =
              Provider.of<PageNotifier>(context, listen: false);
          if (pageNotifier.currentIndex > 0) {
            pageNotifier.goToPage(pageNotifier.currentIndex - 1);
            return false;
          }
          return true;
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Column(
                children: [
                  Row(
                    children: [
                      Consumer<PageNotifier>(
                        builder: (context, pageNotifier, child) {
                          return IconButton(
                            onPressed: () {
                              // Back button logic with Consumer
                              print(
                                  "PageNotifier currentIndex: ${pageNotifier.currentIndex}");
                              if (pageNotifier.currentIndex > 0) {
                                // Navigate to the previous page
                                pageNotifier
                                    .goToPage(pageNotifier.currentIndex - 1);
                              } else {
                                Navigator.of(context)
                                    .pop(); // Exit or pop screen if on the first page
                              }
                            },
                            icon: Icon(Icons.arrow_back_ios_rounded),
                          );
                        },
                      ),
                      Text(
                        '              Create your account',
                        style:
                            context.subTitleTextStyle.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                  Gap(20),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                    child: SizedBox(
                      child: Consumer<PageNotifier>(
                        builder: (context, pageNotifier, _) {
                          return LinearProgressIndicator(
                            value: pageNotifier.progress,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 520.h,
                    width: MediaQuery.sizeOf(context).width,
                    child: Consumer<PageNotifier>(
                      builder: (context, pageNotifier, _) {
                        return PageView(
                          controller: pageNotifier.pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: const [
                            PhoneScreen(), // Page 1
                            OtpScreen(), // Page 2
                            UserNameScreen(), // Page 3
                            CreatePassword() // Page 4
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
