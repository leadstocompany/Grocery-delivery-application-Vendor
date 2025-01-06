import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/presentation/pdf_viewer_page.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class SelectAccount extends StatefulWidget {
  const SelectAccount({super.key});

  @override
  State<SelectAccount> createState() => _SelectAccountState();
}

class _SelectAccountState extends State<SelectAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      AppImages.applogo,
                      height: 200,
                      width: 350,
                    ),
                    Positioned(
                      top: 105.h,
                      // bottom: 0,
                      child: Text(
                          'Experience business slaes on another \nlevel with ọjà, your market friendly app',
                          style: context.subTitleTextStyle),
                    )
                  ],
                ),
                Gap(60.h),
                signInBtn(),
                Gap(20.h),
                signUpBtn(),
                Gap(100.h),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: (){
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfViewerPage(
                            assetPath: 'assets/terms_and_conditions.pdf',
                          ),
                        ),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "By continuing, you agree to",
                        style: context.smallTxtStyle.copyWith(fontSize: 13.sp),
                        children: <TextSpan>[
                          TextSpan(
                              text: "ọjàs Terms & \nConditions ",
                              style: context.smallTxtStyle.copyWith(
                                  fontSize: 13.sp,
                                  color: context.appColor.primarycolor)),
                          TextSpan(
                              text: "And ",
                              style: context.smallTxtStyle
                                  .copyWith(fontSize: 13.sp)),
                          TextSpan(
                              text: "Privacy Policy",
                              style: context.smallTxtStyle.copyWith(
                                  fontSize: 13.sp,
                                  color: context.appColor.primarycolor)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _subLogo() {
    return Center(
      child: Image.asset(
        AppImages.applogo, // Replace with your logo path
        // Adjust height as necessary
      ),
    );
  }

  signInyourAccTxt() {
    return SizedBox(
      width: double.infinity,
      child: ButtonElevated(
        text: 'Next',
        onPressed: () {
          // if (_formKey.currentState?.validate() ?? false) {}
        },
        backgroundColor: context.appColor.primarycolor,
      ),
    );
  }

  signInBtn() {
    return SizedBox(
      width: double.infinity,
      child: ButtonElevated(
        text: 'Sign Up',
        onPressed: () {
          context.push(MyRoutes.SIGNUP);
          // if (_formKey.currentState?.validate() ?? false) {}
        },
        backgroundColor: context.appColor.primarycolor,
      ),
    );
  }

  signUpBtn() {
    return SizedBox(
        width: double.infinity,
        child: ButtonElevated(
          text: 'Sign In',
          textColor: context.appColor.blackColor,
          onPressed: () {
            context.clearAndPush(routePath: MyRoutes.LOGIN);
            // if (_formKey.currentState?.validate() ?? false) {}
          },
          backgroundColor: context.appColor.whiteColor,
          borderColor: context.appColor.primarycolor,
        ));
  }
}
