import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:gap/gap.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/logic/provider/PageNotifier.dart';
import 'package:vendor_app/src/logic/provider/login_provider.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class VerifyOtpForgetPassword extends StatefulWidget {
  const VerifyOtpForgetPassword({super.key});

  @override
  State<VerifyOtpForgetPassword> createState() =>
      _VerifyOtpForgetPasswordState();
}

class _VerifyOtpForgetPasswordState extends State<VerifyOtpForgetPassword> {
  String _numbersOnly = '';

  String _extractNumbers(String input) {
    final RegExp numberRegExp = RegExp(r'\d+');
    final Iterable<RegExpMatch> matches = numberRegExp.allMatches(input);
    final String numbers = matches.map((m) => m.group(0)).join();
    return numbers;
  }

  String? _otpCode;

  // @override
  // void initState() {
  //   super.initState();
  //   listenForCode(); // Start listening for OTP code from SMS
  // }

  // @override
  // void codeUpdated() {
  //   setState(() {
  //     _otpCode = code; // Update the OTP code when received
  //   });
  // }

  // @override
  // void dispose() {
  //   cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final pageNotifier = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Forget Password',
            style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "",
              style: context.subTitleTextStyle.copyWith(fontSize: 20.sp),
            ),
            Gap(10.h),
            Row(
              children: [
                // SizedBox(
                //     height: 18,
                //     width: 18,
                //     child: CircularProgressIndicator(
                //       strokeWidth: 2.5,
                //       backgroundColor: context.appColor.primary.withOpacity(0.4),
                //     )),
                const Gap(
                  8,
                ),
                Text(
                  AppString.autofetchingOTP,
                  style: context.smallTxtStyle.copyWith(fontSize: 13.sp),
                ),
              ],
            ),
            Gap(10.h),
            // Pinput(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            //   length: 6,
            //   defaultPinTheme: PinTheme(
            //     padding: EdgeInsets.symmetric(
            //       vertical: 10.h,
            //       horizontal: 12.w,
            //     ),
            //     decoration: BoxDecoration(
            //       color: context.appColor.greyColor100,
            //       borderRadius: BorderRadius.circular(4.r),
            //       border:
            //           Border.all(color: context.appColor.greyColor400, width: 1),
            //     ),
            //     textStyle: context.subTitleTextStyle.copyWith(fontSize: 20.sp),
            //   ),
            //   focusedPinTheme: PinTheme(
            //     decoration: BoxDecoration(
            //       color: context.appColor.greyColor100,
            //       borderRadius: BorderRadius.circular(4.r),
            //       border: Border.all(color: context.appColor.primary, width: 1),
            //     ),
            //     padding: EdgeInsets.symmetric(
            //       vertical: 10.h,
            //       horizontal: 12.w,
            //     ),
            //     textStyle: context.subTitleTextStyle.copyWith(fontSize: 20.sp),
            //   ),
            //   onChanged: (value) {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(
            //         content: Text("Enter a valid otp"),
            //       ),
            //     );
            //   },
            //   onCompleted: (value) async {
            //     // Only call `goToNextPage` once when the OTP is fully entered

            //     final success = await pageNotifier.verifiOtp(value, context);

            //     if (success) {
            //       pageNotifier.goToNextPage(); // Change page
            //     } else {
            //       // Show error if OTP sending fails
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text("Failed to send OTP. Please try again."),
            //         ),
            //       );
            //     }
            //   },
            // ),

            Pinput(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              length: 6,
              defaultPinTheme: PinTheme(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 12.w,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                ),
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              focusedPinTheme: PinTheme(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 12.w,
                ),
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              controller: TextEditingController(text: _otpCode), // Autofill OTP
              onChanged: (value) {
                // if (value.length < 6)
                //  {

                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text("Please enter a valid OTP."),
                //     ),
                //   );
                //   }
              },
              onCompleted: (value) async {
                if (value.length >= 6) {
                  _otpCode = value;
                  final success =
                      await pageNotifier.verifyForgetPassword(context, value);

                  if (success) {
                    context.push(MyRoutes.FORGETNEWPASSWORD);
                  } else {
                    // Show error if OTP sending fails
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Failed verify OTP. Please try again."),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Please enter a valid OTP."),
                    ),
                  );
                }
              },
            ),
            Gap(20.h),

            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: ButtonElevated(
                    backgroundColor: context.appColor.primarycolor,
                    text: AppString.continueTxt,
                    onPressed: () async {
                      final success = await pageNotifier.verifyForgetPassword(
                          context, _otpCode!);

                      if (success) {
                        context.push(MyRoutes.FORGETNEWPASSWORD);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text("Failed verify OTP. Please try again."),
                          ),
                        );
                      }
                    })),
            Gap(15.h),

            Gap(30.h),
          ],
        ),
      ),
    );
  }
}
